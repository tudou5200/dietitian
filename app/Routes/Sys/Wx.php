<?php

namespace App\Routes\Sys;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Wx{

    public function map(Registrar $router)
    {
    	

       Route::group(['prefix' => '/', 'namespace' => 'Wx'], function() {

        	Route::any('/','IndexController@index');

        });
    }
}