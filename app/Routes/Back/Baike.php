<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Baike{

    public function map(Registrar $router)
    {
        #圈子路由
        Route::group(['prefix' => 'back/baike', 'namespace' => 'Back\Baike'], function() {

            #百科文章列表
            Route::any('list','BaikeController@list');
            #百科文章添加
            Route::any('adds','BaikeController@adds');
            #百科文章详情
            Route::any('detail','BaikeController@detail');
            #百科文章编辑
            Route::any('edit','BaikeController@edit');
             #百科文章编辑
            Route::any('del','BaikeController@del');
         
            #百科分类列表
            Route::any('bcase','BaikeController@Bcase');
             #百科分类添加
            Route::any('badds','BaikeController@Badds');
             #百科分类详情
            Route::any('bdetail','BaikeController@Bdetail');
             #百科分类编辑
            Route::any('bedit','BaikeController@Bedit');
             #百科分类删除
            Route::any('bdel','BaikeController@Bdel');
        });
    }
}
