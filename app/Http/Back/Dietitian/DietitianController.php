<?php
namespace App\Http\Back\Dietitian;
use App\Http\BaseController;
use Illuminate\Http\Request;
use Validator;
use App\Models\Users;
use App\Models\UserInfo;
use App\Models\Dietorder;
use App\Models\Dietorderdetail;
use App\Models\Dietproduct;
use App\Models\AskList;
use App\Models\Askorder;
use App\Models\Askadditional;
use App\Models\Askconslist;
use App\Models\Dietcate;
use App\Models\Dietinfo;
use App\Models\Quanarticle;
use App\Models\Quancommend;
use App\Models\Quanpic;
use App\Models\Quanlook;
use App\Services\Sys\Img;
use App\Services\BaseService;

use App\Helpers\Curl;
use App\Helpers\actionjssdk;//微信jsdk


class DietitianController extends BaseController
{
    function __construct() 
    {
        $this->curl = new Curl();
        
    }
    #入驻成功给营养师发送的模板消息
    public function Rzmbxx($openid,$tag){
       
        $tagname=Dietcate::where('id',$tag)->select('name')->first();
        $jssdk = new actionjssdk();
            $astoken = $jssdk->getToken();
            // $utoken=$request->input('token');#用户标识#
        $url="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$astoken;
        $data=' {
            "touser":"'.$openid.'",
            "template_id":"FywYWrZemiQD3UDndt3FJ5OpNXVpjjLEP9anqPqmqO8",
            "url":"http://wx.shoumeikeji.cn/diet/index.html",
            "data":{
                   "first": {
                       "value":"恭喜您，通过认证！\n 欢迎加入爱样营养师大家庭",
                       "color":"#173177"
                   },
                   "keyword1":{
                       "value":"爱样营养师",
                       "color":"#173177"
                   },
                   "keyword2": {
                       "value":"'.$tagname['name'].'", 
                       "color":"#173177"
                   },
                   "remark":{
                       "value":"请进入  找营养师->我的  点击头像进行更换",
                       "color":"#173177"
                   }
           }
       }';
       // ovxXWv5Ldfh1B4nho4C-Jz6Kgma0
       // "touser":"ovxXWv0E3d57KcmAN_MIEbzMU78w",
       $json=$this->curl->post($url,$data);
       $jsonarr=json_decode($json,true);
       return $jsonarr['errcode'];
        // return $json;
    }


  //营养师列表
  public function List(Request $request) {
      $page     = $request->input('page');
      $pageSize = $request->input('pageSize');
      $name     = $request->input('name');
      $page     = empty($page) ? 1: $page; 
      $pageSize = empty($pageSize) ? 5: $pageSize;
      $skip     = ($page - 1) * $pageSize;
      

      if(empty($name)){
        $count = Dietinfo::where('subscribe',1)->count();
        $list  = Dietinfo::where('subscribe',1)->skip($skip)->take($pageSize)->orderBy('id', 'desc')->get();
      }else{
        $count = Dietinfo::where('subscribe',1)->where('name','like',"%".$name."%")->count();
        $list  = Dietinfo::where('subscribe',1)->skip($skip)->take($pageSize)->where('name','like',"%".$name."%")->orderBy('id', 'desc')->get();
      }


      $Model['list']   =$list;
      $Model['sumpage']=ceil($count/$pageSize);
      $Model['count']  =$count;
      return $this->result($Model);
  }
  //营养师降级
  public function Del(Request $request){

    if($this->verCode($request->all(),[
          'dietitian' =>'required',
      ])){
         return $this->publicparaResponse();
      }
      $dietitian= $request->input('dietitian');
      // var_dump(expression)
      $Model    = Dietinfo::where("dietitian",$dietitian)->first();
      $Users    = Users::where("token",$Model['token'])->first();
      $Users->type=2;
      if( $Users->save() ){
         
          $this->dietDelete($dietitian);//删除


          $Model    = Dietinfo::where("dietitian",$dietitian)->delete();
          if($Model){
          $returns = array('code'=>'1','msg'=>'SUCCESS');
          }else{
          $returns = array('code'=>'5','msg'=>'ERROR');
          }     
      }else{
         
          $this->dietDelete($dietitian);//删除

        $Model    = Dietinfo::where("dietitian",$dietitian)->delete();
        if($Model){
          $returns = array('code'=>'3','msg'=>'SUCCESS');
        }else{
          $returns = array('code'=>'5','msg'=>'ERROR');
        }        
      }
     
      return $this->result($returns);
  }




  #营养师降级删除
  public function dietDelete($dietitian)
  {
    $Model    = Dietinfo::where("dietitian",$dietitian)->first();
    if($Model){
      #删除服务
      $product  = Dietproduct::where("dietitian",$Model['dietitian'])->get();
        if($product){
          foreach ($product as $key => $value) {
              $value->delete();
          }
        }

      #删除服务订单
      $Dietorder = Dietorder::where("dietitian",$Model['dietitian'])->get();
        if($Dietorder){
          foreach ($Dietorder as $key => $value) {
              $value->delete();
          }
        }

     #删除服务订单详情
     $Dietorderdetail = Dietorderdetail::where("dietitian",$Model['dietitian'])->get();
       if($Dietorderdetail){
          foreach ($Dietorderdetail as $key => $value) {
              $value->delete();
          }
       }

      #删除分答
      $AskList = AskList::where("dietitian",$Model['dietitian'])->get();
        if($AskList){
          foreach ($AskList as $key => $values) {
            $values->delete();
            $Askorder = Askorder::where("asktoken",$value['asktoken'])->get();
            foreach ($Askorder as $key => $valuea) {
              $valuea->delete();
            }
          }
        }


      #删除分答追答
      $Askadditional = Askadditional::where("dietitian",$Model['dietitian'])->get();
        if($Askadditional){
          foreach ($Askadditional as $key => $value) {
              $value->delete();
          }
        }

      #删除服务聊天
      $Askconslist = Askconslist::where("dietitian",$Model['dietitian'])->get();
        if($Askconslist){
          foreach ($Askconslist as $key => $value) {
              $value->delete();
          }
        }

      #删除圈子
      $Quanarticle = Quanarticle::where("token",$Model['token'])->get();
        if($Quanarticle){
          foreach ($Quanarticle as $key => $value) {
              // $value->delete();
            #删除圈子评价
              $Quancommend = Quancommend::where("qtoken",$value['qtoken'])->get();
                if($Quancommend){
                  foreach ($Quancommend as $key => $valueend) {
                      $valueend->delete();
                  }
                }

            #删除圈子图片
              $Quanpic = Quanpic::where("qtoken",$value['qtoken'])->get();
              if($Quanpic){
                foreach ($Quanpic as $key => $valuepic) {
                    $valuepic->delete();
                }
              }

            #删除圈子点赞
              $Quanlook = Quanlook::where("qtoken",$value['qtoken'])->get();
              if($Quanlook){
                foreach ($Quanlook as $key => $valuelook) {
                    $valuelook->delete();
                }
              }

              $value->delete();
          }
        }
    }

    //  #删除服务
         //  $product  = Dietproduct::where("dietitian",$dietitian)->get();
         //  if($product){
         //    foreach ($product as $key => $value) {
         //        $value->delete();
         //    }
         //  }

         // #删除服务订单
         // $Dietorder = Dietorder::where("dietitian",$dietitian)->get();
         // if($Dietorder){
         //    foreach ($Dietorder as $key => $value) {
         //        $value->delete();
         //    }
         // }
         // #删除服务订单详情
         // $Dietorderdetail = Dietorderdetail::where("dietitian",$dietitian)->get();
         // if($Dietorderdetail){
         //    foreach ($Dietorderdetail as $key => $value) {
         //        $value->delete();
         //    }
         // }
         // #删除分答
         // $AskList = AskList::where("dietitian",$dietitian)->get();
         // if($AskList){
         //    foreach ($product as $key => $value) {
         //        $value->delete();
         //    }
         //  }
         //  #删除分答偷听
         // $Askorder = Askorder::where("dietitian",$dietitian)->get();
         // if($Askorder){
         //    foreach ($product as $key => $value) {
         //        $value->delete();
         //    }
         //  }
         //  #删除分答追答
         // $Askadditional = Askadditional::where("dietitian",$dietitian)->get();
         // if($Askadditional){
         //    foreach ($product as $key => $value) {
         //        $value->delete();
         //    }
         //  }
         // #删除服务聊天
         // $Askconslist = Askconslist::where("dietitian",$dietitian)->get();
         // if($Askconslist){
         //    foreach ($product as $key => $value) {
         //        $value->delete();
         //    }
         //  }
  }


  // 营养师详情
  public function Detail(Request $request){
    if($this->verCode($request->all(),[
          'dietitian' =>'required',
      ])){
         return $this->publicparaResponse();
      }
      $dietitian= $request->input('dietitian');
      $Model    = Dietinfo::where("dietitian",$dietitian)->first();

      $Model['askprice'] = $Model['askprice']/100;
      $niche = explode(',', $Model['niche']);
      $Model['niche'] = Dietcate::whereIn('id',$niche)->get();
      
      $tag = Dietcate::where('id',$Model['tag'])->first();
      $Model['tag'] = $tag['name'];


      if (!$Model) {
        $r=array('code'=>'5','msg'=>'网络错误');
        return $this->result($r);
      }
      return $this->result($Model);
  }


  //营养师修改
  public function Edit(Request $request){
    if($this->verCode($request->all(),[
          'dietitian' =>'required',
          'desc'      =>'required',
          'askprice'  =>'required',
          'mobile'    =>'required',
          // 'name'    =>'required',
          // 'img'    =>'required',
          'job'       =>'required',
          'education' =>'required',
          'major'     =>'required',
          // 'tag'     =>'required', 
      ])){
         return $this->publicparaResponse();
      }
      $BaseService=new BaseService;
      $data = $request->all();
      $Model=Dietinfo::where('dietitian',$data['dietitian'])->first();
      // $Model->name=$BaseService->trimAll($data['name']);
      // $Model->img =$BaseService->trimAll($data['img']);
      $Model->job     =	$data['job'];
      $Model->education =$data['education'];
      $Model->major   =	$data['major'];
      $Model->mobile  =	$BaseService->trimAll($data['mobile']);
      // $Model->tag =	$data['tag'];
      $Model->desc    =	$data['desc'];
      $Model->askprice=	$BaseService->trimAll($data['askprice'])*100;
      $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
      $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      $r = $Model->save()? $success:$error;
      // return redirect('/');
      // return $this->result($r);
      //   $return=$Model->save()?'<div class="cfD"><a style="font-size: 30px;" href="http://aiyang.shoumeikeji.cn/diet/diet_index.html">修改成功¦-¦点击返回</a></div>'
      // :'<div class="cfD"><a style="font-size: 30px;" href="http://aiyang.shoumeikeji.cn/diet/diet_index.html">修改失败¦-¦点击返回</a></div>';

      echo $r;
      
  }
  //服务列表
  public function ProductList(Request $request){
    if($this->verCode($request->all(),[
          'dietitian' =>'required',
      ])){
         return $this->publicparaResponse();
      }
    $page     = $request->input('page');
      $pageSize = $request->input('pageSize');
      $dietitian= $request->input('dietitian');
      $page     = empty($page) ? 1: $page; 
      $pageSize = empty($pageSize) ? 5: $pageSize;
      $skip     = ($page - 1) * $pageSize;

      $count = Dietproduct::where('dietitian',$dietitian)->count();
      $list  = Dietproduct::skip($skip)->take($pageSize)->where('dietitian',$dietitian)->orderBy('id', 'desc')->get();
      
      $Model['list']   =$list;
      $Model['sumpage']=ceil($count/$pageSize);
      // $Model['count']  =$count;
      return $this->result($Model);
  }

  //服务添加
  public function ProductAdd(Request $request){
    if($this->verCode($request->all(),[
          'dietitian' =>'required',
          'title'     =>'required',
          'img'     =>'required',
          'desc'    =>'required',
          'price'     =>'required',
          'month'     =>'required',
          'way'     =>'required',//选择的是年、月、日
          'area'    =>'required',
      ])){
         return $this->publicparaResponse();
      }
      $BaseService =  new BaseService;
      $data = $request->all();
      $qtoken='P'.date('YmdHis').rand(1000,9999);

      $Model=new Dietproduct;
      $Model->ptoken   =$qtoken;
      $Model->dietitian=$data['dietitian'];
      $Model->title    =$BaseService->trimAll($data['title']);
      $Model->img      =$data['img'];
      $Model->desc     =$data['desc'];
      $Model->month    =$data['month'];
      $Model->way      =$data['way'];
      $Model->area     =$data['area'];
      $Model->price    =$data['price']*100;
      $return=$Model->save()?'<div class="cfD"><a style="font-size: 30px;" href="http://aiyang.shoumeikeji.cn/diet/diet_servicer.html?dietitian='.$data['dietitian'].'">添加成功¦-¦点击返回</a></div>' :"<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      echo $return;
      // $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
      // $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      // $r = $Model->save()? $success:$error;
      // echo $r;
      // return $this->result($r);
  }



  //服务详情
  public function ProductDetail(Request $request){
    if($this->verCode($request->all(),[
          'dietitian'=>'required',
          'ptoken'   =>'required',
      ])){
         return $this->publicparaResponse();
      }
      $dietitian= $request->input('dietitian');
      $ptoken   = $request->input('ptoken');
      $action   = $request->input('action');
      $Model    = Dietproduct::where("dietitian",$dietitian)->where('ptoken',$ptoken)->first();
      if(!empty($action)){
        $Model->list   = Dietinfo::all();
      }
      $Model->price=$Model->price/100;
      return $this->result($Model);
  }


 
  //服务删除
  public function ProductDel(Request $request){
    if($this->verCode($request->all(),[
          'dietitian' =>'required',
          'ptoken'    =>'required',
      ])){
         return $this->publicparaResponse();
      }
      $dietitian= $request->input('dietitian');
      $ptoken   = $request->input('ptoken');
      $product  = Dietproduct::where("dietitian",$dietitian)->where('ptoken',$ptoken)->first();
      $r = $product ->delete()?array('code'=>'1','msg'=>'删除成功'):array('code'=>'5','msg'=>'删除失败');
      return $this->result($r);
  }

  //服务编辑
  public function ProductEdit(Request $request){
    if($this->verCode($request->all(),[
          'dietitian' =>'required',
          'ptoken'    =>'required',
          'title'     =>'required',
          'img'       =>'required',
          'desc'      =>'required',
          'price'     =>'required',
          'month'     =>'required',
          'way'       =>'required',
          'area'      =>'required',
      ])){
         return $this->publicparaResponse();
      }
      $BaseService = new BaseService;
      $data = $request->input();
      $Model=Dietproduct::where('dietitian',$data['dietitian'])->where('ptoken',$data['ptoken'])->first();
      if(!$Model){
        $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      }
      $Model->title=$data['title'];
      $Model->img  =$data['img'];
      $Model->desc =$BaseService->trimAll($data['desc']);
      $Model->month=$BaseService->trimAll($data['month']);
      $Model->way =$data['way'];
      $Model->area =$data['area'];
      $Model->price=$data['price']*100;
    
      $return=$Model->save()?'<div class="cfD"><a style="font-size: 30px;" href="http://aiyang.shoumeikeji.cn/diet/diet_servicer.html?dietitian='.$data['dietitian'].'">修改成功-¦点击返回</a></div>' :"<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      echo $return;
      // $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
      // $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      // $r = $Model->save()? $success:$error;
      // echo $r;
      // $r = $Model->save()? []:array('code'=>'5','msg'=>'É¾³ýÊ§°Ü');
      // return $this->result($Model);
  }


  //服务订单列表
  public function OrderList(Request $request){
    $page     = $request->input('page');
      $pageSize = $request->input('pageSize');
      $name     = $request->input('name');
      
      $page     = empty($page) ? 1: $page; 
      $pageSize = empty($pageSize) ? 5: $pageSize;
      $skip     = ($page - 1) * $pageSize;
      if(empty($name)){
        $count = Dietorder::count();
        $list  = Dietorder::skip($skip)->take($pageSize)->orderBy('id', 'desc')->get();
      }else{
        $array = UserInfo::where('user_name',$name)->select('token')->first();
        $count = Dietorder::where('token',$array['token'])->count();
        $list  = Dietorder::skip($skip)->take($pageSize)->where('token',$array['token'])->orderBy('id', 'desc')->get();
      }
      $UserInfo = UserInfo::get();
         
      foreach ($list as $key => $value) {
         $value['ctime'] = date('Y-m-d',$value['ctime']);
         $value['totalprice'] = $value['totalprice']/100;
           foreach ($UserInfo as $keys => $values) {
              if($value['token']==$values['token']){
                    $value['token_name'] = $values['user_name'];
              }
           }
      }
      $Model['list']   =$list;
      $Model['sumpage']=ceil($count/$pageSize);
      // $Model['count']  =$count;
      return $this->result($Model);
  }

  //服务订单详情
  public function OrderDetail(Request $request){
    if($this->verCode($request->all(),[
          'order_sn' =>'required',
      ])){
         return $this->publicparaResponse();
      }
      $dietitian= $request->input('dietitian');
      $order_sn = $request->input('order_sn');
      $Dietorder= Dietorder::where('order_sn',$order_sn)->first();
      $UserInfo = UserInfo::where('token',$Dietorder['token'])->first();
      $DietInfo = DietInfo::where('dietitian',$Dietorder['dietitian'])->first();
      /*-------------------------------------------------------------*/
      /*·þÎñµÄÓÃ»§*/
      $Dietorder['token_name'] = $UserInfo['user_name'];
      $Dietorder['token_img'] = $UserInfo['user_img'];
      /*·þÎñµÄÓªÑøÊ¦*/
      $Dietorder['dietitian_name'] = $DietInfo['name'];
      $Dietorder['dietitian_img'] = $DietInfo['mgpic'];
      $Dietorder['totalprice'] = $Dietorder['totalprice']/100;
      $Dietorder['ctime'] = date('Y-m-d H:i:s',$Dietorder['ctime']);
      /*-------------------------------------------------------------*/
      $detail   = Dietorderdetail::where('order_sn',$order_sn)->get();
      foreach ($detail as $key => $value) {
        $Dietproduct = Dietproduct::where('ptoken',$value['ptoken'])->first();
        $detail[$key]['title'] = $value['title'];
        $detail[$key]['price'] = $value['price']/100;
        $detail[$key]['month'] = $value['month'];
        $detail[$key]['way'] = $value['way'];
        $detail[$key]['area']  = $value['area'];
      }
      
      /*-------------------------------------------------------------*/
      $Model['detail']   =!empty($Dietorder)?$Dietorder:'';
      $Model['list']     =!empty($detail)?$detail:'';
      return $this->result($Model);
  }

  //服务订单删除
  public function OrderDel(Request $request){
    if($this->verCode($request->all(),[
          'order_sn'  =>  'required',
      ])){
         return $this->publicparaResponse();
      }
      $dietitian = $request->input('dietitian');
      $order_sn  = $request->input('order_sn');
      $pr = Dietorder::where('order_sn',$order_sn)->delete();
      $order  = Dietorderdetail::where('order_sn',$order_sn)->first();
      $r = $order ->delete()?array('code'=>'1','msg'=>'删除成功'):array('code'=>'5','msg'=>'网络错误');
      return $this->result($r);
  }

  //服务分类列表
  public function catlist(Request $request) {
    
      
      $name     = $request->input('name');
      $page     = $request->input('page');
      $pageSize = $request->input('pageSize');    
      $page     = empty($page)     ? 1 : $page;   
      $take     = empty($pageSize) ? 100 : $pageSize;
      $skip     = ($page - 1) * $take;

      if(empty($name)){
        $count = Dietcate::count();
        $list  = Dietcate::skip($skip)->take($take)->orderBy('id', 'desc')->get();
      }else{
        $count = Dietcate::where('name','like',"%".$name."%")->count();
        $list  = Dietcate::skip($skip)->take($take)->where('name','like',"%".$name."%")->orderBy('id', 'desc')->get();
      }

      $dietcate = Dietcate::all();
      foreach ($list as $k => $v) {
          foreach ($dietcate as $kk => $vv) {
              if($v['parent']==$vv['id']){
                 $list[$k]['parent'] = $vv['name'];
              }
          }
      }

      $Model['list']=$list;
      $Model['sumpage']=ceil($count/$take);
      // $Model['count']=$count;

      return $this->result($Model);
  }
  #服务分类添加
  public function cadds(Request $request)
  {
    if($this->verCode($request->all(),[
      'parent'=>'required',
      'name'=>'required',
      ]))
    { 
      return $this->publicparaResponse();
    }
    $res=Dietcate::where('name',$request->input('name'))->first();
    if($res){
       $r= array('code'=>'5','msg' => '网络错误');
         return $this->result($r);
    }
    $cate=new Dietcate;
    $cate->parent=$request->input('parent');
    $cate->name=$request->input('name');
    // $return=$cate->save()?[]:array('code'=>'5','msg'=>'ÍøÂç´íÎó');
   //     return $this->result($return);
    // $return=$cate->save()?'<div class="cfD"><a style="font-size: 30px;" href="http://aiyang.shoumeikeji.cn/diet/diet_case.html">添加成功¦-¦点击返回</a></div>'
    //   :'<div class="cfD"><a style="font-size: 30px;" href="http://aiyang.shoumeikeji.cn/diet/diet_case.html">添加失败¦-¦点击返回</a></div>';
    //   echo $return;
      $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
      $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      $r = $cate->save()? $success:$error;
  }

  #服务分类详情
  public function cdetail(Request $request){
    if($this->verCode($request->all(),[
         'id'=>'required',
      ]))
    { 
      return $this->publicparaResponse();
    }
    $cate=Dietcate::where('id',$request->input('id'))->first();
    if (!$cate) {
        $r= array('code'=>'5','msg' => '网络错误');
         return $this->result($r);
      }
    $dietcate = Dietcate::where('parent',0)->get();
    $cate['cates']= $dietcate;
    return $this->result($cate);
  }

  #服务分类编辑
  public function cedit(Request $request)
  {
    if($this->verCode($request->all(),[
      'parent'=>'required',
      'name'=>'required',
      'id'=>'required',
      ]))
    { 
      return $this->publicparaResponse();
    }
    $cate = Dietcate::where('id',$request->input('id'))->first();
    $cate->name=$request->input('name');
    $cate->parent=$request->input('parent');
    // $return=$cate->save()?[]:array('code'=>'5','msg'=>'ÍøÂç´íÎó');
   //     return $this->result($return);
     // $return=$cate->save()?'<div class="cfD"><a style="font-size: 30px;" href="http://aiyang.shoumeikeji.cn/diet/diet_case.html">修改成功¦-¦点击返回</a></div>'
     //  :'<div class="cfD"><a style="font-size: 30px;" href="http://aiyang.shoumeikeji.cn/diet/diet_case.html">修改失败¦-¦点击返回</a></div>';
     //  echo $return;
     $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
     $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
     $r = $cate->save()? $success:$error;

  }
  #服务分类删除
  public function cdel(Request $request){
    if($this->verCode($request->all(),[
      'id'=>'required',
      ]))
    { 
      return $this->publicparaResponse();
    }
    $cate=Dietcate::where('id',$request->input('id'))->first();
    if (!$cate) {
        $r= array('code'=>'5','msg' => '网络错误');
         return $this->result($r);
      }
    $return=$cate->delete()?[]:array('code'=>'5','msg'=>'ÍøÂç´íÎó');
    return $this->result($return);
  }

  #营养师审核
  public function approval(Request $request) {
    if($this->verCode($request->all(),[
      'dietitian'=>'required',
      'status'=>'required',
      ]))
    { 
      return $this->publicparaResponse();
    }
    
    $dietitian     = $request->input('dietitian');
    $status     = $request->input('status');
    $Dietinfo = Dietinfo::where('dietitian',$dietitian)->first();
    $Users  = Users::where('token',$Dietinfo['token'])->first();
    switch ($status) {
      case '1':
          $Dietinfo->status = 0;#未审
          $Users->type = 2;
          $data = 0;
          // $this->approvalDelete($Users['token']);
        break;
      case '0':
          $Dietinfo->status = 1;#通过
          $Users->type = 3;
          $data = 1;
          $this->Rzmbxx($Users->openid,$Dietinfo->tag);
        break;  
    }
    if( $Users->save() ){
       if( $Dietinfo->save() ){
      $returns = $data;
      }else{
        $returns = array('code'=>'5','msg'=>'网络错误');
      }
    }else{
       $returns = array('code'=>'5','msg'=>'网络错误');
    }
   
    return $this->result($returns);
  }



  public function approvalDelete($token)
  {

     $Users  = Users::where('token',$token)->first();
     #删除服务订单
      $Dietorder = Dietorder::where("token",$Users['token'])->get();
        if($Dietorder){
          foreach ($Dietorder as $key => $value) {
              $value->delete();
          }
        }

     #删除服务订单详情
     $Dietorderdetail = Dietorderdetail::where("token",$Users['token'])->get();
       if($Dietorderdetail){
          foreach ($Dietorderdetail as $key => $value) {
              $value->delete();
          }
       }

      #删除分答
      $AskList = AskList::where("token",$Users['token'])->get();
        if($AskList){
          foreach ($AskList as $key => $value) {
              $value->delete();
          }
        }

      #删除分答偷听
      $Askorder = Askorder::where("token",$Users['token'])->get();
        if($Askorder){
          foreach ($Askorder as $key => $value) {
              $value->delete();
          }
        }

      #删除分答追答
      $Askadditional = Askadditional::where("token",$Users['token'])->get();
        if($Askadditional){
          foreach ($Askadditional as $key => $value) {
              $value->delete();
          }
        }

      #删除服务聊天
      $Askconslist = Askconslist::where("token",$Users['token'])->get();
        if($Askconslist){
          foreach ($Askconslist as $key => $value) {
              $value->delete();
          }
        }

      #删除圈子
      $Quanarticle = Quanarticle::where("token",$Model['token'])->where('type',1)->get();
        if($Quanarticle){
          foreach ($Quanarticle as $key => $value) {
              // $value->delete();
            #删除圈子评价
              $Quancommend = Quancommend::where("qtoken",$value['qtoken'])->get();
                if($Quancommend){
                  foreach ($Quancommend as $key => $valueend) {
                      $valueend->delete();
                  }
                }

            #删除圈子图片
              $Quanpic = Quanpic::where("qtoken",$value['qtoken'])->get();
              if($Quanpic){
                foreach ($Quanpic as $key => $valuepic) {
                    $valuepic->delete();
                }
              }

            #删除圈子点赞
              $Quanlook = Quanlook::where("qtoken",$value['qtoken'])->get();
              if($Quanlook){
                foreach ($Quanlook as $key => $valuelook) {
                    $valuelook->delete();
                }
              }
         } 
       }
  }

  
  #图片上传接口
  public function index(Request $request)
  {
    $types    =   trim($request->input('type'));
    $type     =   empty($types)? 1:$types;
    $ImgObj   = new Img();
    $key    = array_keys($_FILES);
    $returns  = $ImgObj->index($key[0],$type);
    return $this->result($returns);
  }
}