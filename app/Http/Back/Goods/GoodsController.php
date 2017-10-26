<?php
namespace App\Http\Back\Goods;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Goods;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Services\BaseService;

class GoodsController extends BaseController
{

//商品列表
  public function List(Request $request) {
    $page     = $request->input('page');
    $pageSize = $request->input('pageSize');
    $name     = $request->input('name');
    $page     = empty($page) ? 1: $page; 
    $take     = empty($pageSize) ? 5: $pageSize;
    $skip     = ($page - 1) * $take;

    if(empty($name)){
      $count = Goods::where('status','!=',3)->count();
      $list = Goods::skip($skip)->take($take)->where('status','!=',3)->orderBy('id', 'desc')->get();
    }else{
      $count = Goods::where('name','like',"%".$name."%")->orderBy('id', 'desc')->where('status','!=',3)->count();
      $list = Goods::skip($skip)->take($take)->where('status','!=',3)->where('name','like',"%".$name."%")->orderBy('id', 'desc')->get();
    }

    foreach ($list as $value) {
      $value['price'] =   $value['price']/100;
    }

    $Model['list']=$list;
    $Model['sumpage']=ceil($count/$take);
    $Model['count']=$count;
    return $this->result($Model);
  }

  //商品删除
  public function Del(Request $request){
    if($this->verCode($request->all(),[
      'dtoken'   =>'required',
    ])){
      return $this->publicparaResponse();
    }

    $dtoken = $request->input('dtoken');
    $Model  = Goods::where("dtoken",$dtoken)->first();
    $return = $Model->delete()?array('code'=>'1','msg'=>'FAIL'):array('code'=>'3','msg'=>'FAIL');
    // use App\Models\Order;
    // use App\Models\OrderDetail;
  
    // $OrderDetail = OrderDetail::where("dtoken",$dtoken)->get();
    // if($OrderDetail){
    //      $Order = Order::where('order_sn',$OrderDetail['order_sn'])->first();
    //      if($Order){
    //         foreach ($OrderDetail as $key => $value) {
    //           # code...
    //         }
    //      }
    // }
    $Cart   = Cart::where("dtoken",$dtoken)->get();
    if($Cart){
      foreach ($Cart as $key => $value) {
      $value->delete();
      }
    }
    
    return $this->result($return);
  }

//商品添加
  public function Add(Request $request){
    if($this->verCode($request->all(),[
      'name'    =>'required',
      'store'   =>'required|numeric',
      'price'   =>'required|numeric',
      'status'  =>'required|numeric',
      'content'   =>'required',
      'cat_id' =>'required|numeric',
      'img'    =>'required',
    ])){
      return $this->publicparaResponse();
    }
    $BaseService=new BaseService;
    $r  =$request->input();
    $has= Goods::where('name',$r['name'])->first();
    if($has){
      $r=array('code'=>'5','msg'=>'商品名已存在！');
      return $this->result($r);
    }

    $category = Category::where('cat_id',$r['cat_id'])->first();
    $filename = 'file/goods/'.time().'.txt';
    $res      = file_put_contents($filename,$r['content']);
    if (!$res) {
      $r= array('code'=>'5','msg' => '写入文件失败');
       return $this->result($r);
    }

   
    $Model=new goods;
    $Model->name     =$BaseService->trimAll($r['name']);
    $Model->dtoken   = $BaseService->buildGoodsToken();
    $Model->store    = intval($r['store']);
    $Model->price    = $r['price']*100;
    $Model->status   = intval($r['status']);
    $Model->desc     = $filename;
    $Model->cat_id   =$BaseService->trimAll($r['cat_id']);
    $Model->cat_name = $category->cat_name;
    $Model->img      =$BaseService->trimAll($r['img']);

    // $return=$Model->save()?'<div class="cfD"><a style="font-size: 50px;" href="http://aiyang.shoumeikeji.cn/mall/goods_index.html">加添成功-返回首页</a></div>'
    //   :'<div class="cfD"><a style="font-size: 50px;" href="http://aiyang.shoumeikeji.cn/mall/goods_index.html">加添失败-返回添加</a></div>';
    // echo $return;
      $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
      $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      $r = $Model->save()? $success:$error;
    // return $this->result($r);
    
  }

