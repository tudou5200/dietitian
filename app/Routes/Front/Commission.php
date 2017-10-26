<?php

namespace App\Routes\Front;
use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Commission{

    public function map(Registrar $router) {

        Route::group(['prefix' => 'front/commission', 'namespace' => 'Front\Commission'], function() {

            //获取佣金列表
            Route::any('list','CommissionController@lists');

            //分配佣金1
            Route::any('assign','CommissionController@assign');

        });
    }
}