<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Order{

    public function map(Registrar $router)
    {
       Route::group(['prefix' => 'back/order', 'namespace' => 'Back\Order'], function() {

          //订单列表
         	Route::any('list','OrderController@List');

          //订单详情
         	Route::any('detail','OrderController@Detail');

          //订单修改
         	Route::any('edit','OrderController@Edit');

          //订单快递
         	Route::any('send','OrderController@Send');

          //订单删除
          Route::any('delete','OrderController@Delete');
        });
    }
}
