<?php
namespace App\Services\Back\Goods;

use App\Models\Goods;

Class GoodsDetail
{
  public function Index($token){
    $product = Goods::where('dtoken',$token)->first();
    if (!$product) {
      return array(
        'status' => 'fail',
        'msg' => '没有此商品数据或已被删除'
      );
    }

    $product->price = $product->price/100;
    $product->market = $product->market/100;
    $product->desc=file_exists($product->desc)?file_get_contents($product->desc):'';


    // foreach ($list as $value) {
    //   $value['time'] = date('Y-m-d',$value['time']);
    //   $value['price'] =   $value['price']/100;
    //   $value['market'] =   $value['market']/100;
    //
    //
    // }

    return array(
      'status' => 'success',
      'content' => $product
    );
  }
}
