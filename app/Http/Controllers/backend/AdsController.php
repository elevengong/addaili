<?php

namespace App\Http\Controllers\backend;

use App\Model\Ads;
use App\Model\CommonSetting;
use App\Model\Material;
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

    public function materiallist(Request $request){
        $website_domain = CommonSetting::where('name','ads_material_domain')->get()->toArray();

        if($request->isMethod('post')){

        }else{
            $materialArray  = Material::select('member.member_id','member.name','material.*')
                ->leftJoin('member',function ($join){
                    $join->on('member.member_id','=','material.ads_id');
                })
            ->orderBy('material.created_at','desc')->paginate($this->backendPageNum);
            return view('backend.materiallist', compact('materialArray','website_domain'))->with('admin', session('admin'));
        }
    }

    public function updatematerialstatus(Request $request){
        if($request->isMethod('post')){
            $id = request()->input('id');
            $status = request()->input('status');
//            if($status == 1)
//            {
//                //生成base64图片
//                $material = @Material::find($id)->toArray();
//                if(!empty($material))
//                {
//                    $website_image_domain = CommonSetting::where('name','ads_material_domain')->get()->toArray();
//                    $image_url = $website_image_domain[0]['value'].$material['image'];
//                    $image_base64 = $this->ImageBase64($image_url);
//
//                }else{
//                    $data['status'] = 0;
//                    $data['msg'] = "Error!";
//                    echo json_encode($data);
//                }
//
//                $res = Material::where('id',$id)->update(['status'=> $status,'base64'=>$image_base64]);
//            }else{
//                $res = Material::where('id',$id)->update(['status'=> $status]);
//            }
            $res = Material::where('id',$id)->update(['status'=> $status]);
            if ($res) {
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
