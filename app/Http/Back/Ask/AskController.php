<?php
namespace App\Http\Back\Ask;
use App\Http\BaseController;
use Illuminate\Http\Request;
use Validator;
use App\Models\AskList;
use App\Models\Users;
use App\Models\UserInfo;
use App\Models\Dietinfo;
use App\Models\Ticklist;
use App\Helpers\actionjssdk;//微信jsdk
use App\Helpers\Curl;
class AskController extends BaseController
{

	function __construct() 
	{
    	$this->curl = new Curl();
  	}
	
	#分答列表
	public function list(Request $request)
	{
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;
		
		if(empty($name)){
			$count 	= AskList::where('status',2)->count();//求总数	
			$list 	= AskList::skip($skip)->take($take)->where('status',2)->get();
		}else{
			$count 	= AskList::where('token_name','like',"%".$name."%")->where('status',2)->count();//求总数	
			$list 	= AskList::skip($skip)->take($take)->where('status',2)->where('token_name','like',"%".$name."%")->get();
		}
    	
    	 //无数据
	    if ($list->toArray() == null) {
	    	return $this->result(array('code'=>'5','msg'=>'网络错误'));	  
	    }
		
		foreach ($list as $key => $value) {
			$value['ctime'] = date('Y-m-d H:i:s',$value['ctime']);
		}
	    $Model['list']=$list;
    	$Model['sumpage']=ceil($count/$take);
    	// $Model['count']=$count;
	    return $this->result($Model);	
	}


	#分答删除
	public function del(Request $request)
	{
		if($this->verCode($request->all(),[
      		'asktoken'   =>'required',
	    ])){
	      return $this->publicparaResponse();
	    }
		$asktoken = $request->input('asktoken');
		$AskList = AskList::where('asktoken',$asktoken)->first();
		$Model = $AskList->delete()?[]:array('code'=>'5','msg'=>'网络错误');
		return $this->result($Model);

	}

	#分答删除
	public function edits(Request $request)
	{
		if($this->verCode($request->all(),[
      		'asktoken'   =>'required',
	    ])){
	      return $this->publicparaResponse();
	    }
		$asktoken = $request->input('asktoken');
		$AskList  = AskList::where('asktoken',$asktoken)->first();
		if(!$AskList){
			$AskList = array('code'=>'5','msg'=>'网络错误');
		}
		return $this->result($AskList);

	}
	

	#重置提问
	public function Resets(Request $request)
	{
		if($this->verCode($request->all(),[
      		'asktoken'   =>'required',
	    ])){
	      return $this->publicparaResponse();
	    }
	    $asktoken = $request->input('asktoken');
		$AskList = AskList::where('asktoken',$asktoken)->where('state',2)->first();
		$AskList->state = 3;
		$AskList->type = 2;

		#获取公招token
  		$jssdk   = new actionjssdk();
  		$astoken = $jssdk->getToken();

  		#用户
  		$Usersmodel    = Users::where('token',$AskList['token'])->first();
  		$UserInfomodel = UserInfo::where('token',$AskList['token'])->first();
        $openidmodel   = $Usersmodel['openid'];
        #营养师
        $Dietinfo  = Dietinfo::where('dietitian',$AskList['dietitian'])->first();
        $dietuser  = Users::where('token',$Dietinfo['token'])->first();
        $openidDiet= $dietuser['openid'];

	    if($AskList->save()){


	        $url="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
	        $contentDiet = "尊敬的【".$Dietinfo['name']."】营养师：您好！\n您于今天在爱样针对【".$UserInfomodel['user_name']."】用户的问题进行了解答，\n\n由于您回复过程中爱样服务器处于更新中，您的录音未能完整的传达给用户，对此造成的困扰我们表示万分的歉意！\n\n请您尽快【点击链接】对该用户的问题重新回答。爱样会尽快迭代产品，避免此类问题对您的困扰！感谢您对爱样的支持与谅解！<a href='http://wx.shoumeikeji.cn/user/zaskdetails.html?asktoken=".$AskList['asktoken']."#'>【点此重答问题】</a>";
	        $data=' {
					    "touser":"'.$openidDiet.'",
					    "msgtype":"text",
					    "text":{"content":"'.$contentDiet.'" }
					}';
		    $jsonu=$this->curl->post($url,$data);
		    $jsonarr=json_decode($jsonu,true);
		    $return=$jsonarr['errcode']==0?'<div class="cfD"><a style="font-size: 50px;" href="http://aiyang.shoumeikeji.cn/ask/ask_index.html">重置成功-返回首页</a></div>'
		    :'<div class="cfD"><a style="font-size: 50px;" href="http://aiyang.shoumeikeji.cn/ask/ask_resets.html">重置失败-返回添加1</a></div>';
		    echo $return;
		}else{
			echo '<div class="cfD"><a style="font-size: 50px;" href="http://aiyang.shoumeikeji.cn/ask/ask_resets.html">重置失败-返回添加2</a></div>';
		}
	    
	}






	#意见反馈列表
	public function ticklist(Request $request)
	{
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;
		
		$count 	= Ticklist::count();//求总数	
		$list 	= Ticklist::orderby('id','desc')->skip($skip)->take($take)->get();
		if(empty($name)){
			$count 	= Ticklist::count();//求总数	
			$list 	= Ticklist::orderby('id','desc')->skip($skip)->take($take)->get();
		}else{
			$count 	= Ticklist::where('desc','like',"%".$name."%")->count();//求总数	
			$list 	= Ticklist::orderby('id','desc')->skip($skip)->take($take)->where('desc','like',"%".$name."%")->get();
		}
    	
		
		
		
    	 //无数据
	    if ($list->toArray() == null) {
	    	return $this->result(array('code'=>'5','msg'=>'网络错误'));	  
	    }
		
		foreach($list as $k=>$v){
			if($v['ctime']){
				$list[$k]['ctime'] =  empty($v['ctime'])? '' : date("Y-m-d H:i:s",$v['ctime']);
			}
			$userinfo = UserInfo::where('token',$v['token'])->select('user_name','user_img')->first();
			if($userinfo){
				$list[$k]['user_name'] = $userinfo['user_name'];
				$list[$k]['user_img'] = $userinfo['user_img'];
			}else{
				$list[$k]['user_name'] ='';
				$list[$k]['user_img'] ='';
			}
		}
	    $Model['list']=$list;
    	$Model['sumpage']=ceil($count/$take);
    	// $Model['count']=$count;
	    return $this->result($Model);	
	}

#底部	
}	