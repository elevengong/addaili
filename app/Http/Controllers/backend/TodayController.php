<?php

namespace App\Http\Controllers\backend;

use App\Model\SumAds;
use App\Model\SumSpace;
use Illuminate\Http\Request;
use App\Http\Controllers\MyController;
use App\Http\Requests;

class TodayController extends MyController
{
    //在投站长
    public function webmasterlist(Request $request){
        if($request->isMethod('post')){
            $stime = request()->input('stime');
            $etime = request()->input('etime');

            $webmasterEarnArray = SumSpace::select('sum_space.*','webmaster_apply_ads.webmaster_id')
                ->leftJoin('webmaster_apply_ads',function ($join){
                    $join->on('webmaster_apply_ads.webmaster_ads_id','=','sum_space.space_id');
                })
                ->where('sum_space.date',$stime)->where('pv','!=',0)
                ->get()->toArray();



            return view('backend.datamanagement.webmasterlist');
        }else{
            return view('backend.datamanagement.webmasterlist');
        }
    }

    //在投广告位
    public function webmasteradslist(Request $request){
        if($request->isMethod('post')){
            $stime = request()->input('stime');
            $webmasteradsid = request()->input('webmasteradsid');
            //$etime = request()->input('etime');

            $webmasterAdsSpaceArray = SumSpace::select('sum_space.*','webmaster_apply_ads.webmaster_id','webmaster_apply_ads.name')
                ->leftJoin('webmaster_apply_ads',function ($join){
                    $join->on('webmaster_apply_ads.webmaster_ads_id','=','sum_space.space_id');
                })
                ->where(function($query) use($request){

                    $stime = request()->input('stime');
                    if(!empty($stime))
                    {
                        $query->where('sum_space.date',$stime);
                    }
                    $webmasteradsid = request()->input('webmasteradsid');
                    if(!empty($webmasteradsid))
                    {
                        $query->where('space_id',$webmasteradsid);
                    }else{
                        $query->where('pv','!=',0);
                    }

                })
                ->get()->toArray();

            return view('backend.datamanagement.webmasteradslist',compact('webmasterAdsSpaceArray','stime','webmasteradsid'));
        }else{
            $webmasterAdsSpaceArray = array();
            return view('backend.datamanagement.webmasteradslist',compact('webmasterAdsSpaceArray'));
        }
    }

    public function adsmemberadslist(Request $request){
        if($request->isMethod('post')){
            $stime = request()->input('stime');
            $adsmemberadsid = request()->input('adsmemberadsid');

            $adsmasterAdsArray = SumAds::select('sum_ads.*','ads.member_id','ads.ads_name')
                ->leftJoin('ads',function ($join){
                    $join->on('ads.ads_id','=','sum_ads.ads_id');
                })
                ->where(function($query) use($request){

                    $stime = request()->input('stime');
                    if(!empty($stime))
                    {
                        $query->where('sum_ads.date',$stime);
                    }
                    $adsmemberadsid = request()->input('adsmemberadsid');
                    if(!empty($adsmemberadsid))
                    {
                        $query->where('sum_ads.ads_id',$adsmemberadsid);
                    }else{
                        $query->where('sum_ads.pv','!=',0);
                    }

                })
                ->get()->toArray();
            return view('backend.datamanagement.adsmemberadslist',compact('adsmasterAdsArray','stime','adsmemberadsid'));

        }else{
            $adsmasterAdsArray = array();
            return view('backend.datamanagement.adsmemberadslist',compact('adsmasterAdsArray'));
        }
    }

    //全天站长流量对比表
    public function webmasterdatacontrast(Request $request){
        if($request->isMethod('post')){

        }else{
            return view('backend.datamanagement.webmasterdatacontrast');
        }
    }

    //全天广告位流量对比表
    public function webmasteradscontrast(Request $request){
        if($request->isMethod('post')){

        }else{
            return view('backend.datamanagement.webmasteradscontrast');
        }
    }

    //浏览器分析
    public function browseranalysis(Request $request){
        if($request->isMethod('post')){

        }else{
            return view('backend.datamanagement.browseranalysis');
        }
    }

    //
    public function webmastermoneycontrast(Request $request){
        if($request->isMethod('post')){

        }else{
            return view('backend.datamanagement.webmastermoneycontrast');
        }
    }
}
