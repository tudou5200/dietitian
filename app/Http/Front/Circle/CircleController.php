<?php
namespace App\Http\Front\Circle;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Quanarticle;
use App\Models\Quancommend;
use App\Models\Quanpic;
use App\Models\Quanlook;
use App\Models\Users;
use App\Models\UserInfo;
use App\Models\Dietinfo;


class CircleController extends BaseController
{

	#营养师说
	public function dietshuos(Request $request)
	{
	
		#判断字段是否为空
		if($this->verCode($request->all(),[
			//'qtoken'	=>'required',	
			'dietitian'=>'required',	
		])){
			return $this->publicparaResponse();
		}

		$dietitian = $request->input('dietitian');
		$DietinfoModel = Dietinfo::where('dietitian',$dietitian)->first();
		if(!$DietinfoModel){
			$Returns = array('code'=>'5','msg'=>'网络错误');
		}
		$Returns = Quanarticle::where('token',$DietinfoModel['token'])->get();
		foreach ($Returns  as $key => $value) {
			$Returns[$key]['ctime']   = $this->format_date($value['ctime']);
			$Returns[$key]['user_name']  = $value['user_name'].'营养师';
			$Returns[$key]['list'] = Quanpic::where('qtoken',$value['qtoken'])->get();
			}

		return $this->result($Returns);
	}

