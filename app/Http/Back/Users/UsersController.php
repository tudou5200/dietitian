<?php
namespace App\Http\Back\Users;

use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\UserInfo;
use App\Models\Dietinfo;
use App\Models\Admin;
use App\Models\Goods;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\BakeArticle;
use App\Models\BakeCase;
use App\Models\UsersTickling;
use App\Models\UserEarningsAt;
use App\Models\UserEarningsBay;
use App\Models\UserEarningsThe;
use App\Models\Userwithdrawal;
use Validator;
use App\Models\UserSpokesmanMapping;
use App\Models\Commission;

class UsersController extends BaseController
{

	#用户列表 2=会员  1=粉丝  3=营养师
 	public function listy(Request $request)
 	{
 		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;

    	$type  =  2;
		
		if(empty($name)){
			$count = Users::where('type',$type)->count();//求总数	 
			$list  = Users::skip($skip)->take($take)->where('type','=',$type)->select('mobile','token')->orderBy('id', 'desc')->get();
		}else{
			
			//搜索时 先验证是否有用户，再用wherein
			$user = UserInfo::where('user_name','like',"%".$name."%")->select('token')->get();
			if($user){
				$count = Users::where('type',$type)->whereIn('token',$user->toArray())->count();//求总数
				$list  = Users::skip($skip)->take($take)->where('type','=',$type)->whereIn('token',$user->toArray())->select('mobile','token')->orderBy('id', 'desc')->get();
			}
		}
	    
	    //无数据
	    if ($list->toArray() == null) {
	    	return $this->result(array('code'=>'5','msg'=>'网络错误'));	  
	    }
	    $user_info = UserInfo::whereIn('token',array_column($list->toArray(),'token') )
	    			->select('user_img','user_name','token','ctime')->get();
	    $user_info = array_column($user_info->toArray(),Null,'token');

	    foreach ($list as $key => &$value) {
	      if( in_array($value['token'],array_keys($user_info) ) ){
	        $value['user_name'] = $user_info[$value['token']] ? $user_info[$value['token']]['user_name'] : "";
	        $value['user_img']  = $user_info[$value['token']] ? $user_info[$value['token']]['user_img'] : "";
	        $value['ctime']  	= $user_info[$value['token']] ? date('Y-m-d',$user_info[$value['token']]['ctime']) : "";
	      }else{
	        $value['user_name'] = "";
	        $value['user_img']  = "";
	        $value['ctime']  	= "";
	      }
	    }
	    $returns = $list?array('list'=> $list,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
	    return $this->result($returns);	  
 	}
	
	
	/*
	*
	*join版的用户列表
	*用户列表 2=会员  1=粉丝  3=营养师	
	*/
	public function listys(Request $request){
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;
		$type  =  2;
		
		if(empty($name)){
			$count = Users::join('user_info', function($join){$join->on('user.token', '=', 'user_info.token');})->where('user.type', '=', $type)->count();
			$list = Users::join('user_info', function($join){$join->on('user.token', '=', 'user_info.token');})->skip($skip)->take($take)->where('user.type','=',$type)->orderBy('user.id','desc')->get();
		}else{
			$count = Users::join('user_info', function($join){$join->on('user.token', '=', 'user_info.token');})->where('user.type', '=', $type)->where('user_info.user_name','like',"%".$name."%")->count();
			$list = Users::join('user_info', function($join){$join->on('user.token', '=', 'user_info.token');})->skip($skip)->take($take)->where('user.type','=',$type)->where('user_info.user_name','like',"%".$name."%")->orderBy('user.id','desc')->get();
		}
		
		
	    //无数据
	    if ($list->toArray() == null) {
	    	return $this->result(array('code'=>'5','msg'=>'网络错误'));	  
	    }
		
		foreach($list as $k=>$v){
			if($v['ctime']){
				$list[$k]['ctime'] =  empty($v['ctime'])? '' : date("Y-m-d H:i:s",$v['ctime']);
			}
			
			$list[$k]['mobile'] =  empty($v['mobile'])? '无' : $v['mobile'] ;
			
			
		}
		
		$returns = $list?array('list'=> $list,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
	    return $this->result($returns);
	}
	
	
	/*
	*
	*join版的粉丝列表
	*用户列表 2=会员  1=粉丝  3=营养师	
	*/
	public function listfs(Request $request){
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;
		$type  =  1;
		
		if(empty($name)){
			$count = Users::join('user_info', function($join){$join->on('user.token', '=', 'user_info.token');})->where('user.type', '=', $type)->count();
			$list = Users::join('user_info', function($join){$join->on('user.token', '=', 'user_info.token');})->skip($skip)->take($take)->where('user.type','=',$type)->orderBy('user.id','desc')->get();
		}else{
			$count = Users::join('user_info', function($join){$join->on('user.token', '=', 'user_info.token');})->where('user.type', '=', $type)->where('user_info.user_name','like',"%".$name."%")->count();
			$list = Users::join('user_info', function($join){$join->on('user.token', '=', 'user_info.token');})->skip($skip)->take($take)->where('user.type','=',$type)->where('user_info.user_name','like',"%".$name."%")->orderBy('user.id','desc')->get();
		}
		
		
	    //无数据
	    if ($list->toArray() == null) {
	    	return $this->result(array('code'=>'5','msg'=>'网络错误'));	  
	    }
		
		foreach($list as $k=>$v){
			if($v['ctime']){
				$list[$k]['ctime'] =  empty($v['ctime'])? '' : date("Y-m-d H:i:s",$v['ctime']);
			}
			$list[$k]['mobile'] =  empty($v['mobile'])? '无' : $v['mobile'] ;
		}
		
		$returns = $list?array('list'=> $list,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
	    return $this->result($returns);
	}
	

	#粉丝用户列表
	//由listfs替代，测试无误后，注释
 	public function listf(Request $request)
 	{
 		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;
    	$type  =  1;
		
		if(empty($name)){
			$count = Users::where('type',$type)->count();//求总数	 
			$list  = Users::skip($skip)->take($take)->where('type','=',$type)->select('mobile','token')->orderBy('id', 'desc')->get();
		}else{
			
			//搜索时 先验证是否有用户，再用wherein
			$user = UserInfo::where('user_name','like',"%".$name."%")->select('token')->get();
			if($user){
				$count = Users::where('type',$type)->whereIn('token',$user->toArray())->count();//求总数
				$list  = Users::skip($skip)->take($take)->where('type','=',$type)->whereIn('token',$user->toArray())->select('mobile','token')->orderBy('id', 'desc')->get();
			}
		}
	    
	    //无数据
	    if ($list->toArray() == null) {
	    	return $this->result(array('code'=>'5','msg'=>'网络错误'));	  
	    }
	    $user_info = UserInfo::whereIn('token',array_column($list->toArray(),'token') )
	    			->select('user_img','user_name','token','ctime')->get();
	    $user_info = array_column($user_info->toArray(),Null,'token');

	    foreach ($list as $key => &$value) {
	      if( in_array($value['token'],array_keys($user_info) ) ){
	        $value['user_name'] = $user_info[$value['token']] ? $user_info[$value['token']]['user_name'] : "";
	        $value['user_img']  = $user_info[$value['token']] ? $user_info[$value['token']]['user_img'] : "";
	        $value['ctime']  	= $user_info[$value['token']] ? date('Y-m-d',$user_info[$value['token']]['ctime']) : "";
	      }else{
	        $value['user_name'] = "";
	        $value['user_img']  = "";
	        $value['ctime']  	= "";
	      }
	    }
	    $returns = $list?array('list'=> $list,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
	    return $this->result($returns);	  
 	}
	
	


 	#黑户列表
 	public function listh(Request $request)
 	{
 		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;
    	$type  =  4;
		
		if(empty($name)){
			$count = Users::where('type',$type)->count();//求总数	 
			$list  = Users::skip($skip)->take($take)->where('type','=',$type)->select('mobile','token')->orderBy('id', 'desc')->get();
		}else{
			
			//搜索时 先验证是否有用户，再用wherein
			$user = UserInfo::where('user_name','like',"%".$name."%")->select('token')->get();
			if($user){
				$count = Users::where('type',$type)->whereIn('token',$user->toArray())->count();//求总数
				$list  = Users::skip($skip)->take($take)->where('type','=',$type)->whereIn('token',$user->toArray())->select('mobile','token')->orderBy('id', 'desc')->get();
			}
		}
	    
	    //无数据
	    if ($list->toArray() == null) {
	    	return $this->result(array('code'=>'5','msg'=>'网络错误'));	  
	    }
	    $user_info = UserInfo::whereIn('token',array_column($list->toArray(),'token') )
	    			->select('user_img','user_name','token','ctime')->get();
	    $user_info = array_column($user_info->toArray(),Null,'token');

	    foreach ($list as $key => &$value) {
	      if( in_array($value['token'],array_keys($user_info) ) ){
	        $value['user_name'] = $user_info[$value['token']] ? $user_info[$value['token']]['user_name'] : "";
	        $value['user_img']  = $user_info[$value['token']] ? $user_info[$value['token']]['user_img'] : "";
	        $value['ctime']  	= $user_info[$value['token']] ? date('Y-m-d',$user_info[$value['token']]['ctime']) : "";
	      }else{
	        $value['user_name'] = 	"";
	        $value['user_img']  = 	"";
	        $value['ctime']  	=  	"";
	      }
	    }
	    $returns = $list?array('list'=> $list ,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
	    return $this->result($returns);	  
 	}


 	#用户停用
 	public function UserStop(Request $request)
 	{
 		$token = $request->input('token');
 		$UsersModel = Users::where('token',$token)->first();
 		if(!$UsersModel){
 			$returns = array('code'=>'5','msg'=>'用户不存在');
 		}
 		$UsersModel->type = 4;
 		$returns = $UsersModel->save()?[]:array('code'=>'5','msg'=>'网络错误');
 		return $this->result($returns);	 

 	}


 	#用户详情
 	public function detail(Request $request)
 	{
		#字段不能为空
		if($this->verCode($request->all(),[
			'token'		=>'required',			
		])){
			return $this->publicparaResponse();
		}

 		$token = $request->input('token');
 		$list  = Users::where('token','=',$token)->first();

	    if (!$list) {
	    	return $this->result(array('code'=>'5','msg'=>'没有此用户数据或已被删除'));	
	    }

		$user_info = UserInfo::where('token',$token)->first();
	    if($user_info){
	      $list->user_name = $user_info->user_name;
	      $list->user_img  = $user_info->user_img;
	    }else{
	      $list->user_name = "";
	      $list->user_img  = "";
	    } 		   
		return $this->result($list);	
	}


	#删除用户
	public function Dels(Request $request)
	{

		#字段不能为空
		if($this->verCode($request->all(),[
			'token'		=>'required',			
		])){
			return $this->publicparaResponse();
		}


		$token = $request->input('token');
 		$list  = Users::where('token','=',$token)->first();
 		$user_info = UserInfo::where('token',$token)->first();
 		if(!$list&&!$user_info){
			return $this->result(array('code'=>'5','msg'=>'没有此用户数据或已被删除'));	
 		}
 		
 		if($user_info){
 			$user_i=$user_info->delete();
 			if($user_i){
 				$returns=$list->delete()?[]:array('code'=>'5','msg'=>'没有此用户数据或已被删除');
 			}else{
 				$returns = array('code'=>'5','msg'=>'没有此用户数据或已被删除');
 			}
 		}else{
 			$returns=$list->delete()?[]:array('code'=>'5','msg'=>'没有此用户数据或已被删除');
 		}
 		
 		return $this->result($returns);	
	}

	#编辑会员
	public function Edits(Request $request)
	{
		#字段不能为空
		if($this->verCode($request->all(),[
			'token'		=>'required',
			'mobile'	=>'required',
			'user_name'	=>'required',
			'user_img'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		
		$input     = $request->input();
		$token     = $request->input('token');
		$mobile    = $request->input('mobile');
		$user_name = $request->input('user_name');
		$user_img  = $request->input('user_img');

		$Usersarr = Users::where('token','=',$token)->first();
		$Usersarr->mobile = $mobile;		

		$UserInfoarr = UserInfo::where('token','=',$token)->first();
		$UserInfoarr->user_name = $user_name;
		$UserInfoarr->user_img  = $user_img;

		if(!$Usersarr&&!$UserInfoarr){
			return $this->result(array('code'=>'5','msg'=>'没有此用户数据或已被删除'));	
 		}
 		

		if($UserInfoarr){
 			$user_i=$UserInfoarr->save()?1:array('code'=>'5','msg'=>'没有此用户数据或已被删除');
 			if($user_i){
 				$returns=$Usersarr->save()?[]:array('code'=>'5','msg'=>'没有此用户数据或已被删除');
 			}else{
 				$returns = array('code'=>'5','msg'=>'没有此用户数据或已被删除');
 			}
 		}else{
 			$returns=$Usersarr->save()?[]:array('code'=>'5','msg'=>'没有此用户数据或已被删除');
 		}
 		
 		return $this->result($returns);	
	}

	#用户提现列表
	public function enchaindex(Request $request)
	{
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');   
    	$pageSize	= $request->input('type');  //1申请提现  2、3提现失败或微信失败
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;

		$count = Userwithdrawal::count();//求总数	 
		$list  = Userwithdrawal::skip($skip)->take($take)->orderBy('id', 'desc')->get();
		foreach ($list as $key => $value) {
			$value['price'] = $value['price']/100;
			$value['ctime'] = date('Y-m-d H:i:s',$value['ctime']);
		}

		$returns = $list?array('list'=> $list,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
	    return $this->result($returns);	 
	}


	#用户提现批准
	 /**
     *  $openid    用户openid
     *  $user_name 真实姓名
     *  $amount    提现金额
     *  $desc      订单表述
     */
	public function enchashment(Request $request)
	{

		require_once app_path('Library/Wxpay/lib/WxPay.Api.php');
		require_once app_path('Library/Wxpay/lib/WxPay.Enchashment.php');
		$WxPayEnchashment = new \WxPayEnchashment();
		/*-------------------------企业付款引文--------------------------*/

		$token = $request->input('token');
		$order_sn = 'LB'.date('YmdHi').rand(1000,9999);
		$Users = Users::where('token',$token)->first();
		$Userwithdrawal = Userwithdrawal::where('token',$token)->where('status',1)->first();
		if(!$Userwithdrawal){
				return $this->result(array('code'=>'5','msg'=>'不存在的提现'));exit;
		}
		$Userwithdrawal->order_sn = $order_sn;
		$Userwithdrawal->ttime 	  = time();
		$Userwithdrawal->status   = 2;
		if($Userwithdrawal->save()){
				$openid   	=  	$Users['openid'];
		      	$user_name 	=	$Userwithdrawal['tname'];
		    	$amount    	=	$Userwithdrawal['price'];
		     	$desc      	=	'爱样提现';
		     	$wxOrder    =	$order_sn;
				$returnon = $WxPayEnchashment->Enchashment($openid,$user_name,$amount,$desc,$wxOrder);
				if($returnon['return_code']=='SUCCESS'){
		     		if($returnon['result_code']=='SUCCESS'){
	     				$Userwithdrawalr = Userwithdrawal::where('token',$token)->where('status',2)->first();
	     				$Userwithdrawalr->payment_no   = $returnon['payment_no'];
	     				$Userwithdrawalr->payment_time = strtotime($returnon['payment_time']);
	     				$Userwithdrawalr->status   = 3;//提现成功
	     				$returns = $Userwithdrawalr->save()?array('code'=>'5','msg'=>'操作成功'):array('code'=>'5','msg'=>'网络错误');
	     				return $this->result($returns);exit;	 
		     		}else{
	     				$Userwithdrawalr = Userwithdrawal::where('token',$token)->where('status',2)->first();
	     				$Userwithdrawalr->status   = 4;//提现失败
	     				$returns = $Userwithdrawalr->save()?array('code'=>'5','msg'=>'操作成功'):array('code'=>'5','msg'=>'网络错误');
	     				return $this->result($returns);exit; 
		     		}
				}else{
		     		$Userwithdrawalr = Userwithdrawal::where('token',$token)->where('status',2)->first();
     				$Userwithdrawalr->status   = 6;//微信交互失败
     				$returns = $Userwithdrawalr->save()?array('code'=>'5','msg'=>'操作成功'):array('code'=>'5','msg'=>'微信端错误');
     				return $this->result($returns);exit;
		     	}
		} else {
     		return $this->result(array('code'=>'5','msg'=>'提现操作失败'));exit;
		}

	
	}


	#后台管理登录
	public function adminuser(Request $request)
	{
		# code... md5(tao088188,16) = 479b5bd188fa44c9
		#字段不能为空
		if($this->verCode($request->all(),[
			'name'		=>'required',
			'password'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$input = $request->input();

		$name = Admin::where('name',$input['name'])->first();
		if($name){
			$password = Admin::where('name',$input['name'])->where('password',$input['password'])->first();	
			if($password){
				$Admin = $password;
			}else{
				$Admin = array('code'=>'5','msg'=>'密码错误');
			}
		}else{
			$Admin = array('code'=>'5','msg'=>'账号不存在');
		}

	
		return $this->result($Admin);	
	}	

	#每次收益
	public function UserEarningsAt(Request $request)
	{
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;
		if(empty($name)){
			$count = UserEarningsAt::count();//求总数	 
			$UserEarningsAt = UserEarningsAt::skip($skip)->take($take)->orderBy('id', 'desc')->get();
		}else{
			//搜索时 先验证是否有用户，再用wherein
			$user = UserInfo::where('user_name','like',"%".$name."%")->select('token')->get();
			if($user){
				$count = UserEarningsAt::whereIn('token',$user->toArray())->count();//求总数	 
				$UserEarningsAt = UserEarningsAt::skip($skip)->take($take)->whereIn('token',$user->toArray())->orderBy('id', 'desc')->get();
			}else{
				$UserEarningsAt=array();
			}
		}
		foreach ($UserEarningsAt as $key => $value) {
			$UserEarningsAt[$key]['user'] =UserInfo::where('token',$value['token'])->first();
			$value['price'] = $value['price']/100;
			$value['ctime'] = date('Y-m-d H:i:s',$value['ctime']);
		}
		if(!$UserEarningsAt){
			$return = array('code'=>'5','msg'=>'网络错误');
		}
		return $this->result(array('list'=>$UserEarningsAt,'sumpage'=> ceil($count/$take)));
	}

	#每天收益
	public function UserEarningsBay(Request $request)
	{
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5: $pageSize;
    	$skip     = ($page - 1) * $take;
		if(empty($name)){
			$count = UserEarningsBay::count();//求总数	 
			$UserEarningsBay = UserEarningsBay::skip($skip)->take($take)->orderBy('id', 'desc')->get();
		}else{
			//搜索时 先验证是否有用户，再用wherein
			$user = UserInfo::where('user_name','like',"%".$name."%")->select('token')->get();
			if($user){
				$count = UserEarningsBay::whereIn('token',$user->toArray())->count();//求总数	 
				$UserEarningsBay = UserEarningsBay::skip($skip)->take($take)->whereIn('token',$user->toArray())->orderBy('id', 'desc')->get();
			}else{
				$UserEarningsBay=array();
			}
		}
		foreach ($UserEarningsBay as $key => $value) {
			$UserEarningsBay[$key]['user'] =UserInfo::where('token',$value['token'])->first();
			$value['price'] = $value['price']/100;
			$value['ctime'] = date('Y-m-d',$value['ctime']);
		}
		if(!$UserEarningsBay){
			$return = array('code'=>'5','msg'=>'网络错误');
		}
		return $this->result(array('list'=>$UserEarningsBay,'sumpage'=> ceil($count/$take)));
	}

	#总收益
	public function UserEarningsThe(Request $request)
	{
			
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;
		
		if(empty($name)){
			$count = UserEarningsThe::count();//求总数	 
			$UserEarningsThe = UserEarningsThe::skip($skip)->take($take)->orderBy('id', 'desc')->get();
		}else{
			
			//搜索时 先验证是否有用户，再用wherein
			$user = UserInfo::where('user_name','like',"%".$name."%")->select('token')->get();
			if($user){
				$count = UserEarningsThe::whereIn('token',$user->toArray())->count();//求总数	 
				$UserEarningsThe = UserEarningsThe::skip($skip)->take($take)->whereIn('token',$user->toArray())->orderBy('id', 'desc')->get();
			}else{
				$UserEarningsThe=array();
			}
		}

		foreach ($UserEarningsThe as $key => $value) {
			$UserEarningsThe[$key]['user'] =UserInfo::where('token',$value['token'])->first();
			$value['price'] = $value['price']/100;
		}
		if(!$UserEarningsThe){
			$return = array('code'=>'5','msg'=>'网络错误');;
		}	
		return $this->result(array('list'=>$UserEarningsThe,'sumpage'=> ceil($count/$take)));
	}

	#意见反馈
	public function Thearticles(Request $request)
	{	
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 10 : $pageSize;
    	$skip     = ($page - 1) * $take;
		$Thearticle = UsersTickling::skip($skip)->take($take)->get();
		foreach ($Thearticle as $key => $value) {
			$Thearticle[$key]['user'] =UserInfo::where('token',$value['token'])->first();
		}
		if(!$Thearticle){
			$return = array('code'=>'5','msg'=>'网络错误');
		}
		return $this->result(array('list'=>$Thearticle));
	}

	public function indexx(Request $request)
	{
		# code...
	}

	#佣金比例管理
	public function UserCommissionList(Request $request) {
        #接参
        $name 		= $request->input('name');
        $type 		= $request->input('type');
        $page 		= $request->input('page');
        $pageSize	= $request->input('pageSize');
        $page     = empty($page)     ? 1 : $page;
        $take     = empty($pageSize) ? 5 : $pageSize;
        $skip     = ($page - 1) * $take;
        $where = [];
        if($name) {
            $userInfo = UserInfo::where('user_name', $name)->select('token')->first();
            if(!$userInfo) {
                return $this->result(array('list'=>[]));

            }
            $userInfo && $where['spokesman_token'] = $userInfo->token;
        }
        $type && $where['type'] = $type;

        if($where) {
            $userCommissionTmp = Commission::skip($skip)->take($take)->where($where)->get();
            $count = Users::where($where)->count();//求总数
        } else {
            $userCommissionTmp = Commission::skip($skip)->take($take)->get();
            $count = Users::count();//求总数
        }
        if($userCommissionTmp) {
            $sUserTokens = array_column($userCommissionTmp->toArray(), 'spokesman_token');
            $fUserTokens = array_column($userCommissionTmp->toArray(), 'from_token');
            $tokenTmp = array_unique(array_merge($sUserTokens, $fUserTokens));
            $userInfoTmp = array_column(UserInfo::whereIn('token', $tokenTmp)->get()->toArray(), null, 'token');
            foreach($userCommissionTmp as $userCommissionKey => $userCommission) {
                $userCommissions['user_name'] = $userInfoTmp[$userCommission->spokesman_token]['user_name'];
                $userCommissions['user_img'] = $userInfoTmp[$userCommission->spokesman_token]['user_img'];
                $userCommissions['from_user_name'] = $userInfoTmp[$userCommission->from_token]['user_name'];
                $userCommissions['type'] = $userCommission->type == 100 ? '服务订单' : '商品订单';
                $userCommissions['desc'] = $userCommission->source_name;
                $userCommissions['money'] = $userCommission->money;
                $userCommissions['create_time'] = date('Y-m-d H:i:s', $userCommission->ctime);
                $return[] = $userCommissions;
            }
        }
        if(!$return){
            $return = array('code'=>'5','msg'=>'网络错误');
        }

        return $this->result(array('list'=>$return, 'sumpage'=> ceil($count/$take)));

    }


}
