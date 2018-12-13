<?php

namespace App\Http\Controllers\backend;

use App\Model\CommonSetting;
use Illuminate\Http\Request;
use App\Http\Controllers\MyController;
use App\Http\Requests;

class StaticController extends MyController
{
    public function index(){
        $StaticSetArray = CommonSetting::orderBy('common_set_id', 'asc')->paginate($this->backendPageNum);
        return view('backend.staticlist', compact('StaticSetArray'))->with('admin', session('admin'));
    }

    public function changestatus(Request $request){
        if($request->isMethod('post'))
        {
            $set_id = request()->input('common_set_id');
            $status = (request()->input('status') == 1) ? 0 : 1;
            $result = CommonSetting::where('common_set_id', $set_id)->update(['status' => $status]);
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

    public function addstatic(Request $request){
        if($request->isMethod('post'))
        {
            $input=$request->all();
            unset($input['_token']);
            $result = CommonSetting::create($input);
            if($result->common_set_id)
            {
                $reData['status'] = 1;
                $reData['msg'] = "添加成功";
            }else{
                $reData['status'] = 0;
                $reData['msg'] = "添加失败";
            }
            echo json_encode($reData);
        }else{
            return view('backend.addstatic');
        }

    }

    public function editstatic(Request $request,$set_id){
        if($request->isMethod('post'))
        {
            $input=$request->all();
            unset($input['_token']);
            $result = CommonSetting::where('common_set_id',$set_id)->update($input);
            if ($result) {
                $reData['status'] = 1;
                $reData['msg'] = "修改成功";
            } else {
                $reData['status'] = 0;
                $reData['msg'] = "修改失败";
            }
            echo json_encode($reData);
        }else{
            $StaticData = CommonSetting::find($set_id)->toArray();
            return view('backend.editstatic', compact('StaticData'));
        }
    }

}
