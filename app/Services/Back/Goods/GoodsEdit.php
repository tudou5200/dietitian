<?php
namespace App\Services\Back\Goods;

use App\Models\Goods;
use App\Services\BaseService;

Class GoodsEdit extends BaseService
{
  public function Index($data){

    $tname = $this->trimAll($data['name']);

    $goods = Goods::where('dtoken',$data['dtoken'])->first();
    if (!$goods) {
      return array('status' => 'fail','msg' => '商品数据不存在或已被删除');
    }

    $has = Goods::where('name',$tname)->first();
    if ($has) {
      if ($has['dtoken'] !== $data['dtoken']) {
        return array('status' => 'fail','msg' => '商品名已存在，请重新命名');
      }
    }

    $name = empty($data['name']) ? $goods->name : $tname;
    $img = empty($data['img']) ? $goods->img : $this->trimAll($data['img']);
    $store = empty($data['store']) ? $goods->store : intval($data['store']);
    $price = empty($data['price']) ? $goods->price : intval($data['price']);
    $desc = empty($data['desc']) ? $goods->desc : $this->trimAll($data['desc']);
    $filename = 'file/goods/'.time().'.txt';
    $res = file_put_contents($filename,$desc);

    if (!$res) {
      return array(
        'status' => 'fail',
        'msg' => '写入文件失败'
      );
    }

    $status = empty($data['status']) ? $goods->status : intval($data['status']);
   


    $goods->name = $name;
    $goods->img = $img;
    $goods->store = $store;
    $goods->price = $price* 100;
    $goods->status = $status;
    $goods->desc = $filename;

    if ($goods->save()) {
      return array(
        'status' => 'success'
      );
    } else {
      return array(
        'status' => 'fail',
        'msg' => '更改失败！'
      );
    }

  }
}
