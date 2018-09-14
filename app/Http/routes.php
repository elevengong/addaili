<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
//---------------------后台------------------------
Route::group(['middleware' => ['web']],function () {
    Route::any('/backend/login','backend\LoginController@login');
    Route::get('/backend/code','backend\LoginController@code');
});

Route::group(['middleware' => ['web','admin.login']],function () {
    Route::get('/backend/index','backend\IndexController@index');
    Route::post('/backend/logout','backend\IndexController@logout');
    Route::post('/backend/changepwd','backend\IndexController@changepwd');

    Route::any('/backend/adminlist','backend\AdminController@adminList');
    Route::any('/backend/admin/changestatus','backend\AdminController@changestatus');
    Route::delete('/backend/admin/delete/{admin_id}','backend\AdminController@delete')->where(['admin_id' => '[0-9]+']);
    Route::post('/backend/admin/add','backend\AdminController@adminadd');

    //总属性设置
    Route::get('/backend/static','backend\StaticController@index');
    Route::post('/backend/static/changestatus','backend\StaticController@changestatus');
    Route::any('/backend/static/addstatic','backend\StaticController@addstatic');
    Route::any('/backend/static/editstatic/{set_id}','backend\StaticController@editstatic')->where(['set_id' => '[0-9]+']);

    //广告会员列表和站长列表
    Route::any('/backend/member/adsmember','backend\MemberController@adsmemberlist');
    Route::any('/backend/member/sitemember','backend\MemberController@sitememberlist');
    Route::post('/backend/member/changememberstatus','backend\MemberController@changememberstatus');
    Route::any('/backend/member/resetmemberpwd/{member_id}','backend\MemberController@resetmemberpwd')->where(['member_id' => '[0-9]+']);
    Route::post('/backend/member/setpersonalrate','backend\MemberController@setpersonalrate');



    //广告会员充值
    Route::any('/backend/money/applydeposit','backend\DepositController@applydeposit');
    Route::get('/backend/money/dealdepositorder/{deposit_id}','backend\DepositController@dealdepositorder')->where(['deposit_id' => '[0-9]+']);
    Route::any('/backend/money/updatedepositorder/{deposit_id}','backend\DepositController@updatedepositorder')->where(['deposit_id' => '[0-9]+']);

    Route::any('/backend/money/deposit','backend\DepositController@depositrecord');



    //站长提款
    Route::any('/backend/money/applywithdraw','backend\WithdrawController@applywithdraw');
    Route::get('/backend/money/dealwithdraworder/{withdraw_id}','backend\WithdrawController@dealwithdraworder')->where(['withdraw_id' => '[0-9]+']);
    Route::any('/backend/money/updatewithdraworder/{withdraw_id}','backend\WithdrawController@updatewithdraworder')->where(['withdraw_id' => '[0-9]+']);


    Route::any('/backend/money/withdraw','backend\WithdrawController@withdrawrecord');





    //图片上传
    Route::any('/backend/upload','backend\JobController@upload');
    Route::any('/backend/uploadphoto/{id}','MyController@uploadphoto');
});


//---------------------pc前端------------------------
Route::get('/','frontend\HistoryController@index');

Route::get('/history/{lottery_name}','frontend\HistoryController@index');
Route::get('/plan/{lottery_name}/{p_id}','frontend\PlanController@index')->where(['p_id' => '[0-9]+']);


Route::get('/test/{id}','frontend\TestController@index')->where(['id' => '[0-9]+']);

//---------------------wap前端------------------------
//Route::get('/m/','frontend\WapController@index');
//Route::get('/m/joinus','frontend\WapController@joinus');
//Route::get('/m/job','frontend\WapController@job');
//
//Route::post('/uploadresume','frontend\IndexController@upload');
//Route::any('/frontend/uploadresume','frontend\FrontendController@uploadresume');
//Route::post('/frontend/updateapply','frontend\IndexController@updateapply');





