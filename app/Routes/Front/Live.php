<?php

namespace App\Routes\Front;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Live{

    public function map(Registrar $router) 
    {
       #我的中心路由路由
       Route::group(['prefix' => 'front/live', 'namespace' => 'Front\Live'], function() 
       {
          #我是直播首页
          Route::any('index','LiveController@index');

       		
        });
    }
}