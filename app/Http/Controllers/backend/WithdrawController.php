<?php

namespace App\Http\Controllers\backend;

use App\Model\AccountChange;
use App\Model\MemberBalance;
use App\Model\Withdraw;
use App\Model\Member;
use Illuminate\Http\Request;
use App\Http\Controllers\MyController;
use Illuminate\Support\Facades\DB;
use App\Http\Requests;

class WithdrawController extends MyController
{
    //站长提款审核列表
    public function applywithdraw(Request $request){
        if($request->isMethod('post'))
        {
            $member = request()->input('member');
            $WithdrawArray = Withdraw::select('withdraw_order.*','member.name','withdraw_info.account_name','withdraw_info.bank_number','bank.bank_name')
                ->leftJoin('member',function ($join){
                    $join->on('member.member_id','=','withdraw_order.member_id');
                })
                ->leftJoin('withdraw_info',function ($join){
                    $join->on('withdraw_info.withdraw_info_id','=','withdraw_order.withdraw_info_id');
                })
                ->leftJoin('bank',function ($join){
                    $join->on('bank.bank_id','=','withdraw_info.bank_id');
                })
                ->where('member.name','like',$member . '%')
                ->where('withdraw_order.status',0)
                ->orderBy('withdraw_order.created_at', 'desc')->paginate($this->backendPageNum);
        }else{
            $WithdrawArray = Withdraw::select('withdraw_order.*','member.name','withdraw_info.account_name','withdraw_info.bank_number','bank.bank_name')
                ->leftJoin('member',function ($join){
                    $join->on('member.member_id','=','withdraw_order.member_id');
                })
                ->leftJoin('withdraw_info',function ($join){
                    $join->on('withdraw_info.withdraw_info_id','=','withdraw_order.withdraw_info_id');
                })
                ->leftJoin('bank',function ($join){
                    $join->on('bank.bank_id','=','withdraw_info.bank_id');
                })
                ->where('withdraw_order.status',0)
                ->orderBy('withdraw_order.created_at', 'desc')->paginate($this->backendPageNum);
        }
        return view('backend.withdrawlist', compact('WithdrawArray'))->with('admin', session('admin'));
    }

    //处理站长提款订单
    public function dealwithdraworder(Request $request,$withdraw_id){
        $WithdrawDetail = Withdraw::select('withdraw_order.*','member.name','withdraw_info.account_name','withdraw_info.bank_number','bank.bank_name')
            ->leftJoin('member',function ($join){
                $join->on('member.member_id','=','withdraw_order.member_id');
            })
            ->leftJoin('withdraw_info',function ($join){
                $join->on('withdraw_info.withdraw_info_id','=','withdraw_order.withdraw_info_id');
            })
            ->leftJoin('bank',function ($join){
                $join->on('bank.bank_id','=','withdraw_info.bank_id');
            })
            ->where('withdraw_order.withdraw_id',$withdraw_id)
            ->get()->toArray();
        return view('backend.dealwithdraworder', compact('WithdrawDetail'));
    }

