<?php

namespace App\Routes\Front;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Mall{

    public function map(Registrar $router)
    {
    
       Route::group(['prefix' => 'front/mall', 'namespace' => 'Front\Mall'], function() {

        	#商城路由    		
       		Route::get('test','TestController@index');#测试1
       		Route::post('test2','TestController@main');#测试2
       		Route::get('index','IndexController@index');#首页
          Route::get('category','CategoryController@index');#分类
          Route::get('goods','GoodsController@index');#商品详情
          Route::get('cart','CartController@index');#购物车
          Route::get('orderinfo','OrderinfoController@index');#订单信息表
          Route::get('ordergoods','OrdergoodsController@index');#订单商品表
       	  

        });
    }
}