<?php

/**
  *@author 
  *@version 
  *@brief 商城
**/

namespace App\Routes\Front;
use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Bake{

    public function map(Registrar $router) {
       #商城路由  
       Route::group(['prefix' => 'front/bake', 'namespace' => 'Front\Bake'], function() {
          #测试1
       	  Route::any('index','BakeController@index');	
           #百科文章列表
          Route::any('indexs','BakeController@indexs'); 
        
        });
    }
}