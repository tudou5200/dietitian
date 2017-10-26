<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Live{

    public function map(Registrar $router) 
    {
       #我的中心路由路由
       Route::group(['prefix' => 'back/live', 'namespace' => 'Back\Live'], function() 
       {
        	#我是直播首页
          Route::any('index','LiveController@index');
          #我是添加直播
          Route::any('adds','LiveController@adds');
          #我是直播详情
          Route::any('edits','LiveController@edits');   
          #我是直播删除
          Route::any('deletes','LiveController@deletes');

       		
       });
    }
}