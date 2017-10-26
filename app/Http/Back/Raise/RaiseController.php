<?php
namespace App\Http\Back\Raise;
use App\Http\BaseController;
// use App\Services\Back\Raise\RaiseList;
// use App\Services\Back\Raise\RaiseDetail;
use Illuminate\Http\Request;
use Validator;
use App\Models\Raise;
use App\Models\Raisedetail;
use App\Models\Raisepic;
use App\Models\Raiselevel;
use App\Models\Users;
use App\Models\UserInfo;
class RaiseController extends BaseController
{

  #众筹列表
  public function List(Request $request)
  {
    $page     = $request->input('page');
    $pageSize = $request->input('pageSize');

    $page     = empty($page)     ? 1 : $page;
    $take     = empty($pageSize) ? 5 : $pageSize;
    $skip     = ($page - 1) * $pageSize;

    $count    = Raise::count();
    $RaiseArr = Raise::skip($skip)->take($take)->get();
    $Model['list']     =  $RaiseArr;  
    $Model['count']    =  $count;
    $Model['pageSize'] =  $take;
    $Model['sumpage']  =  ceil($count/$take);
    return $this->result($Model);
  }

  #支持众筹列表
  public function UserList(Request $request)
  {
      if($this->verCode($request->all(),[
          'rtoken'   =>'required',
        ])){
          return $this->publicparaResponse();
        }
      $rtoken = $request->input('rtoken');
      $page     = $request->input('page');
      $pageSize = $request->input('pageSize');
      $page     = empty($page)     ? 1 : $page;   
      $take     = empty($pageSize) ? 5 : $pageSize;
      $skip     = ($page - 1) * $pageSize;

      $count = Raisedetail::where('rtoken',$rtoken)->count();
      #当前众筹下的支持
      $RaisedetailArr   = Raisedetail::where('rtoken',$rtoken)->get();
      $Model['list'] = isset($RaisedetailArr)?$RaisedetailArr:
                          array('code'=>'5','msg'=>'网络错误');

      $Model['count']    =  $count;
      $Model['pageSize'] =  $pageSize;
      $Model['sumpage']  =  ceil($count/$pageSize);
      return $this->result($Model);
  }
  

  #众筹分档列表
  public function MoneyList(Request $request)
  {
      if($this->verCode($request->all(),[
          'rtoken'   =>'required',
        ])){
          return $this->publicparaResponse();
        }
      //接参
      $rtoken   = $request->input('rtoken'); 
      $page     = $request->input('page');
      $pageSize = $request->input('pageSize');
      $page     = empty($page)     ? 1 : $page;   
      $take     = empty($pageSize) ? 5 : $pageSize;
      $skip     = ($page - 1) * $pageSize;

      $count    =  Raiselevel::where('rtoken',$rtoken)->count();
      $Raiselevelarr   = Raiselevel::where('rtoken',$rtoken)->get();
      $Model['list']   = !empty($Raiselevelarr)?$Raiselevelarr:
                         array('code'=>'5','msg'=>'网络错误');

      $Model['count']    =  $count;
      $Model['pageSize'] =  $pageSize;
      $Model['sumpage']  =  ceil($count/$pageSize);
      return $this->result($Model);
  }

  #众筹图片列表
  public function ImgList(Request $request)
  {
      if($this->verCode($request->all(),[
          'rtoken'   =>'required',
        ])){
          return $this->publicparaResponse();
        }
      $rtoken      = $request->input('rtoken'); 
      $Raisepicarr = Raisepic::where('rtoken',$rtoken)->get();
      $RaisepicModel = !empty($RaisepicModel)?$RaisepicModel:
                       array('code'=>'5','msg'=>'网络错误');
       return $this->result($RaisepicModel);
  }


  public function Imgdetail($value='')
  {
    # code...
  }

  #众筹详情
  public function Detail(Request $request)
  {
    if($this->verCode($request->all(),[
      'rtoken'   =>'required',
    ])){
      return $this->publicparaResponse();
    }

    $rtoken = $request->input('rtoken');

    $RaiseModel = Raise::where('rtoken',$rtoken)->first(); 
   
    $RaiseModel['goal'] = $RaiseModel['goal']/100;
    $RaiseModel['left'] = $RaiseModel['left']/100;
    $RaiseModel['desc'] = file_exists($RaiseModel['desc'])?
                          file_get_contents($RaiseModel['desc']):'';

    return $this->result($RaiseModel);
  }

  #支持众筹详情
  public function UserDetail(Request $request)
  {
    if($this->verCode($request->all(),[
          'rtoken'   =>'required',
        ])){
          return $this->publicparaResponse();
        }
      $rtoken = $request->input('rtoken');
      
      #当前众筹下的支持
      $RaisedetailArr   = Raisedetail::where('rtoken',$rtoken)->first();
      $RaisedetailModel = !empty($RaisedetailArr)?$RaisedetailArr:
                          array('code'=>'5','msg'=>'网络错误');
      return $this->result($RaisedetailModel);
  }

  #众筹分档详情
  public function MoneyDetail(Request $request)
  {
    if($this->verCode($request->all(),[
          'rtoken'     =>'required',
          'id'         =>'required',

        ])){
          return $this->publicparaResponse();
        }
      //接参
      $rtoken     = $request->input('rtoken');
      $id   = $request->input('id');
   
      $Raiselevelarr   = Raiselevel::where('rtoken','=',$rtoken)->where('id','=',$id)->first();
      $RaiselevelModel = !empty($Raiselevelarr)?$Raiselevelarr:
                         array('code'=>'5','msg'=>'网络错误');
      return $this->result($RaiselevelModel);
  }

