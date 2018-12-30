<?php

namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;
use App\Http\Controllers\MyController;
use App\Http\Requests;

class TodayController extends MyController
{
    //在投站长
    public function webmasterlist(Request $request){
        if($request->isMethod('post')){

        }else{
            return view('backend.datamanagement.webmasterlist');
        }
    }

    //在投广告位
    public function webmasteradslist(Request $request){
        if($request->isMethod('post')){

        }else{
            return view('backend.datamanagement.webmasteradslist');
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
