<?php

/**
  *@author 
  *@version 
  *@brief  微信相关借口
**/

namespace App\Routes\Front;
use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Wx{

    public function map(Registrar $router) {
       
       Route::group(['prefix' => 'front/wx', 'namespace' => 'Wx'], function() {

          //获取微信code
          Route::post('code','WxController@code');  

          //获取用户信息
          Route::post('info','WxController@info');

          //获取微信sdk
          Route::post('sdk','WxController@sdk');  


        });
    }
}