<?php
namespace App\Routes\Front;
use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Circle{

    public function map(Registrar $router) 
    {
    	  #圈子路由  
        Route::group(['prefix' => 'front/circle', 'namespace' => 'Front\Circle'], function() {

          	#圈子 我的圈
          	Route::any('circlecusers','CircleController@cusers');

          	#圈子 列表 
            Route::any('circlelist','CircleController@lists');

            #圈子 图片 
          	Route::any('imglist','CircleController@imglist');

 			      #圈子 添加
          	Route::any('circleadds','CircleController@adds');

          	#圈子 详情
          	Route::any('circleedits','CircleController@edits'); 

            #圈子 评论
            Route::any('circlecommts','CircleController@commts');

            #圈子 点赞
          	Route::any('likes','CircleController@likes');

            #营养师说 
            Route::any('dietshuos','CircleController@dietshuos');

        });
    }
}