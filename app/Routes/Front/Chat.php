<?php

/**
  *@author 
  *@version 
  *@brief  聊天
**/

namespace App\Routes\Front;
use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Chat{

    public function map(Registrar $router) {
       
       Route::group(['prefix' => 'front/chat', 'namespace' => 'Front\Chat'], function() {

          //获取信息
          Route::get('getChat','ChatController@getChat');  
 


        });
    }
}