  #商品详情查看
  public function Detail(Request $request){
    if($this->verCode($request->all(),[
      'dtoken'   =>'required',
    ])){
      return $this->publicparaResponse();
    }

    $dtoken = $request->input('dtoken');
    $product= Goods::where('dtoken',$dtoken)->first();
    // $product['store'] = $product['store']-$product['sell'];
    if (!$product) {
      $r= array('code'=>'5','msg' => '没有此商品数据或已被删除');
       return $this->result($r);
    }

    $product->price = $product->price/100;
    $product->desc  =file_exists($product->desc)?file_get_contents($product->desc):'';
    return $this->result($product);
  }

  #商品编辑(修改展示)
  public function Detaillist(Request $request){
    if($this->verCode($request->all(),[
      'dtoken'   =>'required',
    ])){
      return $this->publicparaResponse();
    }

    $dtoken = $request->input('dtoken');
    $product= Goods::where('dtoken',$dtoken)->first();
    // $product['store'] = $product['store']-$product['sell'];
    if (!$product) {
      $r= array('code'=>'5','msg' => '没有此商品数据或已被删除');
       return $this->result($r);
    }
    $product->price = $product->price/100;
    $product->desc  =file_exists($product->desc)?file_get_contents($product->desc):'';
    $category = Category::all();
    return $this->result(array('list'=>$product,'cat'=> $category));
  }


  #商品编辑
  public function Edit(Request $request){
    if($this->verCode($request->all(),[
      'dtoken'   =>'required',
      'name'     =>'required',
      'store'    =>'required|numeric',
      'price'    =>'required|numeric',
      'content'  =>'required',
      'cat_id'   =>'required|numeric',
      'img'      =>'required',
    ])){
      return $this->publicparaResponse();
    }
    $BaseService=new BaseService;
    $data = $request->all();
    $tname = $BaseService->trimAll($data['name']);
    $goods = Goods::where('dtoken',$data['dtoken'])->first();
    if (!$goods) {
      $r= array('code'=>'5','msg' => '商品数据不存在或已被删除');
      return $this->result($r);
    }

    $has = Goods::where('name',$tname)->first();
    if ($has) {
      if ($has['dtoken'] !== $data['dtoken']) {
        $r= array('code'=>'5','msg' => '商品名已存在，请重新命名');
        return $this->result($r);
      }
    }

    $category= Category::where('cat_id',intval($data['cat_id']))->first();
    if (!$category) {
      $r= array('code'=>'5','msg' => '商品种类不存在或已被删除');
      return $this->result($r);
    }

    $filename = 'file/goods/'.time().'.txt';
    $res = file_put_contents($filename,$data['content']);

    if (!$res) {
       $r= array('code'=>'5','msg' => '写入文件失败');
       return $this->result($r);
    }
    
    $goods->name     = $tname;
    $goods->img      = $data['img'];
    $goods->store    = intval($data['store']);
    $goods->price    = $data['price']*100; 
    $goods->desc     = $filename;
    $goods->cat_id   = $data['cat_id'];
    $goods->cat_name = $category->cat_name;
    // return $this->result($r);
     // $return=$goods->save()?'<div class="cfD"><a style="font-size: 50px;" href="http://aiyang.shoumeikeji.cn/mall/goods_index.html">加添成功-返回首页</a></div>'
     //  :'<div class="cfD"><a style="font-size: 50px;" href="http://aiyang.shoumeikeji.cn/mall/goods_index.html">加添失败-返回添加</a></div>';
     //  echo $return;
      $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
      $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      $r = $goods->save()? $success:$error;
  }

