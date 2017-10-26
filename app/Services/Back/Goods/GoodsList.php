<?php
namespace App\Services\Back\Goods;

use App\Models\Goods;

Class GoodsList
{
  public function Index($pageSize,$page,$token,$name=null){

    if ($token != 0) {
        $product = Goods::where('dtoken',$token)->first();

        return array(
           'status' => 'success',
           'content'=>$product,
           );
    }

    $limit=$pageSize;
    $skip = ($page - 1) * $limit;
    $count = Goods::where('status','!=',3)->count();

    if( empty($name) ){
      $list = Goods::skip($skip)->take($limit)->where('status','!=',3)->orderBy('id', 'desc')->get();
    }else{
      $list = Goods::skip($skip)->take($limit)->where('status','!=',3)->where('name','like','%'.$name.'%')->orderBy('id', 'desc')->get();
    }
    
    if ($list->toArray() == null) {
      return array(
         'status' => 'success',
         'content'=>array('sumpage'=>0),
         );
    }

    foreach ($list as $value) {
      $value['time'] = date('Y-m-d',$value['time']);
      $value['price'] =   $value['price']/100;
      $value['market'] =   $value['market']/100;
    }

    return array(
      'status'  => 'success',
      'content' => array('con'=> $list,
      'sumpage'=> ceil($count/$limit) ,
      'page' => (int)$page)
    );


  }
}
