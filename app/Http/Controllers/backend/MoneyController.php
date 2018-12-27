<?php

namespace App\Http\Controllers\backend;

use App\Model\AccountChange;
use App\Model\Setting;
use Illuminate\Http\Request;
use App\Http\Controllers\MyController;
use App\Http\Requests;

class MoneyController extends MyController
{
    public function moneychange(Request $request){
        $acTypeArray = Setting::orWhere('settinggroup','acMore')->orWhere('settinggroup','acFrontend')->orWhere('settinggroup','acBackend')->orWhere('settinggroup','acSystem')->get()->toArray();
        $acType = array();
        foreach ($acTypeArray as $ac)
        {
            $acType[$ac['set_id']] = $ac['remark'];
        }
        if($request->isMethod('post')){

        }else{
            $moneyChangeArray = AccountChange::select('account_change.*','member.name','member.type as member_type')->orderBy('account_change.created_at','desc')
                ->leftJoin('member',function ($join){
                    $join->on('member.member_id','=','account_change.memberId');
                })
                ->paginate($this->backendPageNum);

            return view('backend.moneychangelist', compact('moneyChangeArray','acType'))->with('admin', session('admin'));
        }
    }
}