  #商品上下架
  public function Swicth(Request $request){
    if($this->verCode($request->all(),[
      'dtoken'   =>'required',
    ])){
      return $this->publicparaResponse();
    }
    $dtoken = $request->input('dtoken');
    $status = $request->input('status');
    $product = Goods::where('dtoken',$dtoken)->first();
      if (!$product) {
        return array(
          'status' => 'fail',
          'msg'    => '没有此商品数据或已被删除'
        );
      }
      switch ($status) {
        case 1:
          $product->status = 2;
          $status = 2;
          $Cart = Cart::where("dtoken",$dtoken)->get();
          if($Cart){
            foreach ($Cart as $key => $value) {
            $value->delete();
            }
          }
          break;
        case 2:
          $product->status = 1;
          $status = 1;

          break;
      }

      $return=$product->save()?$status:array('code'=>'5','msg'=>'网络错误');
      return $this->result($return);
  }


  #商品分类列表
  public function catlist(Request $request) {
      #接参
      $name     = $request->input('name');
      $page     = $request->input('page');
      $pageSize = $request->input('pageSize');    
      $page     = empty($page)     ? 1 : $page;   
      $take     = empty($pageSize) ?  10 : $pageSize;
      $skip     = ($page - 1) * $take;
      if(empty($name)){
        $count = Category::count();
        $list  = Category::skip($skip)->take($take)->get();
      }else{
        $count = Category::where('cat_name','like',"%".$name."%")->count();
        $list  = Category::skip($skip)->take($take)->where('cat_name','like',"%".$name."%")->get();
      }
     
      $Model['list']=$list;
      $Model['sumpage']=ceil($count/$take);
      // $Model['count']=$count;

      return $this->result($Model);
  }

  #商品分类添加
  public function catadd(Request $request)
  {

      if($this->verCode($request->all(),[
          'cat_name'   =>'required',
          'img'   =>'required',
      ])){
        return $this->publicparaResponse();
      }

      #接参  
      $cat_name = $request->input('cat_name');
      $img = $request->input('img');
      $Category = Category::where('cat_name',$cat_name)->first();  
      if($Category){
          return $this->result(array('code'=>'5','msg'=>'分类名已存在'));
      }

      $CategoryMod = new Category();
      $CategoryMod->cat_name = $cat_name;
      $CategoryMod->img = $img;
          
      // $returns = $CategoryMod->save()?[]:array('code'=>'5','msg'=>'网络错误');
      // $return=$CategoryMod->save()?'<div class="cfD"><a style="font-size: 40px;" href="http://aiyang.shoumeikeji.cn/mall/goods_cart_index.html">修改成功-返回首页</a></div>'
      // :'<div class="cfD"><a style="font-size: 70px;" href="http://aiyang.shoumeikeji.cn/mall/goods_cart_index.html">修改失败-返回添加</a></div>';
      // echo $return;
      $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
      $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      $r = $CategoryMod->save()? $success:$error;
      // return $this->result($returns);
  }

   #商品分类详情
  public function catdeit(Request $request)
  {

      if($this->verCode($request->all(),[
          'cat_id'   =>'required',
      ])){
        return $this->publicparaResponse();
      }

      #接参  
      $cat_id   = $request->input('cat_id');
      $Category = Category::where('cat_id',$cat_id)->first();   
      if(!$Category){
        $Category = array('code'=>'5','msg'=>'网络错误');
      }

      return $this->result($Category);
  }

   #商品分类修改
  public function catedit(Request $request)
  {
      if($this->verCode($request->all(),[
          'cat_id'   =>'required',
          'cat_name'   =>'required',
          'img'   =>'required',
      ])){
        return $this->publicparaResponse();
      }

      $cat_id = $request->input('cat_id'); 
      $cat_name = $request->input('cat_name'); 
      $img = $request->input('img');
      $Category = Category::where('cat_id',$cat_id)->first();  
      $Category->cat_name = $cat_name ;
      $Category->img = $img  ;
      // $return=$Category->save()?'<div class="cfD"><a style="font-size: 50px;" href="http://aiyang.shoumeikeji.cn/mall/goods_cart_index.html">加添成功-返回首页</a></div>'
      // :'<div class="cfD"><a style="font-size: 50px;" href="http://aiyang.shoumeikeji.cn/mall/goods_cart_index.html">加添失败-返回添加</a></div>';
      // echo $return;
      $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
      $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      $r = $Category->save()? $success:$error;
      // $return=$Category->save()?[]:array('code'=>'5','msg'=>'网络错误');
      // return $this->result($return);
  }

