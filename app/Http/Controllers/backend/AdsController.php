<?php

namespace App\Http\Controllers\backend;

use App\Model\Ads;
use Illuminate\Http\Request;
use App\Http\Controllers\MyController;
use App\Http\Requests;

class AdsController extends MyController
{
    //广告列表
    public function adslist(Request $request){
        //这里要写进redis
        $adsTypeArray = array('1'=> '横幅','2'=>'竖幅','3'=>'手机弹出广告');
        $adsCountTypeArray = array('1'=> 'CPC','2'=>'CPM');

        if($request->isMethod('post'))
        {

        }else{
            $adsListArray = Ads::orderBy('ads_id', 'desc')->paginate($this->backendPageNum);
            return view('backend.adslist', compact('adsListArray','adsTypeArray','adsCountTypeArray'))->with('admin', session('admin'));
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