  #众筹编辑
  public function Edit(Request $request)
  {

      if($this->verCode($request->all(),[
          'rtoken'  =>'required',
          'name'    =>'required',
          'r_pic'   =>'required',
          'process' =>'required',
          'status'  =>'required',
          'desc'  =>'required',
          'detail'  =>'required',
        ])){
          return $this->publicparaResponse();
        }
      //接参
        $rtoken   = $request->input('rtoken');
       
      $RaiseModel = Raise::where('rtoken',$rtoken)->first();  
      if(!$RaiseModel){
         $returns = array('code'=>'5','msg'=>'众筹不存在');
      }
      $NameModel = Raise::where('name',$request->input('name'))->first();         
      
      if($NameModel){
        if($NameModel['rtoken'] !== $request->input('rtoken')){
         $returns = array('code'=>'5','msg'=>'众筹名已存在,请重新命名');
         return $this->result($returns);
        }
      }


      $filename = 'file/Raise/'.time().'.txt';
      $desc = file_put_contents($filename,trim($request->input('desc')));

      if (!$desc) {
         $returs= array('code'=>'5','msg' => '写入文件失败');
         return $this->result($returs);
      }
      

      $RaiseModel->r_pic    = $request->input('r_pic');
      $RaiseModel->name     = $request->input('name');      
      $RaiseModel->status   = $request->input('status');    
      $RaiseModel->desc     = $filename;        
      $RaiseModel->detail   = $request->input('detail'); 
      $returns = $RaiseModel->save()?[]:array('code'=>'5','msg'=>'网络错误');
      return $this->result($returns);
  }

  #支持众筹编辑
  public function UserEdit(Request $request)
  {
    if($this->verCode($request->all(),[
          'rtoken'    =>'required',
          'user_name' =>'required',
          'order_sn'  =>'required',
          'mobile'    =>'required',
        ])){
          return $this->publicparaResponse();
        }
      $rtoken     = $request->input('rtoken');
      $user_name  = $request->input('user_name');
      $mobile     = $request->input('mobile');
      $order_sn   = $request->input('order_sn');
      
      #当前众筹下的支持
      $RaisedetailArr   = Raisedetail::where('rtoken',$rtoken)->where('order_sn',$order_sn)->first();
      $RaisedetailArr->user_name = $user_name;
      $RaisedetailArr->mobile    = $mobile;
      $returns = $RaisedetailArr->save()?[]:array('code'=>'5','msg'=>'网络错误');
      return $this->result($returns);
  }



  #众筹分档编辑
  public function MoneyEdit(Request $request)
  {
    if($this->verCode($request->all(),[
          'rtoken'  =>'required',
          'desc'    =>'required',
          'money'   =>'required',
          'id'      =>'required',
        ])){
          return $this->publicparaResponse();
        }


      $rtoken = $request->input('rtoken');
      $desc   = $request->input('desc');
      $money  = $request->input('money');
      $id     = $request->input('id');


      $RaiselevelModel = Raiselevel::where('rtoken',$rtoken)->where('id',$id)->first();
      $RaiselevelModel->desc   = $request->input('desc');
      $RaiselevelModel->money  = $request->input('money');      
      $returns = $RaiselevelModel->save()?[]:array('code'=>'5','msg'=>'网络错误');
      return $this->result($returns);
  }



  #众筹删除
  public function deletes(Request $request)
  {
     if($this->verCode($request->all(),[
          'rtoken'  =>'required',          
        ])){
          return $this->publicparaResponse();
        }

      $rtoken = $request->input('rtoken');

      $RaiseModel = Raise::where('rtoken',$rtoken)->first();

      if(!$RaiseModel){
         $returns = array('code'=>'5','msg'=>'众筹不存在');
         return $this->result($returns);
      }
      $returns = $RaiseModel->delete()?[]:array('code'=>'5','msg'=>'网络错误');
      return $this->result($returns);
  }

  #支持众筹删除
  public function userdeletes(Request $request)
  {
     if($this->verCode($request->all(),[
          'rtoken'    =>'required',          
          'order_sn'  =>'required',          
        ])){
          return $this->publicparaResponse();
        }

      $rtoken = $request->input('rtoken');
      $order_sn = $request->input('order_sn');

      $RaisedetailModel = Raisedetail::where('rtoken',$rtoken)->where('order_sn',$order_sn)->first();
      if(!$RaisedetailModel){
         $returns = array('code'=>'5','msg'=>'众筹不存在');
         return $this->result($returns);
      }
      $returns = $RaisedetailModel->delete()?[]:array('code'=>'5','msg'=>'网络错误');
      return $this->result($returns);
  }

  #众筹分档删除
  public function moneydeletes(Request $request)
  {
    if($this->verCode($request->all(),[
          'rtoken'  =>'required',          
          'id'      =>'required',          
        ])){
          return $this->publicparaResponse();
        }

      $rtoken = $request->input('rtoken');
      $id     = $request->input('id');

      $RaiselevelModel = Raiselevel::where('rtoken',$rtoken)->where('id',$id)->first();
      if(!$RaiselevelModel){
         $returns = array('code'=>'5','msg'=>'分档不存在');
         return $this->result($returns);
      }
      $returns = $RaiselevelModel->delete()?[]:array('code'=>'5','msg'=>'网络错误');
      return $this->result($returns);
  }

}
