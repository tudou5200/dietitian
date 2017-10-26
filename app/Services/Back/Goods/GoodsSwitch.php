<?php

namespace App\Services\Back\Goods;

use App\Models\Goods;

class GoodsSwitch
{
  public function Index($token){

      $product = Goods::where('dtoken',$token)->first();
      if (!$product) {
        return array(
          'status' => 'fail',
          'msg' => '没有此商品数据或已被删除'
        );
      }

      switch ($product->status) {
        case 1:
           $product->status = 2;
          break;

        case 2:
          $product->status = 1;
          break;
      }

      if ($product->save()) {
        return array(
          'status' => 'success',
        );
      } else {
        return array(
          'status' => 'fail',
          'msg' => ' 更改失败'
        );
      }

  }
}
