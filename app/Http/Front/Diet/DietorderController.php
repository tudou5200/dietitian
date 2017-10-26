<?php
namespace App\Http\Front\Diet;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Dietinfo;
use App\Models\Dietproduct;
use App\Models\Dietorderdetail;
use App\Models\Dietorder;
use App\Models\Dietcate;
use App\Models\Askconsult;
use App\Models\Askconslist;
use App\Models\UserInfo;
use App\Models\Users;
use App\Models\UserEarningsAt;
use App\Models\UserEarningsBay;
use App\Models\UserEarningsThe;
use App\Models\Userfollowdiet;

class DietorderController extends BaseController
{

	#营养师首页
	public function indexx(Request $request)
	{
		#接参
		$tag = $request->input('tag');
		// $Diet['tag']  = empty($tag)?:$tag;
		if(empty($tag)||$tag=='null'){
			$Diet['tag']=1;
		}else{
			$Diet['tag']=$tag;
		}
		$Diet['cate'] = Dietcate::where('parent',0)->get();
		$Diet['list'] = Dietinfo::where('status',1)->where('tag',$Diet['tag'])->where('subscribe',1)->orderby('id','desc')->select('token','dietitian','name','mobile','education','grade','job','major','star','service_person','service_order','tag','niche','askprice','mgpic','status')->get();
		if($Diet['list']){
				foreach($Diet['list'] as $kk=>$vv){
					$Diet['list'][$kk]['star']=$Diet['list'][$kk]['star']==0? 100:$Diet['list'][$kk]['star'];
					$Diet['list'][$kk]['askprice']=$vv['askprice']/100;
					$niche=explode(',',$Diet['list'][$kk]['niche']);
					$Diet['list'][$kk]['niche'] = Dietcate::whereIn('id',$niche)->get();
			 	}
			}	
		$Diet['list']=empty($Diet['list'])?'':$Diet['list'];		
		return $this->result($Diet);
	}

	#营养师列表
	public function dlists(Request $request)
	{
		$DietcateCate = Dietcate::where('parent',0)->get();		
		foreach($DietcateCate as $k=>$v){
			$DietinfoList= Dietinfo::where('status',1)->where('tag',$v['id'])->orderby('id','desc')->select('token','dietitian','name','mobile','education','grade','job','major','star','service_person','service_order','tag','niche','askprice','mgpic','status')->get();
			 if($DietinfoList){
				foreach($DietinfoList as $kk=>$vv){
					$DietinfoList[$kk]['star']=$DietinfoList[$kk]['star']==0? 100:$DietinfoList[$kk]['star'];
				$DietinfoList[$kk]['askprice']=$vv['askprice']/100;
				$niche=explode(',',$DietinfoList[$kk]['niche']);
				$DietinfoList[$kk]['niche'] = Dietcate::whereIn('id',$niche)->get();
			 	}
			}	
			$DietcateCate[$k]['list']=empty($DietinfoList)?'':$DietinfoList;
		}
		$returns=array('cate'=>$DietcateCate);
		return $this->result($returns);

	}

