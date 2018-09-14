<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Http\Request;
use App\Http\Requests;

class IndexController extends FrontendController
{

    //首页默认用重庆时时彩
    public function index(){
        $navigations = $this->navigations;
        $contact = $this->contact;
        $lotterys = $this->lotterys;
        $title = $this->title;


        return view('frontend.pc.index',compact('navigations','contact','lotterys','title'));
    }







}
