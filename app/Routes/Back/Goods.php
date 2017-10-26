<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Goods{

    public function map(Registrar $router)
    {
       Route::group(['prefix' => 'back/goods', 'namespace' => 'Back\Goods'], function() {

          //商品列表
         	Route::any('list','GoodsController@List');

          //商品删除
         	Route::any('del','GoodsController@Del');

          //商品上下架
         	Route::any('switch','GoodsController@Swicth');

          //商品详情
          Route::any('detail','GoodsController@Detail');

          //商品编辑
          Route::any('edit','GoodsController@Edit');

          //商品添加
          Route::any('add','GoodsController@Add');  

          //商品编辑(修改展示)
          Route::any('Detaillist','GoodsController@Detaillist');

          //商品分类列表
          Route::any('catlist','GoodsController@catlist');

           //商品分类添加
          Route::any('catadd','GoodsController@catadd');

           //商品分类详情
          Route::any('catdeit','GoodsController@catdeit');

           //商品分类修改
          Route::any('catedit','GoodsController@catedit');

           //商品分类删除
          Route::any('catdel','GoodsController@catdel');

        });
    }
}