	#营养师服务评论
	public function dcomment(Request $request)
	{
		#################测试数据##################
		// $dietitian=1;
		// $order_sn=2017031818032970;
		// $pid=1;
		// $comment='非常好';
		// $star=50;
		#################测试数据##################

		#判断字段是否为空
		if($this->verCode($request->all(),[
			'dietitian'	=>'required',	
			'order_sn'	=>'required',
			'ptoken'	=>'required',
			'comment'	=>'required',
			'star'		=>'required',	
		])){
			return $this->publicparaResponse();
		}
		$dietitian=$request->input('dietitian');
		$order_sn=$request->input('order_sn');
		$ptoken=$request->input('ptoken');
		$comment=$request->input('comment');
		$star=$request->input('star');
		$Model= Dietorderdetail::where('dietitian',$dietitian)->where('order_sn',$order_sn)->where('ptoken',$ptoken)->first();
		if($Model['way']==1){
			$times=$Model->month*60*60*24*30*12;
		}elseif($Model['way']==2){
			$times=$Model->month*60*60*24*30;
		}elseif($Model['way']==3){
			$times=$Model->month*60*60*24;
		}
		if($Model->ctime+$times<time()){
			$dietinfo= Dietinfo::where('dietitian',$dietitian)->first();
			$name=UserInfo::where('token',$Model->token)->select('user_name')->first();
			$Model->name=$name['user_name'];
			$Model->comment=$comment;
			$Model->star=$star*20;
			$Model->ptime=time();
			$Model->type=2;//营养服务已评论
			#收益交易记录
			if($Model->save()){
				$meici = $this->meici($dietinfo['token'],$dietinfo['name'],$Model['price']);
				if($meici){
					$meitian = $this->meitian($dietinfo['token'],$Model['price']);
					if($meitian){
						$zongjiaoyi = $this->zongjiaoyi($dietinfo['token'],$Model['price']);
					}
				}
			}
			$dietinfo->star=intval(($dietinfo->star*$dietinfo->service_order+$star*20)/($dietinfo->service_order+1));
			$dietinfo->service_order=$dietinfo->service_order+1;
			$dietinfo->service_person=Dietorder::groupby('token')->where('dietitian',$dietitian)->where('status','!=',1)->count();
			$r=$dietinfo->save()?[]:array('code'=>'5','msg'=>'网络错误');

			return $this->result($r);
		}else{
			return $this->result(array('code'=>'5','msg'=>'网络错误'));
		}
	}

	

