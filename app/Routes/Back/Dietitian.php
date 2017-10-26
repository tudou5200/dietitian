<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Dietitian{

    public function map(Registrar $router)
    {
        #营养师路由
        Route::group(['prefix' => 'back/dietitian', 'namespace' => 'Back\Dietitian'], function() {
        	
            #营养师列表
            Route::any('list','DietitianController@List');
            // #营养师列表
            // Route::any('list','DietitianController@List');
            #将营养师降为会员
            Route::any('del','DietitianController@Del');
            #营养师详情
            Route::any('detail','DietitianController@Detail');   

            #营养师审批
            Route::any('approval','DietitianController@approval');


            #营养师编辑
            Route::any('edit','DietitianController@Edit');
            #营养师服务列表
            Route::any('plist','DietitianController@ProductList');
            #营养师服务添加
            Route::any('padd','DietitianController@ProductAdd');
            #营养师服务删除
            Route::any('pdel','DietitianController@ProductDel');
            #营养师服务详情
            Route::any('pdetail','DietitianController@ProductDetail');
            #营养师服务编辑
            Route::any('pedit','DietitianController@ProductEdit');
            #营养师服务订单列表
            Route::any('olist','DietitianController@OrderList');
            #营养师服务订单详情
            Route::any('odetail','DietitianController@OrderDetail');
            #营养师服务订单删除
            Route::any('odel','DietitianController@OrderDel'); 
            #营养师分类列表
            Route::any('catlist','DietitianController@catlist'); 
           #营养师分类添加
            Route::any('cadds','DietitianController@cadds'); 
            #营养师分类详情
            Route::any('cdetail','DietitianController@cdetail'); 
            #营养师分类编辑
            Route::any('cedit','DietitianController@cedit');
            #营养师分类删除
            Route::any('cdel','DietitianController@cdel');   

        });
    }
}
