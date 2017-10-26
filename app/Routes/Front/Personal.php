<?php

/**
  *@author 
  *@version 
  *@brief 我的
**/

namespace App\Routes\Front;
use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Personal{

    public function map(Registrar $router) {
       #我的路由  
       Route::group(['prefix' => 'front/personal', 'namespace' => 'Front\Personal'], function() {
          #生成验证码发送短信
       	  Route::any('apply','PersonalController@Apply');	
          #注册的验证
          Route::any('contrast','PersonalController@Contrast');  
          #测试2		     
       	  Route::any('tests','PersonalController@test2');

        });
    }
}