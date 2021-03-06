<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Users{

    public function map(Registrar $router)
    {

      #用户管理路由
      Route::group(['prefix' => 'back/users', 'namespace' => 'Back\Users'], function() {

          #会员用户列表
          Route::any('listy','UsersController@listy');
          #粉丝用户列表
          Route::any('listf','UsersController@listf');
          #停用用户列表
          Route::any('listh','UsersController@listh');
          
          #用户停用
         	Route::any('userstop','UsersController@UserStop');

          #用户详情
         	Route::any('detail','UsersController@Detail');
          #用户编辑
          Route::any('edits','UsersController@Edits');
          #用户添加
          Route::any('adds','UsersController@Adds');
          #用户删除
          Route::any('Dels','UsersController@Dels'); 
          
          #后台登录
          Route::any('adminuser','UsersController@adminuser'); 


          #用户提现列表
          Route::any('enchaindex','UsersController@enchaindex');

          #用户提现
          Route::any('enchashment','UsersController@enchashment');

          #意见反馈
          Route::any('Thearticles','UsersController@Thearticles');

          #用户每次收益
          Route::any('UserEarningsAt','UsersController@UserEarningsAt');  

          #用户每天收益
          Route::any('UserEarningsBay','UsersController@UserEarningsBay');  

          #用户总收益
          Route::any('UserEarningsThe','UsersController@UserEarningsThe');

          #代言人收益
          Route::any('UserCommissionList','UsersController@UserCommissionList');
         
        });
    }
}
