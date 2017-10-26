<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Quanzi{

    public function map(Registrar $router)
    {
        #圈子路由
        Route::group(['prefix' => 'back/quanzi', 'namespace' => 'Back\Quanzi'], function() {

            #圈子列表
            Route::any('list','QuanziController@List');
            #圈子详情
            Route::any('detail','QuanziController@Detail'); 
            #圈子删除
            Route::any('del','QuanziController@Del');
            #圈子评论删除
            Route::any('commentdel','QuanziController@CommentDel');

            
        });
    }
}