	#营养师详情
	public function detail(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'dietitian'	=>'required',			
		])){
			return $this->publicparaResponse();
		}

		$dietitian=$request->input('dietitian');//接收传过来的参数dietitian
		#营养师详情
		$DietinfoModel= Dietinfo::where('dietitian',$dietitian)->select('dietitian','name','mgpic','education','grade','job','star','service_person','service_order','niche','desc')->first();
		#营养师服务
		$DietproductModel= Dietproduct::where('dietitian',$dietitian)->get();
		foreach($DietproductModel as $v){
			$v['price']=$v['price']/100;
		}
	
		$DietinfoModel['star']=$DietinfoModel['star']==0? 100:$DietinfoModel['star'];
		
		#细分领域
		$DietArr = explode(',',$DietinfoModel['niche']);	
		$DietinfoModel['niche'] = Dietcate::whereIn('id',$DietArr)->select('id','name')->get();#营养师分类

		if(!$DietinfoModel){
			$Model = array('code'=>'5','msg'=>'网络错误');
		}
		
		$DietinfoModel['followflag'] = 1;//默认为不关注
		//验证是否已经关注过
		if($request->input('token')){
			$res = Userfollowdiet::where('token',$request->input('token'))->where('dietitian',$dietitian)->first();
			
			if(!empty($res)){
				$DietinfoModel['followflag'] =2;//已关注
			}
		}

		$Modelorder=Dietorderdetail::orderby('id','desc')->where('type',2)->where('dietitian',$dietitian)->select('comment','name','star','ptime')->get();
		
		foreach ($Modelorder as $k=>$v){
			$Modelorder[$k]['star']=$v['star'];
			$Modelorder[$k]['ptime']=date('Y-m-d H:i:s',$v['ptime']);
		}
		
		$Modelorder=$Modelorder? $Modelorder:'';
		$Model = array('info'=>$DietinfoModel,'product'=>$DietproductModel,'comment'=>$Modelorder);
		return $this->result($Model);
	}

	

	#营养师服务确认订单
	public function orderlist(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'list'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$total=0;
		$list=$request->input('list');
		$listarr=explode('_',$list);
		$product['list']= Dietproduct::whereIn('ptoken',$listarr)->get();
		foreach($product['list'] as $v){
			$v['price']=$v['price']/100;
			$total+=$v['price'];
		}

		$product['total']=$total;
		return $this->result($product);
	}

	#营养师服务下单
	public function adds(Request $request)
	{
		#################测试数据##################
		// $token  	='123';#测试
		// $dietitian 	='token123';#测试
		// $list = ptoken1_ptoken2_ptoken3;
		// $produit 	= array_column($produits,'ptoken');//测试
		#################测试数据##################

		#判断字段是否为空
		if($this->verCode($request->all(),[
			'list'	=>'required',
			'dietitian'	=>'required',
			'token'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token 	= $request->input('token');//正式
		$list=$request->input('list');
		$dietitian  =$request->input('dietitian');//正式
		$listarr=explode('_',$list);
		$product= Dietproduct::whereIn('ptoken',$listarr)->get();
		$order_sn=date('YmdHi').rand(1000,9999);

	#订单详情
		$zongji=0;	
		foreach($product as $v){
			$detail=new Dietorderdetail();
			$detail->order_sn   = $order_sn;
			$detail->ptoken     = $v['ptoken'];					
			$detail->ctime   	= time();					
			$detail->price 		= $v['price'];
			$detail->status 	= 1;
			$detail->star   	= 0;
			$detail->token   	= $token;
			$detail->dietitian  = $dietitian;
			$detail->type   	= 1;
			$detail->img   		= $v['img'];
			$detail->title   	= $v['title'];
			$detail->desc   	= $v['desc'];
			$detail->month   	= $v['month'];
			$detail->way   	    = $v['way'];
			$detail->area   	= $v['area'];
			$detail->save();
			$zongji+=$v['price'];
		}
		#总订单p
		$order=new Dietorder();
		$order->order_sn =$order_sn;
		$order->totalprice=$zongji;
		$order->dietitian = $dietitian;
		$order->token = $token;
		$order->status = 1;
		$order->ctime=time();
		$r=$order->save()?array('order_sn'=>$order_sn):array('code'=>'5','msg'=>'网络错误');
		return $this->result($r);	
	}

	#取消订单接口
	public function qu(Request $request)
	{
		if($this->verCode($request->all(),[
			'order_sn'	=>'required',			
		])){
			return $this->publicparaResponse();
		}	
		$order_sn = $request->input('order_sn');#正式
		$Orderdetail = Dietorderdetail::where('order_sn',$order_sn)->get();
		foreach ($Orderdetail as $k => $v) {
			$product=Dietproduct::where('ptoken',$v['ptoken'])->first();
			$product ->save();
			$v->delete();	
		}
		$OrderModel = Dietorder::where('order_sn',$order_sn)->first();
		$result=$OrderModel->delete()?[]:array('code'=>'5','msg'=>'网络错误');
		return $this->result($result);
	}

	#营养师服务订单列表(用户->我的营养师)
	public function PList(Request $request){
		if($this->verCode($request->all(),[
      		'token'=>'required',
    	])){
     		 return $this->publicparaResponse();
    	}
    	$token= $request->input('token');
    	$Model    = Dietorder::where("token",$token)->where('status',2)->select('status','totalprice','token','dietitian','ctime','order_sn')->get();
    	foreach($Model as $k=>$v){
    		$Model[$k]['totalprice']=$v['totalprice']/100;
    		#营养师详情s
			$DietinfoModel= Dietinfo::where('dietitian',$Model[$k]['dietitian'])->first();
			$DietinfoModel['askprice']=$DietinfoModel['askprice']/100;
			$niche=explode(',',$DietinfoModel['niche']);
			$DietinfoModel['niche'] = Dietcate::whereIn('id',$niche)->get();
    		$Model[$k]['dietitian']=$DietinfoModel;
    	}
    	return $this->result($Model);
	}
	#营养师服务订单列表(营养师->我的顾客)
	public function dPList(Request $request){
		if($this->verCode($request->all(),[
      		'token'=>'required',
    	])){
     		 return $this->publicparaResponse();
    	}
    	$token= $request->input('token');
    	$DietinfoModel= Dietinfo::where('token',$token)->first();
    	$Model    = Dietorder::where("dietitian",$DietinfoModel['dietitian'])->where('status',2)->select('status','totalprice','token','dietitian','ctime','order_sn')->get();
    	foreach($Model as $k=>$v){
    		$Model[$k]['totalprice']=$v['totalprice']/100;
    		$Model[$k]['ctime']=date('Y-m-d H:i:s',$v['ctime']);
    		#顾客详情
    		$uinfo=UserInfo::where('token',$v['token'])->first();
		
    		$Model[$k]['user']=$uinfo;
    	}
    	return $this->result($Model);
	}
	
	//营养师服务订单详情(个人中心用)
	public function PDetail(Request $request){
		if($this->verCode($request->all(),[
      		'order_sn'       =>'required',
    	])){
     		 return $this->publicparaResponse();
    	}
    	$order_sn= $request->input('order_sn');
    	$Model    = Dietorderdetail::where("order_sn",$order_sn)->get();
    	// $Dietinfo = Dietinfo::where('dietitian',$Model['dietitian'])->first();
    	foreach($Model as $k=>$v){
    		$Model[$k]['price']=$v['price']/100;
    		// $Model[$k]['totimeeee']=strtotime("-".$v['month']." months",time());
    		if($v['way']==1){
    			$time=strtotime("+".$v['month']." years",$v['ctime']);
    		}elseif($v['way']==2){
    			$time=strtotime("+".$v['month']." months",$v['ctime']);
    		}elseif($v['way']==3){
    			$time=strtotime("+".$v['month']." days",$v['ctime']);
    		}
    		$Model[$k]['totime']=date("Y-m-d H:i:s",$time);
    		if($time<time()&&$v['star']==0){//判断服务时间是否到期，到期才可以对该服务进行评论
    			$Model[$k]['orcomment']='1';
    		}
    		else{
    			$Model[$k]['orcomment']='2';
    		}	
    	}
    	#营养师详情
		$DietinfoModel= Dietinfo::where('dietitian',$Model[0]['dietitian'])->select('dietitian','name','mgpic','job','star','education','major','service_order','askprice','grade','niche')->first();
		$DietinfoModel['askprice']=$DietinfoModel['askprice']/100;
		$niche=explode(',',$DietinfoModel['niche']);
		$DietinfoModel['niche'] = Dietcate::whereIn('id',$niche)->get();
    	$result['order']=$Model;
    	$result['dietitian']=$DietinfoModel;
    	return $this->result($result);
	}
	//营养师服务订单详情(营养师个人中心用)
	public function dPDetail(Request $request){
		if($this->verCode($request->all(),[
      		'order_sn'       =>'required',
    	])){
     		 return $this->publicparaResponse();
    	}
    	$order_sn= $request->input('order_sn');
    	$Model    = Dietorderdetail::where("order_sn",$order_sn)->get();
    	foreach($Model as $k=>$v){
    		$Model[$k]['price']=$v['price']/100; 
    		if($v['way']==1){
    			$time=strtotime("+".$v['month']." years",$v['ctime']);
    		}elseif($v['way']==2){
    			$time=strtotime("+".$v['month']." months",$v['ctime']);
    		}elseif($v['way']==3){
    			$time=strtotime("+".$v['month']." days",$v['ctime']);
    		}
    		$Model[$k]['totime']=date("Y-m-d H:i:s",$time);
    	}
		$totalorder  = Dietorder::where("order_sn",$order_sn)->select('totalprice','token','dietitian','ctime','order_sn')->first();
    	$totalorder['totalprice']=$totalorder['totalprice']/100;
    	$totalorder['ctime']=date('Y-m-d H:i:s',$totalorder['ctime']);
    	#顾客详情
    	$result['user']=UserInfo::where('token',$Model[0]['token'])->first();
    	$result['orderdetail']=$Model;
    	$result['totalorder']=$totalorder;
    	return $this->result($result);
	}


	// 点击营养师入驻判断
	public function judge(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'      =>'required',
    	])){
     		 return $this->publicparaResponse();
    	}
		$has=Dietinfo::where('token',$request->input('token'))->first();
		if($has){
			$r=array('code'=>'1','msg'=>'正在审核');
		}else{
			$r=array('code'=>'2','msg'=>'可以入驻');
		}
		return $this->result($r);
	}

	// 营养师入驻展示的擅长领域和细分领域信息(个人中心用)
	public function enter(Request $request)
	{
		$tag=Dietcate::where('parent',0)->get();
		foreach($tag as $k=>$v){
			$niche=Dietcate::where('parent',$v['id'])->get();
			$tag[$k]['niche']=$niche;
		}
		return $this->result($tag);
	}
	// 营养师入驻(个人中心用)
	public function enterAdd(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'      =>'required',
      		'name'       =>'required',
      		'mobile'     =>'required',
      		'education'  =>'required',
      		'major'      =>'required',
      		'job'        =>'required',
      		'desc'       =>'required',
      		'tag'        =>'required',
      		'grade'      =>'required',
      		'niche'      =>'required',
      		// 'mgpic'      =>'required',
      		'zspic'      =>'required',
      		// 'zhengpic'   =>'required',
      		// 'fanpic'     =>'required',
      		'askprice'   =>'required',
    	])){
     		 return $this->publicparaResponse();
    	}
    	$input=$request->input();
    	if($input['zspic']=="img/le1.png"){
			$r=array('code'=>'5','msg'=>'请按要求上传图片');
			return $this->result($r);	
		}

		$result=Dietinfo::where('token',$input['token'])->first();
		$UserInfo=UserInfo::where('token',$input['token'])->first();
		
		if(!$result){
			$info=new Dietinfo();
			$info->dietitian=sha1(time().rand(0,9999).'dietitian');
			$info->token    =$input['token'];
			$info->name     =$input['name'];
			$info->grade    =$input['grade'];
			$info->mobile   =$input['mobile'];
			$info->education=$input['education'];
			$info->major    =$input['major'];
			$info->job      =$input['job'];
			$info->desc     =$input['desc'];
			$info->tag      =$input['tag'];
			$info->niche    =$input['niche'];
			$info->ctime    =time();
			$info->askprice =$input['askprice']*100;
			// $info->mgpic    =$UserInfo->user_img;
			$info->mgpic    ="http://api.shoumeikeji.cn/aiyang.jpg";
			$info->zspic    =$input['zspic'];
			// $info->zhengpic =$input['zhengpic'];
			// $info->fanpic   =$input['fanpic'];
			$info->status  	=0;#0--正在审核
			$r=$info->save()?[]:array('code'=>'5','msg'=>'网络错误');
		}else{
			$r=array('code'=>'5','msg'=>'您的信息正在审核，请勿重复提交');
		}
		return $this->result($r);	
	}

	#每次交易
	public function meici($token,$user_name,$price)
	{
		/*每次交易*/
		$UserEarningsAt = New UserEarningsAt();
		$UserEarningsAt->type = 1;
		$UserEarningsAt->operation = 1;
		$UserEarningsAt->price 	= $price;
		$UserEarningsAt->name 	= $user_name;
		$UserEarningsAt->token 	= $token;
		$UserEarningsAt->ctime 	= time();
		return $UserEarningsAt->save();
	}

	#每天交易
	public function meitian($token,$price)
	{
		/*每天收益*/
		$UserEarningsBay = UserEarningsBay::where('token',$token)
						   ->orderby('id','desc')->first();
		if(!empty($UserEarningsBay)){	
			#递增每次交易到每天		
			$EarningsBay = date('Y-m-d',$UserEarningsBay['ctime']);
			$time = date('Y-m-d');			
			if(  $EarningsBay==$time  ){
				    $UserEarningsBay->token = $UserEarningsBay['token'];
					$UserEarningsBay->price = $UserEarningsBay['price'] + 
											  $price;
					$UserEarningsBay->ctime = time();
					return $UserEarningsBay->save();
			}	else   {#超过时间重新创建当天交易				
				$UserEarningsBays = New UserEarningsBay();
				$UserEarningsBays->token = $token;
				$UserEarningsBays->price = $price;
				$UserEarningsBays->ctime = time();
				return $UserEarningsBays->save();
			}
		}	else   {#重新创建每天交易
			
			$UserEarningsBays = New UserEarningsBay();
			$UserEarningsBays->token = $token;
			$UserEarningsBays->price = $price;
			$UserEarningsBays->ctime = time();
			return $UserEarningsBays->save();
		}
	}

	#总交易
	public function zongjiaoyi($token,$price)
	{
		#总收益
		$UserEarningsThe = UserEarningsThe::where('token',$token)->first();
		#第一次创建总收益以  如果有则递增总收益
		if(!empty($UserEarningsThe)){
			$UserEarningsThe->token = $token;
			$UserEarningsThe->price = $UserEarningsThe['price']  + $price;
			return $UserEarningsThe->save();
		}else{
			$UserEarningsThes = New  UserEarningsThe();
			$UserEarningsThes->token = $token;
			$UserEarningsThes->price = $price;
			return $UserEarningsThes->save();
		}
	}

	//添加关注营养师
	public function addfollowdiet(Request $request){
		if($this->verCode($request->all(),[
			'token'=>'required',
			'dietitian'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}

		$res = Userfollowdiet::where('token',$request->input('token'))->where('dietitian',$request->input('dietitian'))->first();
		
		//首先验证添加关注的用户是否是营养师
		$dietinfomodel= Dietinfo::where('token',$request->input('token'))->first();
		if(!empty($dietinfomodel)){
			$list = $dietinfomodel->toArray();
			if($list['status']==1){
				return $this->result(array('code'=>'8','msg'=>'营养师不可以点击关注'));
			}
		}
		
		//var_dump($res);die;
		if(!empty($res)){//当已经关注过后
			$returns = array('code'=>'7','msg'=>'你已经关注，请勿重复操作');
		}else{
			
			$userfollowdiet = new Userfollowdiet();
			$userfollowdiet->token = $request->input('token');
			$userfollowdiet->dietitian = $request->input('dietitian');
			$userfollowdiet->ctime = time();
			
			$returns = $userfollowdiet->save()?[]:array('code'=>'5','msg'=>'网络错误');
		}
		
		return $this->result($returns);
	}
	
	//取消关注营养师
	public function delfollowdiet(Request $request){
		if($this->verCode($request->all(),[
			'token'=>'required',
			'dietitian'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
		
		$Userfollowdiet = Userfollowdiet::where('token',$request->input('token'))->where('dietitian',$request->input('dietitian'))->first();
		
		if(!empty($Userfollowdiet)){//判断关注的营养师是否已经删除
			$returns =$Userfollowdiet->delete()?[]:array('code'=>'5','msg'=>'网络错误');
		}else{
			$returns= array('code'=>'7','msg'=>'已关注的营养师已经取消，请勿重复取消');
		}
		return $this->result($returns);	
	}
	
	
	//我的关注营养师列表
	public function myfollowdeitlist(Request $request){
		if($this->verCode($request->all(),[
      		'token'=>'required',
    	])){
     		 return $this->publicparaResponse();
    	}
		
		//先获取营养师标识
		$Userfollowdiet = Userfollowdiet::where('token',$request->input('token'))->select('dietitian')->orderby('id', 'desc')->get();

		$model = array();
		$list = $Userfollowdiet->toArray();
		//var_dump($list);die;
		if($list){
			foreach($list as $k =>$v ){
				$model[$k]  = Dietinfo::where('dietitian',$v['dietitian'])->first();
			}
			//var_dump($model);die;
			foreach ($model as $k => $v) {
				$model[$k]['totalprice']=$v['totalprice']/100;
				#营养师详情
				$DietinfoModel= Dietinfo::where('dietitian',$model[$k]['dietitian'])->first();
				$DietinfoModel['askprice']=$DietinfoModel['askprice']/100;
				$niche=explode(',',$DietinfoModel['niche']);
				$DietinfoModel['niche'] = Dietcate::whereIn('id',$niche)->get();
				$model[$k]['dietitian']=$DietinfoModel;
			}
		}
		return $this->result($model);
	}

}