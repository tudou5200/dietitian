<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Login{

    public function map(Registrar $router)
    {
       Route::group(['prefix' => 'back/login', 'namespace' => 'Back\Login'], function() {


        	Route::post('admin','LoginController@Login');

        	Route::post('menu','LoginController@Menu');

			#管理员列表
			Route::any('adminlist','LoginController@adminlist');
			
			#管理员详情
            Route::any('detail','LoginController@detail');   
			
			#修改管理员密码
			Route::any('editadminpwd','LoginController@editadminpwd');
			
			#添加管理员密码
			Route::any('addadmin','LoginController@addadmin');
        });
    }
}
