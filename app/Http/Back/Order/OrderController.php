<?php

namespace App\Http\Back\Order;

use App\Services\BaseService;

use App\Http\BaseController;
use Illuminate\Http\Request;
use Validator;

use App\Models\Order;
use App\Models\OrderDetail;
// use App\Services\Back\Order\OrderEdit;
// use App\Services\Back\Order\OrderDetail;
// use App\Services\Back\Order\SendGoods;

class OrderController extends BaseController
{

  #订单列表
  public function List(Request $request) {
      $page     = $request->input('page');
      $pageSize = $request->input('pageSize');
      $status   = $request->input('status');
      $order_sn = $request->input('order_sn');
      $page     = empty($page) ? 1: $page;
      $pageSize = empty($pageSize) ? 10: $pageSize;
      $status   = empty($request->input('status'))? 0:$status;
      $skip     = ($page - 1) * $pageSize;

      if(!empty($order_sn)&&$status!=0){
        $count = Order::where('status',$status)->where('order_sn','like',"%".$order_sn."%")->count();
        $list  = Order::skip($skip)->take($pageSize)->where('status',$status)->where('order_sn','like',"%".$order_sn."%")->orderBy('id', 'desc')->get();
      }elseif(!empty($order_sn)){
        $count = Order::where('order_sn','like',"%".$order_sn."%")->count();
        $list  = Order::skip($skip)->take($pageSize)->where('order_sn','like',"%".$order_sn."%")->orderBy('id', 'desc')->get();
      }elseif($status!=0){
        if($status!=1&&$status!=2&&$status!=3&&$status!=4){
          $r=array('code'=>'5','msg'=>'status状态不对');
          return $this->result($r);
        }
        $count = Order::where('status',$status)->count();
        $list  = Order::skip($skip)->take($pageSize)->where('status',$status)->orderBy('id', 'desc')->get();
      }else{
        $count = Order::count();
        $list  = Order::skip($skip)->take($pageSize)->orderBy('id', 'desc')->get();
      }

      if ($list->toArray() == null) {
        $Model['list'] ='';
        $Model['count']=$count;
        return $this->result($Model);
      }


      foreach ($list as $value) {
        $value['ctime']      = empty($value['ctime'])   ? '':date("Y-m-d",$value['ctime']);
        $value['paytime']    = empty($value['paytime']) ? '':date("Y-m-d",$value['paytime']);
        $value['fatime']     = empty($value['fatime'])  ? '':date("Y-m-d",$value['fatime']);
        $value['quetime']    = empty($value['quetime']) ? '':date("Y-m-d",$value['quetime']);
        $value['totalprice'] = $value['totalprice']/100;
      }

      $Model['list']  =$list;
      // $Model['count'] =$count;
      // $Model['pageSize'] =$pageSize;
      $Model['sumpage'] =ceil($count/$pageSize);
      return $this->result($Model);
  }

  #订单详情
  public function Detail(Request $request) {
    $order_sn = $request->input('order_sn');
    $order    = Order::where('order_sn',$order_sn)->first();
    if (!$order) {
      $r=array('code'=>'5','msg'=>'order表没有此订单编号');
      return $this->result($r);
    }


    $order = $order->toArray();
    $order['ctime']      = empty($order['ctime'])  ? '':date("Y-m-d",$order['ctime']);
    $order['paytime']    = empty($order['paytime'])? '':date("Y-m-d",$order['paytime']);
    $order['fatime']     = empty($order['fatime']) ? '':date("Y-m-d",$order['fatime']);
    $order['quetime']    = empty($order['quetime'])? '':date("Y-m-d",$order['quetime']);
    $order['totalprice'] = $order['totalprice']/100;
    $orderdetail = OrderDetail::where('order_sn',$order_sn)->get();

    if (!$orderdetail) {
      $r=array('code'=>'5','msg'=>'orderdetail表没有此订单编号');
      return $this->result($r);
    }


    foreach ($orderdetail as $value) {
      $value['each_price'] = $value['each_price']/100;
      $value['total']      = $value['total']/100;
    }


    $order['detaillist'] = $orderdetail;
    return $this->result($order);
  }


