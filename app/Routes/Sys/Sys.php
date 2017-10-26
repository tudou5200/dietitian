<?php

namespace App\Routes\Sys;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Sys{

    public function map(Registrar $router)
    {


       Route::group(['prefix' => 'sys', 'namespace' => 'Sys'], function() {

        	//项目列表
       		Route::post('upImg','UpController@upImg');
       		//项目列表
       		Route::any('ueditor','UpController@ueditor');
       		//聊天记录
       		Route::post('chatlog','ChatController@getLog');
        });
    }
}