	#我的圈子
	public function cusers(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			//'qtoken'	=>'required',	
			'token'	=>'required',	
		])){
			return $this->publicparaResponse();
		}

		#接参
		$token  =$request->input('token');	
		$UsersArr = Users::where('token',$token)->first();
		if($UsersArr){
			#查看自己的圈
			$QuanarUser = Quanarticle::where('token',$token)->orderby('id','desc')->get();
			foreach ($QuanarUser  as $key => $value) {		
				$QuanarUser[$key]['ctime']   = $this->format_date($value['ctime']);		
				$QuanarUser[$key]['list'] = Quanpic::where('qtoken',$value['qtoken'])->get();
			}
		}else{	
			$QuanarUser = array('code'=>'5','msg'=>'网络错误');
		}
		
		return $this->result($QuanarUser);
	}
	//计算某个时间据现在的时间
	public function format_date($time){  
	    $t=time()-$time;  
	    $f=array(  
	        '31536000'=>'年',  
	        '2592000'=>'个月',  
	        '604800'=>'星期',  
	        '86400'=>'天',  
	        '3600'=>'小时',  
	        '60'=>'分钟',  
	        '1'=>'秒'  
	    );  
	    foreach ($f as $k=>$v)    {  
	        if (0 !=$c=floor($t/(int)$k)) {  
	            return $c.$v.'前';  
	        }  
	    }  
	}

	#圈子 图片
	public function imglist(Request $request)
	{
		#接参
		$qtoken  =$request->input('qtoken');		
		$QuanpicArr = Quanpic::where('qtoken',$qtoken)->select('id','pic')->get();
		
		return $this->result($QuanpicArr);
	}

	#圈子  列表
	public function lists(Request $request)
	{
		
		#接参
		$token  =$request->input('token');		
		$UsersArr = Users::where('token',$token)->first();
		
		$QuanarArr = Quanarticle::orderby('id','desc')->get();
		$QuanpicArr = Quanpic::all();
		foreach ($QuanarArr  as $key => $value) {
			$QuanarArr[$key]['ctime']   = $this->format_date($value['ctime']);
			if($value['type']==2){
				$DietinfoArr = Dietinfo::where('token',$value['token'])->first();
				$QuanarArr[$key]['user_img'] = $DietinfoArr['mgpic'];
				$QuanarArr[$key]['user_name']  = $DietinfoArr['name'].'	 营养师';
			}
			
			

			if($value['type']==1){
				$UserInfo  = UserInfo::where('token',$value['token'])->first();				
				$QuanarArr[$key]['user_img'] = $UserInfo['user_img'];
				$QuanarArr[$key]['user_name'] = $UserInfo['user_name'];
			}


			$QuanarArr[$key]['list'] 	= Quanpic::where('qtoken',$value['qtoken'])->get();

		}
		
		return $this->result($QuanarArr);
	}


	#圈子  添加
	public function adds(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[			
			'token'		=>'required',		
		])){
			return $this->publicparaResponse();
		}

		$qtoken =sha1(time().rand(0,9999).'quanzi');//圈子标识
		#接参
		$token  	 =	$request->input('token');					
		$detail  	 =	$request->input('detail');
		$pic  	 	 =	$request->input('pic');

		$UsersArr 	 =	Users::where('token',$token)->first();
		$Dietinfo 	 =  Dietinfo::where('token',$token)->first();
		if(!$Dietinfo){
			$UserinfoArr = 	Userinfo::where('token',$token)->first();
			$user_name 	 =  $UserinfoArr['user_name'];
			$user_img 	 =  $UserinfoArr['user_img'];
		}else{
			$user_name 	 =  $Dietinfo['name'];
			$user_img 	 =  $Dietinfo['mgpic'];
		}

		

		$picList = explode('_',$pic);
		
		foreach ($picList as $key => $value) {
			$QuanpicModel = new Quanpic();
			$QuanpicModel['qtoken'] = 'Q'.$qtoken;
			$QuanpicModel['pic'] 	= $value;
			$returns=$QuanpicModel->save()?[]:array('code'=>'5','msg'=>'网络错误');
		}

		$QuanarModel = 	new Quanarticle();
		if($UsersArr['type']==3){
			$QuanarModel->type = 2;#营养师发布
		}else{
			$QuanarModel->type = 1;#用户发布
		}
		$QuanarModel->user_name = 	$user_name;
		$QuanarModel->token 	= 	$UsersArr->token;
		$QuanarModel->qtoken 	= 	'Q'.$qtoken;
		$QuanarModel->detail 	= 	$detail;
		
		$QuanarModel->user_img	= 	$user_img;
		$QuanarModel->ctime		= 	time();

		$returns=$QuanarModel->save()?[]:array('code'=>'5','msg'=>'网络错误');
		return $this->result($returns);	
	}

	#圈子  详情
	public function edits(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[			
			'qtoken' => 'required',								
		])){
			return $this->publicparaResponse();
		}

		#接参
		$qtoken  	=	$request->input('qtoken');
		$QuanarArr =   Quanarticle::where('qtoken',$qtoken)->first();
		$QuanarArr['ctime']   = $this->format_date($QuanarArr['ctime']);#时间转换
		$QuanarArr['list'] = Quanpic::where('qtoken',$QuanarArr['qtoken'])->get();
		$commentlist=Quancommend::where('qtoken',$QuanarArr['qtoken'])->get();
		foreach($commentlist as $k=>$v){
			$commentlist[$k]['ctime']=date('Y-m-d H:i:s',$v['ctime']);
		}
		$QuanarArr['commentlist'] = $commentlist;
		if(!$QuanarArr){
			$QuanarArr = array('code'=>'5','msg'=>'网络错误');
		}

		return $this->result($QuanarArr);	
	}



	#圈子点赞
	public function likes(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[	
			'qtoken' => 'required',								
			'token'  => 'required',								
		])){
			return $this->publicparaResponse();
		}
		$qtoken = $request->input('qtoken');
		$token  = $request->input('token');		
		$QuanlookArr = Quanlook::where('qtoken',$qtoken)->where('token',$token)->first();
		if(!$QuanlookArr){
			$QuanlookNew = New Quanlook();
			$QuanlookNew->qtoken = $qtoken;
			$QuanlookNew->token  = $token;
			$QuanlookNew->look  = 1;
			if(	$QuanlookNew->save() ){
				$QuanarArr 	=   Quanarticle::where('qtoken',$qtoken)->first();
				$QuanarArr->look = $QuanarArr->look + 1;
				$returns	=	$QuanarArr->save()?array('dianzan'=>1):array('code'=>'5','msg'=>'网络错误');	
			}
		}else{
			if( $QuanlookArr->delete() ){
				$QuanarArr 	=   Quanarticle::where('qtoken',$qtoken)->first();
				$QuanarArr->look = $QuanarArr->look - 1;
				$returns	=	$QuanarArr->save()?array('dianzan'=>2):array('code'=>'5','msg'=>'网络错误');	
			}
		}
		return $this->result($returns);	
	}

	#圈子 评论
	public function commts(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[			
			'qtoken' => 'required',			
			'token' => 'required',			
			'commend' => 'required',			
		])){
			return $this->publicparaResponse();
		}


		#接参
		$token     =	 $request->input('token');		
		$qtoken    =	 $request->input('qtoken');		
		$commend   =	 $request->input('commend');		
		$QuanarArr 	=   Quanarticle::where('qtoken',$qtoken)->first();
		if(!$QuanarArr){
			$returns = array('code'=>'5','msg'=>'网络错误');
		}


		$UsersArr 	 =	Users::where('token',$token)->first();
		$UserinfoArr = 	Userinfo::where('token',$token)->first();

		$QuancommArr = new Quancommend();

		foreach ($UsersArr as $key => $value) {
			if($value['type']==3){

			}
		}
		$QuancommArr->token 	= $UsersArr['token'];
		$QuancommArr->qtoken 	= $qtoken;
		$QuancommArr->commend 	= $commend;
		$QuancommArr->user_img 	= $UserinfoArr['user_img'];
		$QuancommArr->user_name = $UserinfoArr['user_name'];
		$QuancommArr->ctime 	= time();
		$QuancommNew  =   $QuancommArr->save()?1:2;		
		if($QuancommNew==1){
			$QuanarFind   =   Quanarticle::where('qtoken',$qtoken)->first();
			$QuanarFind->commend = $QuanarFind->commend+1;
			$returns=$QuanarFind->save()?[]:array('code'=>'5','msg'=>'网络错误');
		}else{
			$returns=array('code'=>'5','msg'=>'网络错误');
		}

		return $this->result($returns);	
	}
}