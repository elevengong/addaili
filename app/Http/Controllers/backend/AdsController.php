<?php

namespace App\Http\Controllers\backend;

use App\Model\Ads;
use App\Model\Setting;
use App\Model\Traffic;
use Illuminate\Http\Request;
use App\Http\Controllers\MyController;
use App\Http\Requests;

class AdsController extends MyController
{
    //广告列表
    public function adslist(Request $request){

        if($request->isMethod('post'))
        {

        }else{
            $settingArray = Setting::orWhere('settinggroup','adsType')->orWhere('settinggroup','countType')->where('status',1)->get()->toArray();
            $setting = array();
            foreach($settingArray as $set)
            {
                $setting[$set['set_id']] = $set['remark'];
            }
            $adsArray = Ads::orderBy('created_at','desc')->paginate($this->backendPageNum);
            return view('backend.adslist', compact('setting','adsArray'))->with('admin', session('admin'));
        }

    }

    //审核广告
    public function verifyads(Request $request){
        if($request->isMethod('post'))
        {
            $ads_id = request()->input('ads_id');
            $status = request()->input('status');
            $result = Ads::where('ads_id', $ads_id)->update(['status' => $status]);
            if ($result) {
                $data['status'] = 1;
                $data['msg'] = "修改成功";
            } else {
                $data['status'] = 0;
                $data['msg'] = "修改失败";
            }
            echo json_encode($data);
        }
    }
}
