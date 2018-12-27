<?php

namespace App\Http\Controllers\backend;

use App\Model\AccountChange;
use App\Model\Deposit;
use App\Model\Member;
use App\Model\MemberBalance;
use Illuminate\Http\Request;
use App\Http\Controllers\MyController;
use Illuminate\Support\Facades\DB;
use App\Http\Requests;

class DepositController extends MyController
{
    //广告商充值审核列表
    public function applydeposit(Request $request){
        if($request->isMethod('post'))
        {
            $member = request()->input('member');
            $DepositArray = Deposit::select('deposit.*','member.name')->where('deposit.status',0)
                ->leftJoin('member',function ($join){
                    $join->on('member.member_id','=','deposit.member_id');
                })
                ->where('member.name','like',$member . '%')
                ->orderBy('deposit.created_at', 'desc')->paginate($this->backendPageNum);
        }else{
            $DepositArray = Deposit::select('deposit.*','member.name')->where('deposit.status',0)
                ->leftJoin('member',function ($join){
                    $join->on('member.member_id','=','deposit.member_id');
                })
                ->orderBy('deposit.created_at', 'desc')->paginate($this->backendPageNum);
        }
        return view('backend.depositlist', compact('DepositArray'))->with('admin', session('admin'));
    }

    //处理广告商充值订单
    public function dealdepositorder(Request $request,$deposit_id){
        $DepositDetail = Deposit::select('deposit.*','member.name')->where('deposit.deposit_id',$deposit_id)
            ->leftJoin('member',function ($join){
                $join->on('member.member_id','=','deposit.member_id');
            })->get()->toArray();
        return view('backend.dealdepositorder', compact('DepositDetail'));
    }

    //更新确认广告商充值订单
    public function updatedepositorder(Request $request,$deposit_id){
        if($request->isMethod('post'))
        {
            $status = request()->input('status');
            $remark = request()->input('remark');
            $member_id = request()->input('member_id');
            if($status == 1)
            {
                //充值成功
                DB::beginTransaction();
                try{
                    //行锁
                    $OrderDetail = Deposit::where('deposit_id',$deposit_id)->where('status',0)->lockForUpdate()->get()->toArray();
                    $MemberBalance = MemberBalance::where('id',$member_id)->lockForUpdate()->get()->toArray();

                    $result = Deposit::where('deposit_id', $deposit_id)->update(['status' => $status, 'remark' => $remark]);

                    //帐变
                    $accountChange = array();
                    $accountChange['memberId'] = $member_id;
                    $accountChange['acType'] ='157';
                    $accountChange['moreorless'] = 1;
                    $accountChange['balanceBeforeChange'] = $MemberBalance[0]['balance'];
                    $accountChange['balance'] = $MemberBalance[0]['balance']+$OrderDetail[0]['money'];
                    $accountChange['remark'] = '广告商充值';
                    $accountChange['details'] = '';
                    $accountChange['time'] = date('Y-m-d H:i:s',time());
                    $accountChange['relateId'] = $deposit_id;
                    $result2 = AccountChange::create($accountChange);

                    $result1 = MemberBalance::where('id',$OrderDetail[0]['member_id'])->increment('balance',$OrderDetail[0]['money']);


                    if($result and $result1 and !empty($result2->id))
                    {
                        DB::commit();
                        $data['status'] = 1;
                        $data['msg'] = "充值订单处理成功";
                        echo json_encode($data);
                    }else{
                        DB::rollBack();
                        $data['status'] = 0;
                        $data['msg'] = "充值订单处理失败";
                        echo json_encode($data);
                    }
                }catch (\Exception $e) {
                    DB::rollBack();
                    $data['status'] = 0;
                    $data['msg'] = "Error!";
                    echo json_encode($data);
                }
            }else{
                //充值不成功的，只改变该订单的状态
                $result = Deposit::where('deposit_id', $deposit_id)->update(['status' => $status, 'remark' => $remark]);
                if ($result) {
                    $data['status'] = 1;
                    $data['msg'] = "充值订单更新成功";
                } else {
                    $data['status'] = 0;
                    $data['msg'] = "充值订单更新失败";
                }
                echo json_encode($data);
            }
        }
    }

    //广告商充值记录列表
    public function depositrecord(Request $request){
        if($request->isMethod('post'))
        {
            $member = request()->input('member');
            $DepositArray = Deposit::select('deposit.*','member.name')->where('deposit.status','!=','0')
                ->leftJoin('member',function ($join){
                    $join->on('member.member_id','=','deposit.member_id');
                })
                ->where('member.name','like',$member . '%')
                ->orderBy('deposit.updated_at', 'desc')->paginate($this->backendPageNum);

        }else{
            $DepositArray = Deposit::select('deposit.*','member.name')->where('deposit.status','!=','0')
                ->leftJoin('member',function ($join){
                    $join->on('member.member_id','=','deposit.member_id');
                })
                ->orderBy('deposit.updated_at', 'desc')->paginate($this->backendPageNum);
        }
        return view('backend.depositrecord', compact('DepositArray'))->with('admin', session('admin'));
    }











}
