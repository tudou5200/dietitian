<?php

namespace App\Services\Back\Goods;

use App\Models\Goods;


class GoodsDel
{
  public function Index($token){

    $has = Goods::where('dtoken',$token)->first();
    if (!$has) {
      return array(
				'status' => 'fail',
				'msg' => '无数据',
				);
    }

    switch ($has->status) {
      case 1:
          $has->status = 3;
          if ($has->save()) {
            return array(
      				'status' => 'success',
      				);
          } else {
            return array(
      				'status' => 'fail',
      				'msg' => '删除失败',
      				);
          }
        break;

      case 3:
        return array(
          'status' => 'fail',
          'msg' => '商品已被删除',
          );
        break;

    }


  }

}
