<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Agent{

    public function map(Registrar $router)
    {
        #圈子路由
        Route::group(['prefix' => 'back/agent', 'namespace' => 'Back\Agent'], function() {

            #代理列表1
            Route::any('list','AgentController@lists');
            Route::any('edit','AgentController@edit');
            Route::any('detail','AgentController@detail');
        });
    }
}
