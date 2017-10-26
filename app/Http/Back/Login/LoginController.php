<?php
namespace App\Http\Back\Login;
use App\Http\BaseController;

// use App\Services\Back\Login\AdminLogin;
use App\Services\Back\Login\AdminMenu;
// use App\Services\Back\Login\AdminList;

use Illuminate\Http\Request;
use Validator;
use App\Models\Admin;


class LoginController extends BaseController
{
  public function Login(Request $request){

    $messages = [
			'name.required' => '请输入用户名',
			'password.required' => '请输入密码',
		];
		$validator = Validator::make($request->all(),[
				'name' => 'required',
				'password' => 'required|max:12|min:6|alpha_num',
			],$messages);
		 if ($validator->fails()) {
	      $messages = $validator->errors();
	      $this->responseErrors = $messages->toArray();
	      return $this->publicparaResponse();
	    }

    $data = $request->all();

    $obj = new AdminLogin();
    $res = $obj->Index($data);
	//var_dump($res);die;
    return $this->resmsg($res);

  }


  public function Menu(Request $request)
  {

    $obj = new AdminMenu;
    $res = $obj->Index();

    return $this->resmsg($res);

  }
  
  
	
  /*
  *
  *获取管理员列表
  */
  public function adminlist(Request $request){
	  #接参
	$name 		= $request->input('name');
	$page 		= $request->input('page');
	$pageSize	= $request->input('pageSize');    
	$page     = empty($page)     ? 1 : $page;   
	$take     = empty($pageSize) ? 5 : $pageSize;
	$skip     = ($page - 1) * $take;
	
	
	//$count 	= Admin::count();//求总数	
	//$list 	= Admin::orderby('id','desc')->skip($skip)->take($take)->get();
	if(empty($name)){
        $count 	= Admin::count();//求总数	
		$list 	= Admin::orderby('id','desc')->skip($skip)->take($take)->get();
    }else{
		$count 	= Admin::where('name','like',"%".$name."%")->count();//求总数	
		$list 	= Admin::orderby('id','desc')->skip($skip)->take($take)->where('name','like',"%".$name."%")->get();
    }
	

	 //无数据
	if ($list->toArray() == null) {
		return $this->result(array('code'=>'5','msg'=>'网络错误'));	  
	}
	
	$Model['list']=$list;
	$Model['sumpage']=ceil($count/$take);
	return $this->result($Model);	
  }
  
  
  /*
  *
  *获取管理员详情
  */
  public function detail(Request $request){
	if($this->verCode($request->all(),[
         'id'=>'required',
      ]))
    { 
      return $this->publicparaResponse();
    }
    $cate=Admin::where('id',$request->input('id'))->first();
	//var_dump($cate);die;
    if (!$cate) {
        $r= array('code'=>'5','msg' => '网络错误');
         return $this->result($r);
      }
    return $this->result($cate);
  }
  
  
  /*
  *
  *修改管理员密码
  */
  public function editadminpwd(Request $request){
	  
	  if($this->verCode($request->all(),[
          'pw' =>'required',
		  'id' =>'required',
      ])){
         return $this->publicparaResponse();
      }

	  //var_dump($request->input('id'));
	  //var_dump($request->input('pw'));
      $admin=Admin::where('id',$request->input('id'))->first();
	  //var_dump($admin);die;
	  
      $admin->password =$request->input('pw');
	  
	  //var_dump($admin->save());die;
      $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
      $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      $r = $admin->save()? $success:$error;
      echo $r;	  
  }
  
  /*
  *添加管理员
  */
  public function addadmin(Request $request){
	  if($this->verCode($request->all(),[
          'name' =>'required',
		  'password' =>'required',
      ])){
         return $this->publicparaResponse();
      }
	  
	  $res=Admin::where('name',$request->input('name'))->first();
	  
	  if($res){//判断该用户名是否已经添加
		  $r= array('code'=>'5','msg' => '该管理员已存在，请修改管理员姓名');
	       return $this->result($r);
	  }
	  $admin = new Admin;
	  $admin->name = $request->input('name');
	  $admin->password = $request->input('password');
	  $admin->type = $request->input('type');
	  $admin->ctime = time();
	  
	  $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
      $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
      $r = $admin->save()? $success:$error;
      echo $r;
  }

    // public function List(Request $request)
    // {

    //   $obj = new AdminList;
    //   $res = $obj->Index();

    //   return $this->resmsg($res);

    // }



}