    //更新确认站长的提款申请订单
    public function updatewithdraworder(Request $request,$withdraw_id){
        if($request->isMethod('post'))
        {
            $status = request()->input('status');
            $remark = request()->input('remark');
            if($status == 1)
            {
                //提款成功,冻结的奖金扣减
                DB::beginTransaction();
                try{
                    //行锁
                    $OrderDetail = Withdraw::where('withdraw_id',$withdraw_id)->where('status',0)->lockForUpdate()->get()->toArray();
                    $MemberDetail = Member::where('member_id',$OrderDetail[0]['member_id'])->lockForUpdate()->get()->toArray();
                    $MemberBalance = MemberBalance::where('id',$OrderDetail[0]['member_id'])->lockForUpdate()->get()->toArray();
                    if($MemberDetail[0]['frozen'] < $OrderDetail[0]['money'])
                    {
                        DB::rollBack();
                        $data['status'] = 0;
                        $data['msg'] = "冻结金额比提款金额要小，可能作弊，请注意";
                        echo json_encode($data);
                        exit;
                    }
                    $result = Withdraw::where('withdraw_id', $withdraw_id)->update(['status' => $status, 'remark' => $remark]);

                    $result1 = Member::where('member_id',$OrderDetail[0]['member_id'])->decrement('frozen',$OrderDetail[0]['money']);
                    if($result and $result1)
                    {
                        DB::commit();
                        $data['status'] = 1;
                        $data['msg'] = "提款订单处理成功";
                        echo json_encode($data);
                    }else{
                        DB::rollBack();
                        $data['status'] = 0;
                        $data['msg'] = "提款订单处理失败";
                        echo json_encode($data);
                    }

                }catch (\Exception $e) {
                    DB::rollBack();
                    $data['status'] = 0;
                    $data['msg'] = "Error!";
                    echo json_encode($data);
                }



            }else{
                //提款关闭，那就要把该站长冻结的资金退回到balance总额里面
                DB::beginTransaction();
                try{
                    //行锁
                    $OrderDetail = Withdraw::where('withdraw_id',$withdraw_id)->where('status',0)->lockForUpdate()->get()->toArray();
                    $MemberDetail = Member::where('member_id',$OrderDetail[0]['member_id'])->lockForUpdate()->get()->toArray();
                    $MemberBalance = MemberBalance::where('id',$OrderDetail[0]['member_id'])->lockForUpdate()->get()->toArray();
                    if($MemberDetail[0]['frozen'] < $OrderDetail[0]['money'])
                    {
                        DB::rollBack();
                        $data['status'] = 0;
                        $data['msg'] = "冻结金额比提款金额要小，可能作弊，请注意";
                        echo json_encode($data);
                        exit;
                    }
                    $result = Withdraw::where('withdraw_id', $withdraw_id)->update(['status' => $status, 'remark' => $remark]);

                    //帐变
                    $accountChange = array();
                    $accountChange['memberId'] = $OrderDetail[0]['member_id'];
                    $accountChange['acType'] ='171';
                    $accountChange['moreorless'] = 1;
                    $accountChange['balanceBeforeChange'] = $MemberBalance[0]['balance'];
                    $accountChange['balance'] = $MemberBalance[0]['balance']+$OrderDetail[0]['money'];
                    $accountChange['remark'] = '站长提款后台取消';
                    $accountChange['details'] = '';
                    $accountChange['time'] = date('Y-m-d H:i:s',time());
                    $accountChange['relateId'] = $withdraw_id;
                    $result3 = AccountChange::create($accountChange);

                    $result1 = MemberBalance::where('id',$OrderDetail[0]['member_id'])->increment('balance',$OrderDetail[0]['money']);
                    $result2 = Member::where('member_id',$OrderDetail[0]['member_id'])->decrement('frozen',$OrderDetail[0]['money']);
                    if($result and $result1 and $result2 and !empty($result3->id))
                    {
                        DB::commit();
                        $data['status'] = 1;
                        $data['msg'] = "提款订单关闭成功";
                        echo json_encode($data);
                    }else{
                        DB::rollBack();
                        $data['status'] = 0;
                        $data['msg'] = "提款订单关闭失败";
                        echo json_encode($data);
                    }
                }catch (\Exception $e) {
                    DB::rollBack();
                    $data['status'] = 0;
                    $data['msg'] = "Error!";
                    echo json_encode($data);
                }
            }

        }
    }

    //站长提款记录列表
    public function withdrawrecord(Request $request)
    {
        if ($request->isMethod('post')) {
            $member = request()->input('member');

            $WithdrawArray = Withdraw::select('withdraw_order.*', 'member.name', 'withdraw_info.account_name', 'withdraw_info.bank_number', 'bank.bank_name')
                ->leftJoin('member', function ($join) {
                    $join->on('member.member_id', '=', 'withdraw_order.member_id');
                })
                ->leftJoin('withdraw_info', function ($join) {
                    $join->on('withdraw_info.withdraw_info_id', '=', 'withdraw_order.withdraw_info_id');
                })
                ->leftJoin('bank', function ($join) {
                    $join->on('bank.bank_id', '=', 'withdraw_info.bank_id');
                })
                ->where('withdraw_order.status', '!=', 0)
                ->where('member.name', 'like', $member . '%')
                ->orderBy('withdraw_order.created_at', 'desc')->paginate($this->backendPageNum);

        } else {

            $WithdrawArray = Withdraw::select('withdraw_order.*', 'member.name', 'withdraw_info.account_name', 'withdraw_info.bank_number', 'bank.bank_name')
                ->leftJoin('member', function ($join) {
                    $join->on('member.member_id', '=', 'withdraw_order.member_id');
                })
                ->leftJoin('withdraw_info', function ($join) {
                    $join->on('withdraw_info.withdraw_info_id', '=', 'withdraw_order.withdraw_info_id');
                })
                ->leftJoin('bank', function ($join) {
                    $join->on('bank.bank_id', '=', 'withdraw_info.bank_id');
                })
                ->where('withdraw_order.status', '!=', 0)
                ->orderBy('withdraw_order.created_at', 'desc')->paginate($this->backendPageNum);

        }
        return view('backend.withdrawrecord', compact('WithdrawArray'))->with('admin', session('admin'));

    }







}
