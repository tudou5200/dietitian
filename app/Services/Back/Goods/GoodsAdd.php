<?php
namespace App\Services\Back\Goods;

use App\Models\Goods;
use App\Models\Category;
use App\Services\BaseService;

Class GoodsAdd extends BaseService
{
  public function Index($data){

    $name = $this->trimAll($data['name']);

    $has= Goods::where('name',$name)->first();
    if ($has) {
        return array('status'=>'fail','msg'=>'商品名已存在！');
    }

    $name = $this->trimAll($data['name']);
    $token = $this->buildGoodsToken();
    $img = $this->trimAll($data['img']);
    $store = intval($data['store']);
    $price = intval($data['price']);
    $status = intval($data['status']);
    $desc= trim($data['desc']);
    $cat_id= trim($data['cat_id']);
    $category= Category::where('cat_id',$cat_id)->first();

    $filename = 'file/goods/'.time().'.txt';
    $res = file_put_contents($filename,$desc);

    if (!$res) {
      return array(
        'status' => 'fail',
        'msg' => '写入文件失败'
      );
    }

    $goods = new Goods();

    $goods->dtoken = $token;
    $goods->name = $name;
    $goods->img = $img;
    $goods->store = $store;
    $goods->price = $price * 100;
    $goods->status = $status;
    $goods->desc = $filename;
    $goods->cat_id = $cat_id;
    $goods->cat_name = $category->cat_name;


    if ($goods->save()) {
      return array(
        'status' => 'success'
      );
    } else {
      return array('status'=>'fail','msg'=>'添加失败');
    }

  }
}
