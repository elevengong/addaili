<?php

namespace App\Http\Controllers\backend;

use App\Model\Setting;
use App\Model\Traffic;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\MyController;

class TrafficController extends MyController
{
    public function traffic(){
        $settingArray = Setting::orderBy('set_id','asc')->get()->toArray();
        $setting = array();
        foreach ($settingArray as $set)
        {
            $setting[$set['set_id']] = $set['remark'];
        }

        $traffics = Traffic::orderBy('statistics_id','desc')->paginate(100);
        return view('backend.traffic',compact('traffics','setting'));
    }
}
