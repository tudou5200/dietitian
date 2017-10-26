<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Chart{

    public function map(Registrar $router)
    {
        #圈子路由
        Route::group(['prefix' => 'back/chart', 'namespace' => 'Back\Chart'], function() {

            
            Route::any('index','ChartController@index');

            Route::any('dologin','ChartController@doLogin');

            Route::any('userinfo','ChartController@userInfo');

            Route::any('online','ChartController@onLine');

        });
    }
}
