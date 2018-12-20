<?php

namespace App\Http\Controllers\backend;

use App\Model\Setting;
use App\Model\WebmasterApplyAds;
use Illuminate\Http\Request;
use App\Http\Controllers\MyController;

class SitememberController extends MyController
{
    public function adslist(Request $request){
        $allSettingArray = Setting::select('set_id','settinggroup','remark')->orWhere('settinggroup','adsType')->orWhere('settinggroup','countType')->where('status',1)->orderBy('set_id','asc')->get()->toArray();
        $settingArray = array();
        $adsTypeArray = array();
        $countTypeArray = array();
        foreach($allSettingArray as $setting)
        {
            $settingArray[$setting['set_id']] = $setting['remark'];
            if($setting['settinggroup'] == 'adsType')
            {
                $adsTypeArray[] = $setting;
            }elseif($setting['settinggroup'] == 'countType')
            {
                $countTypeArray[] = $setting;
            }
        }
        if($request->isMethod('post')){

        }else{
            $siteMemberAdsArray = WebmasterApplyAds::select('webmaster_apply_ads.*','member.name as webmaster_name')
                ->leftJoin('member',function ($join){
                    $join->on('member.member_id','=','webmaster_apply_ads.webmaster_id');
                })
                ->orderBy('created_at','desc')->paginate($this->backendPageNum);
            return view('backend.sitemember_ads_list',compact('siteMemberAdsArray','settingArray','adsTypeArray','countTypeArray'))->with('admin', session('admin'));
        }


    }



}