  #订单修改
  public function Edit(Request $request){
     if($this->verCode($request->all(),[
      'order_sn' =>'required',
      'province'    =>'required',
      'city'   =>'required',
      'county'     =>'required',
      'detail'   =>'required',
      'name'     =>'required',
      'mobile'      =>'required',
    ])){
      return $this->publicparaResponse();
    }
    $BaseService=new BaseService;
    $data = $request->all();
    $order = Order::where('order_sn',$data['order_sn'])->first();
    if (!$order) {
      $r=array('code'=>'5','msg'=>'此数据已不存在或被删除');
      return $this->result($r);
    }

    $order->name    = $BaseService->trimAll($data['name']);
    $order->province= $BaseService->trimAll($data['province']);
    $order->county  = $BaseService->trimAll($data['county']);
    $order->city    = $BaseService->trimAll($data['city']);
    $order->detail  = $BaseService->trimAll($data['detail']);
    $order->mobile  = $BaseService->trimAll($data['mobile']);
    $r=$order->save()?[]:array('code'=>'5','msg'=>'网络错误');
    return $this->result($r);
  }

  #添加快递
  public function Send(Request $request){
    if($this->verCode($request->all(),[
      'order_sn'    =>'required',
      'delivery'    =>'required',
      'deliveryno'  =>'required',
    ])){
      return $this->publicparaResponse();
    }
    $BaseService=new BaseService;
    $data = $request->all();
    
    $order = Order::where('order_sn',$data['order_sn'])->first();
    if (!$order) {
      $r=array('code'=>'5','msg'=>'此数据已不存在或被删除');
      return $this->result($r);
    }
    $order->delivery    = $BaseService->trimAll($data['delivery']);
    $order->delivery_no = $BaseService->trimAll($data['deliveryno']);
    $order->status = 3;
    $r=$order->save()?[]:array('code'=>'5','msg'=>'网络错误');
    return $this->result($r);
  }

  #订单删除
  public function Delete(Request $request)
  {
      if($this->verCode($request->all(),[
        'order_sn'    =>'required',
      ])){
        return $this->publicparaResponse();
      }
      $order_sn = $request->input('order_sn');

      $OrderDetail = OrderDetail::where('order_sn',$order_sn)->get();
      $count = count($OrderDetail);
      foreach ($OrderDetail as $key => $value) {          
          if($value->delete()){
              if($key+1==$count){
                   $order = Order::where('order_sn',$order_sn)->first();
                   if($order->delete()){
                      return $this->result([]);
                   }else{
                      return $this->result(array('code'=>'5','msg'=>'网络错误'));
                   }
              }
          }else{
            return $this->result(array('code'=>'5','msg'=>'网络错误'));
          }
      }
  }
}





















// namespace App\Http\Back\Order;

// use App\Services\Back\Order\OrderList;
// use App\Services\Back\Order\OrderEdit;
// use App\Services\Back\Order\OrderDetail;
// use App\Services\Back\Order\SendGoods;

// use App\Services\Sys\Img;

// use App\Http\BaseController;
// use Illuminate\Http\Request;
// use Validator;

// class OrderController extends BaseController
// {
//   public function List(Request $request) {
//     $page = $request->input('page');
//     $page = empty($page) ? 1: $page;

//     $status= empty($request->input('status'))? 0 : $request->input('status');

//     $obj = new OrderList;
//     $data = $obj->Index($page,$status);
//     $res = array(
//       "msg"=>"",
//       "list"=>$res['list'],
//       "count"=>$res['count']
//       );
//     return $this->resultAdmin($res);
//   }

//   public function Detail(Request $request) {
//     $orderno = $request->input('orderno');

//     $obj = new OrderDetail;
//     $res = $obj->Index($orderno);

//     return $this->resmsg($res);
//   }

//   public function Edit(Request $request){

//     $arr = [];
//     $arr['orderno'] = 'required';

//     $this->retvali($request->all(),$arr);

//     $data = $request->all();

//     $obj = new OrderEdit();
//     $res = $obj->Index($data);

//     return $this->resmsg($res);

//   }

//   public function Send(Request $request){

//     $arr = [];
//     $arr['orderno'] = 'required';
//     $arr['delivery'] = 'required';
//     $arr['deliveryno'] = 'required';

//     $this->retvali($request->all(),$arr);

//     $data = $request->all();

//     $obj = new SendGoods();
//     $res = $obj->Index($data);

//     return $this->resmsg($res);

//   }


// }