  #商品分类删除
  public function catdel(Request $request)
  {
       if($this->verCode($request->all(),[
          'cat_id'   =>'required',
      ])){
        return $this->publicparaResponse();
      }

      #接参  
      $cat_id   = $request->input('cat_id'); 
      $Category = Category::where('cat_id',$cat_id)->first();  
      $return = $Category->delete()?[]:array('code'=>'5','msg'=>'网络错误');
      return $this->result($return);
  }







#底部
}

// namespace App\Http\Back\Goods;

// use App\Services\Back\Goods\GoodsList;
// use App\Services\Back\Goods\GoodsDel;
// use App\Services\Back\Goods\GoodsDetail;
// use App\Services\Back\Goods\GoodsEdit;
// use App\Services\Back\Goods\GoodsAdd;
// use App\Services\Back\Goods\GoodsSwitch;
// use App\Services\Sys\Img;

// use App\Http\BaseController;
// use Illuminate\Http\Request;
// use Validator;
  // class GoodsController extends BaseController
// {
  //   $page = $request->input('pageIndex');
    // $page = empty($page) ? 1: $page;

  //   $pageSize = $request->input('pageSize');
  //   $pageSize = empty($pageSize) ? 15: $pageSize;

  //   $token = empty($request->input('token'))? 0 : $request->input('token');

  //   $name = $request->input('name');

  //   $obj = new Goodslist;
  //   $res = $obj->Index($pageSize,$page,$token,$request->input('name'));

  //   return $this->resmsg($res);
  // }
 // public function Del(Request $request){
    // if($this->verCode($request->all(),[
    //   'dtoken'   =>'required',
    // ])){
    //   return $this->publicparaResponse();
    // }
    // $obj = new GoodsDel();
    // $res = $obj->Index($token);

    // return $this->resmsg($res);

  // }

//    public function Add(Request $request){

//     if($this->verCode($request->all(),[
//       'name'   =>'required',
//       'store'   =>'required|numeric',
//       'price'   =>'required|numeric',
//       'status'   =>'required|numeric',
//       'desc'   =>'required',
//       'cat_id'   =>'required|numeric',
//       'img'   =>'required',
//     ])){
//       return $this->publicparaResponse();
//     }
//    
 
//     $Models=new Goods();

//     $res = $obj->Index($data);

//     return $this->resmsg($res);

//   }


//   public function Swicth(Request $request){
//     if($this->verCode($request->all(),[
//       'dtoken'   =>'required',
//     ])){
//       return $this->publicparaResponse();
//     }
//     $token = $request->input('dtoken');

//     $obj = new GoodsSwitch();
//     $res = $obj->Index($token);

//     return $this->resmsg($res);
//   }

//   public function Detail(Request $request){
//     if($this->verCode($request->all(),[
//       'dtoken'   =>'required',
//     ])){
//       return $this->publicparaResponse();
//     }
//     $token = $request->input('dtoken');

//     $obj = new GoodsDetail();
//     $res = $obj->Index($token);

//     return $this->resmsg($res);

//   }

 
//   public function Edit(Request $request){
//     if($this->verCode($request->all(),[
//       'dtoken'   =>'required',
//       'name'   =>'required',
//       'store'   =>'required|numeric',
//       'price'   =>'required|numeric',
//       'status'   =>'required|numeric',
//       'desc'   =>'required',
//       'cat_id'   =>'required|numeric',
//       'img'   =>'required',
//     ])){
//       return $this->publicparaResponse();
//     }

//     $data = $request->all();
//     $obj = new GoodsEdit();
//     $res = $obj->Index($data);

//     return $this->resmsg($res);

//   }

// }
