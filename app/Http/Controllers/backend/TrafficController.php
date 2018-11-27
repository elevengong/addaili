<?php

namespace App\Http\Controllers\backend;

use App\Model\Traffic;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\MyController;

class TrafficController extends MyController
{
    public function traffic(){
        $traffics = Traffic::orderBy('created_at','desc')->paginate(100);
        return view('backend.traffic',compact('traffics'));
    }
}
