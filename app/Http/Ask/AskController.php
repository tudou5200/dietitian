<?php
/**
  *@author 
  *@version 1.0
  *@brief 分答
**/
namespace App\Http\Ask;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\AskList;
use App\Models\Askorder;
use App\Models\Askadditional;
use App\Models\Users;
use App\Models\UserInfo;
use App\Models\Dietinfo;
use App\Models\Dietcate;
use App\Models\Dietorder;
use App\Helpers\actionjssdk;//微信jsdk
use App\Helpers\Curl;
use App\Models\UserEarningsAt;
use App\Models\UserEarningsBay;
use App\Models\UserEarningsThe;
use App\Models\Askconsult;
use App\Models\Askconslist;
use App\Helpers\PublishBatchSMSMessage;

// use Qiniu\Auths;
// use Qiniu\Storage\UploadManager;
// use App\Helpers\Wx;
use App\Http\Wx;
class AskController extends BaseController
{
   	function __construct() 
	{
    	$this->curl = new Curl();
  	}


  	// #微信模板消息
  	// public function Mbxx($dietname,$token,$asktoken){
   
   //      $model=Users::where('token',$token)->first();
   //      $openid=$model->openid;
   //      $jssdk = new actionjssdk();
   //      $astoken = $jssdk->getToken();
   //          // $utoken=$request->input('token');#用户标识#
   //      $url="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$astoken;
   //      $data=' {
   //          "touser":"'.$openid.'",
   //          "template_id":"DlcqzSJk9AI5v8mXsCLZ2rAcxonQqltTokDUJEFt8w0",
   //          "url":"http://wx.shoumeikeji.cn/diet/index.html",
   //          "data":{
   //                 "first": {
   //                     "value":"您的专属营养师：",
   //                     "color":"#173177"
   //                 },
   //                 "keyword1":{
   //                     "value":"'.$dietname.'营养师",
   //                     "color":"#173177"
   //                 },
   //                 "keyword2": {
   //                     "value":"'.date('Y-m-d H:i:s',time()).'",
   //                     "color":"#173177"
   //                 },
   //                 "remark":{
   //                     "value":"正在为您服务,请到 我的->我的提问 查看",
   //                     "color":"#173177"
   //                 }
   //         }
   //     }';
   //     // ovxXWv5Ldfh1B4nho4C-Jz6Kgma0
   //     // "touser":"ovxXWv0E3d57KcmAN_MIEbzMU78w",
   //     $json=$this->curl->post($url,$data);
   //     $jsonarr=json_decode($json,true);
   //     return $jsonarr['errcode'];
   //      // return $json;
   //  }

  	#单个用户推送
  	public function userTS(Request $request)
  	{
  		$asktoken = $request->input('asktoken');
  		$AskList  = AskList::where('asktoken',$asktoken)->where('type',2)->first();
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

       
        $url="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
        $contentDiet = "尊敬的【".$Dietinfo['name']."】营养师：您好！\n您于今天在爱样针对【".$UserInfomodel['user_name']."】用户的问题进行了解答，\n\n由于您回复过程中爱样服务器处于更新中，您的录音未能完整的传达给用户，对此造成的困扰我们表示万分的歉意！\n\n请您尽快【点击链接】对该用户的问题重新回答。爱样会尽快迭代产品，避免此类问题对您的困扰！感谢您对爱样的支持与谅解！<a href='http://wx.shoumeikeji.cn/user/zaskdetails.html?asktoken=".$AskList['asktoken']."#'>【点此重答问题】</a>";
        $data=' {
		    "touser":"'.$openidDiet.'",
		    "msgtype":"text",
		    "text":
		    {
		         "content":"'.$contentDiet.'"
		    }
		}';
	    $jsonu=$this->curl->post($url,$data);
	    $jsonarr=json_decode($jsonu,true);
	    if($jsonarr['errcode']!=0){
	    	$returns = array('code'=>'5','msg'=>'网络错误');
	    }else{
	    	$returns = [];
	    }
	    return $this->result($returns);
  	}


  	#微信追问追答a链接消息推送给用户（重新回答）
  	public function Resets($dietname,$token,$asktoken){
   
        $model=Users::where('token',$token)->first();
        $UserInfomodel = UserInfo::where('token',$model['token'])->first();
        $openid=$model->openid;
        $jssdk = new actionjssdk();
        $astoken = $jssdk->getToken();
        

        $content = "尊敬的【".$UserInfomodel['user_name']."】用户：您好！您在爱样针对【".$dietname."】营养师进行了问题，系统检测到该营养师对您的回复内容不够完善,故以通知该营养师对您的问题重新进行解答<a href='http://wx.shoumeikeji.cn/user/zanswer.html?asktoken=".$asktoken."#'>【点击链接】</a>查看，感谢您对爱样的支持!<a href='http://wx.shoumeikeji.cn/user/zanswer.html?asktoken=".$asktoken."#'>【点击查看】</a>";
        $url="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
		$data=' {
		    "touser":"'.$openid.'",
		    "msgtype":"text",
		    "text":
		    {
		         "content":"'.$content.'"
		    }
		}';
		$json=$this->curl->post($url,$data);
       $jsonarr=json_decode($json,true);
       return $jsonarr['errcode'];
        // return $json;
    }



 	#微信追问追答a链接消息推送给用户
  	public function UMbxx($dietname,$token,$asktoken){
   
        $model=Users::where('token',$token)->first();
        $openid=$model->openid;
        $jssdk = new actionjssdk();
        $astoken = $jssdk->getToken();
        $content = "".$dietname."营养师回复了你的问题\n<a href='http://wx.shoumeikeji.cn/user/zanswer.html?asktoken=$asktoken&token=$token'>点此查看详情</a>";
        $url="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
		$data=' {
		    "touser":"'.$openid.'",
		    "msgtype":"text",
		    "text":
		    {
		         "content":"'.$content.'"
		    }
		}';
		$json=$this->curl->post($url,$data);
       $jsonarr=json_decode($json,true);
       return $jsonarr['errcode'];
        // return $json;
    }
    #微信追问追答a链接消息推送给营养师
  	public function Mbxx($uname,$dietitian,$asktoken){
   		$Dietinfo  = Dietinfo::where('dietitian',$dietitian)->first();
   		$token=$Dietinfo['token'];
        $model=Users::where('token',$token)->first();
        $openid=$model->openid;
        $jssdk = new actionjssdk();
        $astoken = $jssdk->getToken();
        $content = "".$uname."正在追问你问题\n<a href='http://wx.shoumeikeji.cn/user/zanswer.html?asktoken=$asktoken&token=$token'>点此查看详情</a>";
        $url="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
		$data=' {
		    "touser":"'.$openid.'",
		    "msgtype":"text",
		    "text":
		    {
		         "content":"'.$content.'"
		    }
		}';
		$json=$this->curl->post($url,$data);
       $jsonarr=json_decode($json,true);
       return $jsonarr['errcode'];
        // return $json;
    }
    #微信服务聊天a链接消息推送给用户
  	public function UMbxxs($dietname,$token,$order_sn){
   
        $model=Users::where('token',$token)->first();
        $openid=$model->openid;
        $jssdk = new actionjssdk();
        $astoken = $jssdk->getToken();
        $content = "".$dietname."营养师回复了您\n<a href='http://wx.shoumeikeji.cn/user/zanswer2.html?order_sn=$order_sn&token=$token'>点此查看详情</a>";
        $url="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
		$data=' {
		    "touser":"'.$openid.'",
		    "msgtype":"text",
		    "text":
		    {
		        "content":"'.$content.'"
		    }
		}';
		$json=$this->curl->post($url,$data);
       $jsonarr=json_decode($json,true);
       return $jsonarr['errcode'];
        // return $json;
    }
    #微信服务聊天a链接消息推送给营养师
  	public function Mbxxs($uname,$token,$order_sn){
   
        $model=Users::where('token',$token)->first();
        $openid=$model->openid;
        $jssdk = new actionjssdk();
        $astoken = $jssdk->getToken();
        $content = "".$uname."回复了您，\n<a href='http://wx.shoumeikeji.cn/user/zanswer2.html?order_sn=$order_sn&token=$token'>点此查看详情</a>";
        $url="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
		$data=' {
		    "touser":"'.$openid.'",
		    "msgtype":"text",
		    "text":
		    {
		         "content":"'.$content.'"
		    }
		}';
		$json=$this->curl->post($url,$data);
       $jsonarr=json_decode($json,true);
       return $jsonarr['errcode'];
        // return $json;
    }

    #微信服务聊天a链接消息推送给用户  （我的咨询用）
  	public function UMbxxsa($dietname,$token,$order_sn){
   
        $model=Users::where('token',$token)->first();
        $openid=$model->openid;
        $jssdk = new actionjssdk();
        $astoken = $jssdk->getToken();
        $content = "".$dietname."营养师回复了您\n<a href='http://wx.shoumeikeji.cn/user/zgudetail.html?atoken=$order_sn&token=$token'>点此查看详情</a>";
        $url="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
		$data=' {
		    "touser":"'.$openid.'",
		    "msgtype":"text",
		    "text":
		    {
		         "content":"'.$content.'"
		    }
		}';
		$json=$this->curl->post($url,$data);
       $jsonarr=json_decode($json,true);
       return $jsonarr['errcode'];
        // return $json;
    }
    #微信服务聊天a链接消息推送给营养师   （我的咨询用）
  	public function Mbxxsa($uname,$token,$order_sn){
   
        $model=Users::where('token',$token)->first();
        $openid=$model->openid;
        $jssdk = new actionjssdk();
        $astoken = $jssdk->getToken();
        $content = "".$uname."回复了您，\n<a href='http://wx.shoumeikeji.cn/user/zgudetail.html?atoken=$order_sn&token=$token'>点此查看详情</a>";
        $url="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
		$data=' {
		    "touser":"'.$openid.'",
		    "msgtype":"text",
		    "text":
		    {
		         "content":"'.$content.'"
		    }
		}';
		$json=$this->curl->post($url,$data);
       $jsonarr=json_decode($json,true);
       return $jsonarr['errcode'];
        // return $json;
    }

    #判断问题是否被抢答
    public function voicejudge(Request $request)
    {
    	#判断字段是否为空
		if($this->verCode($request->all(),[
			'asktoken'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$asktoken=$request->input('asktoken');#那个问的语音
		$AskList = AskList::where('asktoken',$asktoken)->first();
		if($AskList['type']==1){
			$returns = array('code'=>'6','msg'=>'很遗憾、已被其他营养师抢答');
		}else{
			$returns = [];
		}
		 return $this->result($returns);
    }

    #语音下载
	public function voice(Request $request){
			#判断字段是否为空
		if($this->verCode($request->all(),[
			'serverid'	=>'required',
			'asktoken'	=>'required',
			'token'		=>'required',
			'seconds'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		
			$utoken=$request->input('token');#用户标识#
			$Dietinfo = Dietinfo::where('token',$utoken)->first();
			$asktoken=$request->input('asktoken');#那个问的语音
			$AskListss = AskList::where('asktoken',$asktoken)->first();
			if($AskListss['type']==1){
				return $this->result(array('code'=>6,'msg'=>'很遗憾、已被其他营养师抢答'));
			}
			$jssdk = new actionjssdk();
		    $token = $jssdk->getToken();
		    $seconds=$request->input('seconds');
			$serverid=$request->input('serverid');
		
			$url="https://api.weixin.qq.com/cgi-bin/media/get?access_token=". $token."&media_id=".$serverid;
			
			$content=$this->curl->get($url);
			$key = 'A'.time().'.amr';
			$filename = 'voice/'.$key;
		    $res      = file_put_contents($filename,$content);
		    if (!$res) {
		      $r= array('code'=>'5','msg' => '写入文件失败');
		       return $this->result($r);
		    }else{
		    	#七牛云上传 和 转码接口
		    	#返回数据  正在=url路径  错误=空字符串
		    	$date['url'] = "../".$filename;
			   	$date['key'] = $key;
			    $URl = "http://api.shoumeikeji.cn/Qniu/index.php";
			 	$contentsss=$this->curl->post($URl,$date);
			 	$AskList = AskList::where('asktoken',$asktoken)->first();
			 	
			 	$AskList->dietitian = $Dietinfo['dietitian'];
			 	$AskList->dietitian_img = $Dietinfo['mgpic'];
			 	$AskList->dietitian_name = $Dietinfo['name'];
			 	$AskList->education = $Dietinfo['education'];
			 	$AskList->grade = $Dietinfo['grade'];
			 	$AskList->seconds = $seconds;
			 	$AskList->type  = 1;
			 	$AskList->askurl = $contentsss;

			 	if(!empty($contentsss)){	
			 		if($AskList->save()){
			 			$meici = $this->meici($Dietinfo['token'],$Dietinfo['name'],$AskListss['price'],$AskList['token'],$AskList['token_name']);
						if($meici){
							$meitian = $this->meitian($Dietinfo['token'],$AskListss['price']);
							if($meitian){
								$zongjiaoyi = $this->zongjiaoyi($Dietinfo['token'],$AskListss['price']);
							}
						}
			 			
			 			$returns['diet'] = $Dietinfo;
						#微信a链接消息推送给用户
		                $code=$this->UMbxx($Dietinfo['name'],$AskList['token'],$asktoken);
		                if($code!=0){
		                 	$returns=array('code'=>'5','msg'=>'网络错误1,请刷新后重试');
		                }else{		                	
		                	$returns['diet'] = $Dietinfo;
		                }
            		}
			 	}else{
			 		$returns = array('code'=>'5','msg'=>'网络错误');
			 	}
			 }
		return $this->result($returns);
	}


	#语音下载 （重复回答）
	public function voiceResets(Request $request){
			#判断字段是否为空
		if($this->verCode($request->all(),[
			'serverid'	=>'required',
			'asktoken'	=>'required',
			'token'		=>'required',
			'seconds'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		
			$utoken=$request->input('token');#用户标识#
			$Dietinfo = Dietinfo::where('token',$utoken)->first();
			$asktoken=$request->input('asktoken');#那个问的语音
			$AskListss = AskList::where('asktoken',$asktoken)->first();
			if($AskListss['type']==1){
				return $this->result(array('code'=>6,'msg'=>'很遗憾、已被其他营养师抢答'));
			}

			$jssdk = new actionjssdk();
		    $token = $jssdk->getToken();
		    $seconds=$request->input('seconds');
			$serverid=$request->input('serverid');
		
			
			$url="https://api.weixin.qq.com/cgi-bin/media/get?access_token=". $token."&media_id=".$serverid;
			// $url="https://api.weixin.qq.com/cgi-bin/media/get/jssdk?access_token=". $token."&media_id=".$serverid;
			
			$content=$this->curl->get($url);
			// $AccessToken = $this->curl->getAccessToken();
			$key = 'A'.time().'.amr';
			$filename = 'voice/'.$key;
		    $res      = file_put_contents($filename,$content);
		    if (!$res) {
		      $r= array('code'=>'5','msg' => '写入文件失败');
		       return $this->result($r);
		    }else{
		    	#七牛云上传 和 转码接口
		    	#返回数据  正在=url路径  错误=空字符串
		    	$date['url'] = "../".$filename;
			   	$date['key'] = $key;
			    $URl = "http://api.shoumeikeji.cn/Qniu/index.php";
			 	$contentsss=$this->curl->post($URl,$date); 

			 	// $url = "http://api.shoumeikeji.cn/Qniu/index.php?url=../".$filename."&key=".$key;
			 	// $contentsss=$this->curl->get($url);
			 	$AskList = AskList::where('asktoken',$asktoken)->first();
			 	
			 	$AskList->dietitian = $Dietinfo['dietitian'];
			 	$AskList->dietitian_img = $Dietinfo['mgpic'];
			 	$AskList->dietitian_name = $Dietinfo['name'];
			 	$AskList->education = $Dietinfo['education'];
			 	$AskList->grade = $Dietinfo['grade'];
			 	$AskList->seconds = $seconds;
			 	$AskList->type  = 1;
			 	$AskList->state  = 2;
			 	// $AskList->price = 0;
			 	$AskList->askurl = $contentsss;

			 	if(!empty($contentsss)){	
			 		if($AskList->save()){
			 			
			 			$returns['diet'] = $Dietinfo;
						#微信a链接消息推送给用户
		                $code=$this->Resets($Dietinfo['name'],$AskList['token'],$asktoken);
		                if($code!=0){
		                 	$returns=array('code'=>'5','msg'=>'网络错误1,请刷新后重试');
		                }else{		                	
		                	$returns['diet'] = $Dietinfo;
		                }
            		}
			 	}else{
			 		$returns = array('code'=>'5','msg'=>'网络错误');
			 	}
			 }
		return $this->result($returns);
	}



	#多图片下载
	public function pictures(Request $request){
			#判断字段是否为空
		if($this->verCode($request->all(),[
			'serverids'	=>'required',
		])){
			return $this->publicparaResponse();
		}
			$jssdk = new actionjssdk();
		    $token = $jssdk->getToken();
			$serverid=$request->input('serverids');
			$serverArr=explode('.', $serverid);
			$length=count($serverArr);
			$j=0;
			$filestr='';
			foreach($serverArr as $v){
				$url="https://api.weixin.qq.com/cgi-bin/media/get?access_token=".$token."&media_id=".$v;
				$content=$this->curl->get($url);
				$filename = 'picture/'.time().rand(10000,99999).'.jpg';
				$res      = file_put_contents($filename,$content);
			    if (!$res) {
			      $r= array('code'=>'5','msg' => '写入文件失败');
			       return $this->result($r);
			    }
			    if($j==0)
			    {
			    	$filestr='http://api.shoumeikeji.cn/'.$filename;
			    }else{
			    	$filestr=$filestr.'_http://api.shoumeikeji.cn/'.$filename;
			    }
			    $j++;

			}   
		 return $this->result($filestr);
	}


	#单图片下载
	public function picture(Request $request){
			#判断字段是否为空
		if($this->verCode($request->all(),[
			'serverid'	=>'required',
		])){
			return $this->publicparaResponse();
		}

			$jssdk = new actionjssdk();
		    $token = $jssdk->getToken();
			$serverid=$request->input('serverid');
			$url="https://api.weixin.qq.com/cgi-bin/media/get?access_token=". $token."&media_id=".$serverid;
			// $url="https://api.weixin.qq.com/cgi-bin/media/get/jssdk?access_token=". $token."&media_id=".$serverid;
			
			$content=$this->curl->get($url);
			// $AccessToken = $this->curl->getAccessToken();
			$filename = 'picture/'.time().rand(1000,9999).'.jpg';
		    $res      = file_put_contents($filename,$content);
		    if (!$res) {
		      $r= array('code'=>'5','msg' => '写入文件失败');
		       return $this->result($r);
		    }

		    
		 return $this->result($filename);
	}


	#JSSDK
	public function jssdkask(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'url'	=>'required',
		])){
			return $this->publicparaResponse();
			}
		$url = $request->input('url');
	 	$jssdk = new actionjssdk();
	    $signPackage = $jssdk->GetSignPackage($url);
	    $mod['appId'] = $signPackage["appId"];
	    $mod['timestamp'] = $signPackage["timestamp"];
	    $mod['nonceStr'] = $signPackage["nonceStr"];
	    $mod['signature'] = $signPackage["signature"];
	    return $this->result($mod);
	}


	#分答列表
	public function list(Request $request)
	{
		$DietcateModel = Dietcate::where('parent',0)->get();
		foreach ($DietcateModel as $k => $v) {
			$DietcateModel[$k]['list'] = AskList::orderby('id','desc')->where('cid',$v['id'])->where('type',1)->select('asktoken','price','ctime','dietitian'
				,'dietitian_img','dietitian_name','education','state','grade'
				,'type','txt','num','cid')->get();
			foreach ($DietcateModel[$k]['list'] as $kk => $vv) {
				if($v['id'] == $vv['cid']){
					$vv['cname'] = $v['name'];
					if($vv['price']>1000) {
						// if($vv['price']%20==0){
							$vv['price'] = $vv['price']/1000;
						// }else{
							// $r=array('code'=>'6','msg'=>'钱的问题');
						// }
					}else{
						$vv['price']=1;
					}
					
				}
			}
		}

		// array_replace($list['cid'], $DietcateModel['name'])
		// $this->responseContent = $list->toArray();
		// return $this->publicResponse();
		return $this->result(array('cate'=>$DietcateModel));
	}


	#分答首页(列表)
	public function index(Request $request)
	{
		#接参
		$cid = $request->input('cid');
		$DietcateModel['cid'] = empty($cid)?1:$cid;
		$DietcateModel['cate']= Dietcate::where('parent',0)->get();
		#判断
		$dcid = empty($cid)?$DietcateModel['cate'][0]['id']:$cid;
		$DietcateModel['list'] = AskList::orderby('id','desc')->where('cid',$dcid)->where('type',1)->select('asktoken','price','ctime','dietitian','dietitian_img','dietitian_name','education','state','grade','type','txt','num','cid')->get();
			

		foreach ($DietcateModel['list'] as $kk => $vv) {
			foreach ($DietcateModel['cate'] as $k=>$v) {
				if($v['id'] == $vv['cid']){
					$vv['cname'] = $v['name'];
					if($vv['price']>1000) {
						// if($vv['price']%20==0){
							$vv['price'] = $vv['price']/1000;
						// }else{
							// $r=array('code'=>'6','msg'=>'钱的问题');
						// }
					}else{
						$vv['price']=1;
					}					
				}	
			}				
		}
		return $this->result($DietcateModel);
	}

	#分答详情
	public function detail(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'asktoken'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$asktoken = $request->input('asktoken');
		$token = $request->input('token');

		#分答
		/*---------------------------------------------------------------------------------*/
		$asker = AskList::where('asktoken',$asktoken)->select('asktoken','price','ctime','token','token_img','token_name','dietitian','dietitian_img','dietitian_name','education','grade','type','txt','num','cid','seconds','askurl','state')->first();
					if($asker['price']>1000) {
						// if($asker['price']%20==0){
							$asker['price'] = $asker['price']/1000;
						// }else{

						// 	$r=array('code'=>'6','msg'=>'钱的问题');
						// }
					}else{
						$asker['price']=1;
					}
		// $asker['price']   = $asker['price']/100;
		$asker['ctime'] = date('Y-m-d H:i:s', $asker['ctime']);

		#营养师
		/*---------------------------------------------------------------------------------*/
		$Dietinfo = Dietinfo::where('dietitian',$asker['dietitian'])->select('name','token','dietitian'
					,'mobile','education','grade','job','niche','major','star','askprice','service_person'
					,'service_order','mgpic','desc')->first();

		if($Dietinfo){
			$Dietinfo['star']=$Dietinfo['star']==0? 100:$Dietinfo['star'];
			$Dietinfo['askprice']=$Dietinfo['askprice']/100;
			$DietinfoID = explode(',',$Dietinfo['niche']);
			$Dietinfo['niche'] = Dietcate::whereIn('id',$DietinfoID)->get();
		}
		
		#分答追问追答
		/*---------------------------------------------------------------------------------*/
		$Askadditional = Askadditional::where('asktoken',$asktoken)->get();
		#是否是营养师(语音播放)
		/*--------------------------------------------------------------------------------------*/
		$Dietinfosd = Dietinfo::where('token',$token)->first();
		if(!$Dietinfosd){
			#是否是提问者
			$AskLists  = AskList::where('asktoken',$asktoken)->where('token',$token)->first();
			if(!$AskLists){
				$return = Askorder::where('asktoken',$asktoken)->where('status',2)->where('token',$token)->first()?0:1;
			}else{
				$return = 0;
			}
		}else{
			#是否回答者
			$AskLista  = AskList::where('asktoken',$asktoken)->where('dietitian',$Dietinfosd['dietitian'])->first();	
			if(!$AskLista){				
				$return = Askorder::where('asktoken',$asktoken)->where('status',2)->where('token',$token)->first()?0:1;
			}else{
				$return = 0;
			}
		}
		return $this->result(array('edit'=>$asker,'Diet'=>$Dietinfo,'list'=>$Askadditional 
					,'pay'=>$return));

		// return $this->result($Dietinfo);
	}

	#普通提问(营养咨询)
	public function asker(Request $request)
	{	
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'	=>'required',	
			'txt'	=>'required',	
			'price'	=>'required',	
			'cid'	=>'required',	
		])){
			return $this->publicparaResponse();
		}
		
		$Dietinfo = Dietinfo::where('token',$request->input('token'))->where('status',1)->first();
		if($Dietinfo){
			return $this->result(array('code'=>'6','msg'=>'你不能提问自己'));
		}

		$order_sn = date('YmdHis').rand(1000,9999);
		$UsersModel = UserInfo::where('token',$request->input('token'))->first();
		if(!$UsersModel){
				return $this->publicnetResponse();
		}
		$txt = $this->cleanAll( $request->input( 'txt' ) );//过滤
		#发起问答并下订单	
		$asker = new AskList();		
		$asker->token 		= $UsersModel['token'];
		$asker->token_img 	= $UsersModel['user_img'];
		$asker->token_name 	= $UsersModel['user_name'];		
		$asker->order_sn 	= $order_sn;
		$asker->status 		= 1;
		$asker->state 		= 1;#普通问答
		$asker->asktoken	= 'Ask'.date('YmdHi').rand(100,999);
		
		$asker->txt 		= $txt;
		$asker->price 		= $request->input('price') * 100; 
		$asker->ctime 		= time();
		$asker->cid 		= $request->input ( 'cid' );
		$asker->type 		= 2;
		$returns = $asker->save()?array('order_sn'=>$order_sn):array('code'=>'5','msg'=>'网络错误');
		return $this->result($returns);	
	}

	#营养师提问(营养师咨询)
	public function askdeit(Request $request)
	{	

		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'	=>'required',
			'dietitian'	=>'required',	
			'txt'	=>'required',	
			'price'	=>'required',	
			'cid'	=>'required',	
		])){
			return $this->publicparaResponse();
		}

		$Dietinfo = Dietinfo::where('token',$request->input('token'))->where('status',1)->first();

		
		$order_sn 		= date('YmdHis').rand(1000,9999);
		$UsersModel 	= UserInfo::where('token',$request->input('token'))->first();
		$DietinfoModel 	= Dietinfo::where('dietitian',$request->input('dietitian'))->first();

		
		if($Dietinfo){
			return $this->result(array('code'=>'6','msg'=>'你不能提问自己'));
		}	


		if(!$UsersModel||!$DietinfoModel){
				return $this->publicnetResponse();
		}
		$txt = $this->cleanAll( $request->input( 'txt' ) );//过滤
		#发起问答并下订单
		$asker = new AskList();		
		$asker->token 		= $UsersModel['token'];
		$asker->token_img 	= $UsersModel['user_img'];
		$asker->token_name 	= $UsersModel['user_name'];
		$asker->dietitian 	= $DietinfoModel['dietitian'];
		$asker->dietitian_name 	= $DietinfoModel['name'];
		$asker->dietitian_img 	= $DietinfoModel['mgpic'];
		$asker->education 		= $DietinfoModel['education'];
		$asker->order_sn 	= $order_sn;
		$asker->status 		= 1;
		$asker->state 		= 2;#营养师问答
		$asker->asktoken	= 'Ask'.date('YmdHi').rand(100,999);
		$asker->txt 		= $txt;
		$asker->price 		= $request->input('price')*100; 
		$asker->ctime 		= time();
		$asker->cid 		= $DietinfoModel['tag']; 
		$asker->type 		= 2;
		
			
		$returns = $asker->save()?array('order_sn'=>$order_sn):array('code'=>'5','msg'=>'网络错误');

		return $this->result($returns);	
	}

	#营养师咨询(详情资料)
	public function info(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[			
			'dietitian'	=> 'required',
		])){
			return $this->publicparaResponse();
		}
		$token = $request->input('token');

		$dietitian = $request->input('dietitian');
		$info = Dietinfo::where('dietitian',$dietitian)->first();
		$info['star']=$info['star']==0? 100:$info['star'];
		$info['askprice'] = $info['askprice']/100;
		$niche = explode(',', $info['niche']);
		$info['niche'] = Dietcate::whereIn('id',$niche)->get();
		if(!$info){
			$info = array('code'=>'5','msg'=>'网络错误');
		}

		return $this->result($info);	
	}

	#未支付删除分答
	public function askdel(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[			
			'order_sn'	=> 'required',
		])){
			return $this->publicparaResponse();
		}
		$Askorder = Askorder::where('order_sn',$request->input('order_sn'))->first();
		if($Askorder){
			$return = $Askorder->delete()?[]:array('code'=>'5','msg'=>'网络错误');
		}
		$asker  = AskList::where('order_sn',$request->input('order_sn'))->first();
		if($asker){
			$return = $asker->delete()?[]:array('code'=>'5','msg'=>'网络错误');	
		}


		
		return $this->result($return);	
	}

	#追答
	public function zhiwen(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'asktoken'	=>'required',
			'token'		=>'required',
			'comment'	=>'required',
		])){
			return $this->publicparaResponse();
		}

		$asker  = AskList::where('asktoken',$request->input('asktoken'))->where('type',1)->first();
		if(!$asker){
			$returns = array('code'=>'5','msg'=>'网络错误.问题错误');
		}

		#state = 2  是营养师问答
		if($asker['state']==2){
			$DietinfoModel 	= Dietinfo::where('status',1)->where('token',$request->input('token'))->first();
			if($DietinfoModel){
				$Askadditional = New Askadditional();
				$Askadditional->asktoken  = $asker['asktoken'];
				$Askadditional->token     = $asker['token'];
				$Askadditional->dietitian = $DietinfoModel['dietitian'];
				$Askadditional->dietitian_con = $request->input('comment');
				$Askadditional->ctime = time();
				$Askadditional->type  = 2;		
				if($Askadditional->save()){
						#微信a链接消息推送给用户
		                $code=$this->UMbxx($DietinfoModel['name'],$asker['token'],$asker['asktoken']);
		                if($code!=0){
		                 	$returns=array('code'=>'5','msg'=>'网络错误1,请刷新后重试');
		                }else{
		                	$returns=[];
		                }
				}else{
						$returns =array('code'=>'5','msg'=>'网络错误');
				}		
				// $returns = $Askadditional->save()?[]:array('code'=>'5','msg'=>'网络错误');
			}else{
				$askerArr  = AskList::where('token',$request->input('token'))->where('type',1)->where('asktoken',$request->input('asktoken'))->first();
				if($askerArr){
					$Askadditional = New Askadditional();
					$Askadditional->asktoken  = $askerArr['asktoken'];
					$Askadditional->token     = $askerArr['token'];
					$Askadditional->dietitian = $askerArr['dietitian'];
					$Askadditional->token_con = $request->input('comment');
					$Askadditional->ctime = time();
					$Askadditional->type  = 1;
					if($Askadditional->save()){
						#微信a链接消息推送给营养师
		                $code=$this->Mbxx($askerArr['token_name'],$askerArr['dietitian'],$asker['asktoken']);
		                if($code!=0){
		                 	$returns=array('code'=>'5','msg'=>'网络错误1,请刷新后重试');
		                }else{
		                	$returns=[];
		                }
				}else{
						$returns =array('code'=>'5','msg'=>'网络错误');
				}		
					
					// $returns = $Askadditional->save()?[]:array('code'=>'5','msg'=>'网络错误');

					
				}else{
					$returns = array('code'=>'5','msg'=>'错误的提问用户');
				}				
			}

		}else{
			$returns = array('code'=>'5','msg'=>'网络错误');
		}

		return $this->result($returns);	
		
	}


	#分答偷听(用户偷听)
	public function eavesdrop(Request $request)
	{
		
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'asktoken'	=>'required',	
			'token'		=>'required',	
			'price'		=>'required',		
		])){
			return $this->publicparaResponse();
		}

		$DietinfoModel 	= Dietinfo::where('token',$request->input('token'))->first();
		if($DietinfoModel){
			return $this->result(array('code'=>'6','msg'=>'您是营养师不可以偷听'));
		}
		$UsersModel 	= UserInfo::where( 'token',$request->input('token') )->first();	
		$AskListModel   = AskList::where( 'asktoken',$request->input('asktoken') )->first();
		if(!$UsersModel||!$AskListModel){
				return $this->publicnetResponse();
		}
		$order_sn = date('YmdHis').rand(1000,9999);
		$AskorderModel = New Askorder();
		$AskorderModel->order_sn 	= $order_sn;//生成订单号
		$AskorderModel->token 		= $UsersModel['token'];
		$AskorderModel->asktoken 	= $AskListModel['asktoken'];
		$AskorderModel->ctime 		= time();
		$AskorderModel->status		= 1;
		$AskorderModel->price 		= $request->input('price')*100;
		$returns = $AskorderModel->save()?array('order_sn'=>$order_sn):array('code'=>'5','msg'=>'网络错误');
		return $this->result($returns);			
	}

	#下单失败删除订单
	public function askorderdel(Request $request)
	{

		#判断字段是否为空
		if($this->verCode($request->all(),[
			'asktoken'	=>'required',	
			'token'		=>'required',	
			'price'		=>'required',		
		])){
			return $this->publicparaResponse();
		}


		$Askorder = Askorder::where()->first();
	}

	#用户中心 我的偷听 
	public function mine(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[			
			'token'		=>'required',	
		])){
			return $this->publicparaResponse();
		}
		
		$AskorderArr = Askorder::where('token',$request->Input('token'))->where('status',2)->get();
		$AskListArr = AskList::all();
		foreach ($AskorderArr as $k => $v) {
			foreach ($AskListArr as $kk => $vv) {
				if($v['asktoken']==$vv['asktoken']){
					$AskorderArr[$k]['txt'] = $vv['txt'];
					$AskorderArr[$k]['price'] = $vv['price']/100;
					$AskorderArr[$k]['dietitian_img'] = $vv['dietitian_img'];
					$AskorderArr[$k]['dietitian_name'] = $vv['dietitian_name'];
					$AskorderArr[$k]['cid'] = $vv['cid'];
					$AskorderArr[$k]['education'] = $vv['education'];
					$AskorderArr[$k]['job'] = $vv['job'];
					$AskorderArr[$k]['num'] = $vv['num'];
				}
			}
		}
		
		return $this->result($AskorderArr);	
	}

	#用户中心 我的提问 
	public function quiz(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[			
			'token'	=> 'required',	
		])){
			return $this->publicparaResponse();
		}

		$token = $request->input('token');


		/*-----------已回答------------*/
		$AskListModel['lista'] = AskList::where('token',$token)->where('status',2)->where('type',1)->orderby('id','desc')->select('token_name','asktoken','txt','ctime','type','state','type','status')->get();


		foreach ($AskListModel['lista']  as $k => $v) {
			$v['ctime']=date('Y-m-d H:i:s',$v['ctime']);
		}
		
		/*-----------未回答------------*/
		$AskListModel['listb'] = AskList::where('token',$token)->where('status',2)->where('type',2)->orderby('id','desc')->select('token_name','asktoken','txt','ctime','type','state','type','status')->get();


		foreach ($AskListModel['listb']  as $k => $v) {
			$v['ctime']=date('Y-m-d H:i:s',$v['ctime']);
		}

		if(!$AskListModel['lista']||!$AskListModel['listb']){
			$AskListModel = array('code'=>'5','msg'=>'网络错误');
		}

		return $this->result($AskListModel);	
	}

	#营养师中心 我的回答 
	public function response(Request $request)
	{

		#判断字段是否为空
		if($this->verCode($request->all(),[			
			'token' => 'required',	
		])){
			return $this->publicparaResponse();
		}

		$token = $request->input('token');
		$UsersModel 	= Dietinfo::where( 'token',$token)->first();	
		$AskListModel   = AskList::where('dietitian',$UsersModel['dietitian'])->orderby('id','desc')->where('type',1)->where('status',2)->select('asktoken','price','ctime','dietitian','dietitian_img','dietitian_name','state','education','grade','type','txt','num','cid')->get();

		$DietcateModel = Dietcate::where('parent',0)->get();
		foreach ($AskListModel as $k => $v) {
			if($v['price']>1000) {
						// if($v['price']%20==0){
				$v['price'] = $v['price']/1000;
						// }else{
						// 	$r=array('code'=>'6','msg'=>'钱的问题');
						// }
			}else{
					$v['price']=1;
			}

			foreach ($DietcateModel as $kk => $vv) {
				if($vv['id'] == $v['cid']){
					$AskListModel[$k]['cname'] = $vv['name'];
				}
			}
		}

		if(!$AskListModel){
			$AskListModel = array('code'=>'5','msg'=>'网络错误');
		}

		return $this->result($AskListModel);	
	}

	#营养师中心 提问抢答 
	public function answer(Request $request)
	{

		#判断字段是否为空
		if($this->verCode($request->all(),[			
			'token' => 'required',	
		])){
			return $this->publicparaResponse();
		}

		$token =  $request->input('token');
		$Dietinfo = Dietinfo::where('token',$token)->first();
		#普通提问
		$AskListModel['plist'] = AskList::where('type',2)->where('status',2)->where('state',1)->select('token_name','asktoken','txt','ctime','type','state')->get();

		#指定提问
		$AskListModel['ylist'] = AskList::where('type',2)->where('state',2)->where('status',2)
		->where('dietitian',$Dietinfo['dietitian'])->select('token_name','asktoken','txt','ctime','type','state')->get();

		#重置提问
		$AskListModel['clist'] = AskList::where('type',2)->where('state',3)->where('status',2)
		->where('dietitian',$Dietinfo['dietitian'])->select('token_name','asktoken','txt','ctime','type','state')->get();


		if($AskListModel['plist']){
			foreach ($AskListModel['plist'] as $key => $value) {
			$AskListModel['plist'][$key]['ctime'] = date('Y-m-d H:i:s',$value['ctime']);
 			}
		}

 		if($AskListModel['ylist']){
 			foreach ($AskListModel['ylist'] as $key => $value) {
			$AskListModel['ylist'][$key]['ctime'] = date('Y-m-d H:i:s',$value['ctime']);
 			}
 		}
 		
		if(!$AskListModel['plist']||!$AskListModel['ylist']){
			$AskListModel = array('code'=>'5','msg'=>'网络错误');
		}
		return $this->result($AskListModel);	
	}


	#营养师详情	分答列表
	public function dietfendas(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			//'qtoken'	=>'required',	
			'dietitian'=>'required',	
		])){
			return $this->publicparaResponse();
		}
		$dietitian = $request->input('dietitian');
		$DietcateModel = Dietcate::where('parent',0)->get();		
		$DietinfoModel = Dietinfo::where('dietitian',$dietitian)->first();
		if(!$DietinfoModel){
			$Returns = array('code'=>'5','msg'=>'网络错误');
		}
		

		$Returns = AskList::where('dietitian',$DietinfoModel['dietitian'])->orderBy('id','desc')->select('asktoken','price','ctime','dietitian','dietitian_img','dietitian_name','education','grade','type','txt','num','cid')->get();

		foreach ($Returns as $k => $v) {
			foreach ($DietcateModel as $kk => $vv) {
				if($vv['id'] == $v['cid']){
					$Returns[$k]['cname'] = $vv['name'];
				}
			}
			// $Returns[$k]['price'] = $v['price']/100;
			if($v['price']>1000) {
						// if($v['price']%20==0){
				$Returns[$k]['price'] = $v['price']/1000;
						// }else{
						// 	$r=array('code'=>'6','msg'=>'钱的问题');
						// }
			}else{
					$Returns[$k]['price']=1;
			}
		}

		return $this->result($Returns);


	}

	#每次交易
	public function meici($Diet_token,$Diet_name,$price,$user_token,$user_name)
	{
		/*每次交易*/
		$UserEarningsAt = New UserEarningsAt();
		$UserEarningsAt->type = 1;
		$UserEarningsAt->operation = 1;
		$UserEarningsAt->price 	= $price;
		$UserEarningsAt->name 	= $Diet_name;
		$UserEarningsAt->token 	= $Diet_token;
		$UserEarningsAt->totoken = $user_token;
		$UserEarningsAt->toname = $user_name;
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

	#个人中心聊天列表
	public function asklist(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token 	= $request->input('token');
		$Dietinfo = Dietinfo::where('token',$token)->where('status',1)->first();
		if($Dietinfo){
			$AskconsultModel = Askconsult::where('dietitian',$Dietinfo['dietitian'])->get();
			foreach ($AskconsultModel as $key => $value) {
					$UserInfo = UserInfo::where('token',$value['token'])->first();
					$value['user_img'] = $UserInfo['user_img'];
					$value['user_name'] = $UserInfo['user_name'];
			}
			if(!$AskconsultModel){
				return $this->result(array('code'=>'5','msg'=>'网络错误1'));
			}
			return $this->result(array('list'=>$AskconsultModel));	
		}else{
			$UserInfo = UserInfo::where('token',$token)->first();
			if($UserInfo){
				$AskconsultModel = Askconsult::where('token',$UserInfo['token'])->get();
				foreach ($AskconsultModel as $key => $value) {
					$Dietinfo = Dietinfo::where('dietitian',$value['dietitian'])->where('status',1)->first();
					$value['dietitian_img'] = $Dietinfo['mgpic'];
					$value['dietitian_name'] = $Dietinfo['name'];
					
				}
				if(!$AskconsultModel){
					return $this->result(array('code'=>'5','msg'=>'网络错误2'));
				}
				return $this->result(array('list'=>$AskconsultModel));	
			}else{
				return $this->result(array('code'=>'5','msg'=>'网络错误3'));
			}
		}
		
	}

	#个人聊天内容获取
	public function askcontents(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'atoken'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$atoken 	= $request->input('atoken');
		$atokenArr=Askconsult::where('atoken',$atoken)->first();
		$diet=$atokenArr['dietitian'];
		$token=$atokenArr['token'];
		$asklist=Askconslist::where('dietitian',$diet)->where('token',$token)->get();
		// $asklist=Askconslist::where('dietitian',$diet)->where('token',$token)->orderby('id','desc')->limit(6)->get();
		$asklist = array_slice($asklist->toArray(), -15);// 倒数15个
	

		$Model['asklist']=empty($asklist)? '':$asklist;
		return $this->result($Model);	
	}

	#个人聊天
	public function askedits(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'atoken'	=>'required',
			'token'		=>'required',
			'content'	=>'required',
		])){
			return $this->publicparaResponse();
		}

		$token 		= $request->input('token');
		$content 	= $request->input('content');
		$atoken 	= $request->input('atoken');
		$DietinfoModel 	= Dietinfo::where('token',$request->input('token'))->first();
		if($DietinfoModel){
				$atokeninfo=Askconsult::where('atoken',$atoken)->first();
				if(!$atokeninfo){
					return $this->result(array('code'=>'5','msg'=>'网络错误1'));
				}
				$utoken=$atokeninfo['token'];

				$uinfo=UserInfo::where('token',$utoken)->first();
 				$Asklist = new Askconslist();
				$Asklist->token 		= $uinfo['token'];
				$Asklist->tname 		= $uinfo['user_name'];
				$Asklist->timg 			= $uinfo['user_img'];
				$Asklist->dietitian 	= $DietinfoModel['dietitian'];
				$Asklist->dname 		= $DietinfoModel['name'];
				$Asklist->dimg 			= $DietinfoModel['mgpic'];
				$Asklist->dietitian_con = $content;
				$Asklist->order_sn 		= $atoken;
				$Asklist->ctime 		= time();
				$Asklist->type 			= 2;
				if($Asklist->save()){
						#微信a链接消息推送
		                $code=$this->UMbxxsa($DietinfoModel['name'],$uinfo['token'],$atoken);
		                if($code!=0){
		                 	$returns=array('code'=>'5','msg'=>'网络错误1,请刷新后重试');
		                }else{
		                	$returns=[];
		                }
				}else{
						$returns =array('code'=>'5','msg'=>'网络错误');
				}		
		}else{
			$atokeninfo=Askconsult::where('atoken',$atoken)->first();
				if(!$atokeninfo){
					return $this->result(array('code'=>'5','msg'=>'网络错误1'));
				}
			$Dietinfo  = Dietinfo::where('dietitian',$atokeninfo['dietitian'])->first();
			$UserInfo  = UserInfo::where('token',$token)->first();
			if(!$Dietinfo){
				return $this->result(array('code'=>'5','msg'=>'Ta已不是营养师'));
			}		
				$Asklist = new Askconslist();
				$Asklist->token 	= $UserInfo['token'];
				$Asklist->tname 	= $UserInfo['user_name'];
				$Asklist->timg 		= $UserInfo['user_img'];
				$Asklist->dietitian = $Dietinfo['dietitian'];
				$Asklist->dname 	= $Dietinfo['name'];
				$Asklist->dimg 		= $Dietinfo['mgpic'];
				$Asklist->token_con = $content;
				$Asklist->order_sn 	= $atoken;
				$Asklist->ctime 	= time();
				$Asklist->type 		= 1;
				if($Asklist->save()){
						#微信a链接消息推送
		                $code=$this->Mbxxsa($UserInfo['user_name'],$Dietinfo['token'],$atoken);
		                if($code!=0){
		                 	$returns=array('code'=>'5','msg'=>'网络错误1,请刷新后重试');
		                }else{
		                	$returns=[];
		                }
				}else{
						$returns =array('code'=>'5','msg'=>'网络错误');
				}	
				// $returns = $Asklist->save()?[]:array('code'=>'5','msg'=>'网络错误2');
		}
		return $this->result($returns);
	}



	#内容过滤
	public function cleanJs( $html )
	{  
	    $html = trim ( $html );  
	    $html = str_replace ( array ( '<?' , '?>' ) , array ( '<?' , '?>' ) , $html );  
	    $pattern = array (  
			   "'<script[^>]*?>.*?</script>'si",  
			   "'<style[^>]*?>.*?</style>'si",  
			   "'<frame[^>]*?>'si",  
			   "'<iframe[^>]*?>.*?</iframe>'si",  
			   "'<link[^>]*?>'si"  
		   		);  
	   $replace = array ( "" , "" , "" , "" , "" );  
	   return   preg_replace ( $pattern , $replace , $html );  
	 }  
   
  	public function cleanJsCss ( $html )
  	{  
			$html = trim($html);  

			$html = preg_replace('/\0+/', '', $html );  

			$html = preg_replace('/(\\\\0)+/', '', $html ); 

			$html = preg_replace('#(&\#*\w+)[\x00-\x20]+;#u',"\\1;" , $html );  

			$html = preg_replace('#(&\#x*)([0-9A-F]+);*#iu',"\\1\\2;" , $html );  

			$html = preg_replace("/%u0([a-z0-9]{3})/i", "&#x\\1;", $html);  

			$html = preg_replace("/%([a-z0-9]{2})/i", "&#x\\1;", $html);  

			$html=str_replace(array('<?','?>'),array('<?','?>'),$html);  

			$html=preg_replace('#\t+#',' ',$html);  

			$scripts=array('javascript','vbscript','script','applet','alert','document','write','cookie','window');  

			foreach ( $scripts as $script)
			{  
			    $temp_str="";

			    for( $i = 0 ; $i < strlen ( $script ) ; $i++ )
			    {  
			        $temp_str .= substr($script,$i,1)."\s*";  
			    }

			    $temp_str = substr($temp_str,0,-3); 

			    $html = preg_replace('#'.$temp_str.'#s',$script,$html);  

			    $html = preg_replace('#'.ucfirst($temp_str).'#s',ucfirst($script),$html);  
			} 

			
			$html = preg_replace("#<a.+?href=.*?(alert\(|alert&\#40;|javascript\:|window\.|document\.|\.cookie|<script|<xss).*?\>.*?</a>#si", "", $html);  
			
			$html = preg_replace("#<img.+?src=.*?(alert\(|alert&\#40;|javascript\:|window\.|document\.|\.cookie|<script|<xss).*?\>#si", "", $html);  
			
			$html = preg_replace("#<(script|xss).*?\>#si", "<\\1>", $html);  
			
			$html = preg_replace('#(<[^>]*?)(onblur|onchange|onclick|onfocus|onload|onmouseover|onmouseup|onmousedown|onselect|onsubmit|onunload|onkeypress|onkeydown|onkeyup|onresize)[^>]*>#is',"\\1>",$html);  
			//$html=preg_replace('#<(/*\s*)(alert|applet|basefont|base|behavior|bgsound|blink|body|embed|expression|form|frameset|frame|head|html|ilayer|iframe|input|layer|link|meta|object|plaintext|style|script|textarea|title|xml|xss)([^>]*)>#is', "<\\1\\2\\3>", $html);  
			$html = preg_replace('#<(/*\s*)(alert|applet|basefont|base|behavior|bgsound|blink|body|expression|form|frameset|frame|head|html|ilayer|iframe|input|layer|link|meta|object|plaintext|style|script|textarea|title|xml|xss)([^>]*)>#is', "<\\1\\2\\3>", $html);  
			$html = preg_replace('#(alert|cmd|passthru|eval|exec|system|fopen|fsockopen|file|file_get_contents|readfile|unlink)(\s*)(.∗?)#si', "\\1\\2(\\3)", $html);  
			$bad = array(  
			'document.cookie'   => '',  
			'document.write'    => '',  
			'window.location'   => '',  
			"javascript\s*:"    => '',  
			"Redirect\s+302"    => '',  
			'<!--'               => '<!--',  
			'-->'                => '-->'  
			);  
			foreach ( $bad as $key=>$val )
			{  
			    $html = preg_replace ("#".$key."#i",$val,$html);  
			}  
			   return   $html;  
 	}  

 	//过滤html标签以及敏感字符
	public 	function cleanHtml ( $html ) 
	{  
		return cleanYellow(htmlspecialchars($html));  
	}  
		 //过滤部分HTML标签  
		  
	public function cleanFilter ( $html )
	{  
		    $html = trim($html);  
		    $html = preg_replace("/<p[^>]*?>/is","<p>",$html);  
		    $html = preg_replace("/<div[^>]*?>/is","<div>",$html);  
		    $html = preg_replace("/<ul[^>]*?>/is","<ul>",$html);  
		    $html = preg_replace("/<li[^>]*?>/is","<li>",$html);  
		    $html = preg_replace("/<span[^>]*?/is","<span>",$html);  
		    $html = preg_replace("/<a[^>]*?>(.*)?<\/a>/is","\${1}",$html);  
		    $html = preg_replace("/<table[^>]*?>/is","<table>",$html);  
		    $html = preg_replace("/<tr[^>]*?>/is","<tr>",$html);  
		    $html = preg_replace("/<td[^>]*?>/is","<td>",$html);  
		    $html = preg_replace("/<ol[^>]*?>/is","<ol>",$html);  
		    $html = preg_replace("/<form[^>]*?>/is","",$html);  
		    $html = preg_replace("/<input[^>]*?>/is","",$html);  
		    return $html;  
	}  
		 //过滤非法的敏感字符串  
	public function cleanYellow ( $txt )
	{  
		    $txt=str_replace(

			    array(
				    "黄色","性爱","做爱","我日","我草","我靠","尻","共产党","胡锦涛","毛泽东",  
				    "政府","中央","研究生考试","性生活","色情","情色","我考","麻痹","妈的","阴道",  
				    "淫","奸","阴部","爱液","阴液","臀","色诱","煞笔","傻比","阴茎","法轮功","性交","阴毛","江泽民"
			    ),

			    array(
			    	"*1*","*2*","*3*","*4*","*5*","*6*","*7*","*8*","*9*","*10*",  
				    "*11*","*12*","*13*","*14*","*15*","*16*","*17*","*18*","*19*","*20*",  
				    "*21*","*22*","*23*","*24*","*25*","*26*","*27*","*28*","*29*","*30*","*31*","*32*","*33*","*34*"
			    ),

			    $txt

			    );  

		    return $txt;  
	}  
		 //过滤敏感字符串以及恶意代码  
	public function cleanAll ( $html )
	{  
		    return $this->cleanYellow($this->cleanJsCss($html));  
	}  
		 //全半角字符替换 
	public function setFilter($html)
	{  
		        $arr = array(
		        		'０' => '0', '１' => '1', '２' => '2', '３' => '3', '４' => '4',  
		                '５' => '5', '６' => '6', '７' => '7', '８' => '8', '９' => '9',  
		                'Ａ' => 'A', 'Ｂ' => 'B', 'Ｃ' => 'C', 'Ｄ' => 'D', 'Ｅ' => 'E',  
		                'Ｆ' => 'F', 'Ｇ' => 'G', 'Ｈ' => 'H', 'Ｉ' => 'I', 'Ｊ' => 'J',  
		                'Ｋ' => 'K', 'Ｌ' => 'L', 'Ｍ' => 'M', 'Ｎ' => 'N', 'Ｏ' => 'O',  
		                'Ｐ' => 'P', 'Ｑ' => 'Q', 'Ｒ' => 'R', 'Ｓ' => 'S', 'Ｔ' => 'T',  
		                'Ｕ' => 'U', 'Ｖ' => 'V', 'Ｗ' => 'W', 'Ｘ' => 'X', 'Ｙ' => 'Y',  
		                'Ｚ' => 'Z', 'ａ' => 'a', 'ｂ' => 'b', 'ｃ' => 'c', 'ｄ' => 'd',  
		                'ｅ' => 'e', 'ｆ' => 'f', 'ｇ' => 'g', 'ｈ' => 'h', 'ｉ' => 'i',  
		                'ｊ' => 'j', 'ｋ' => 'k', 'ｌ' => 'l', 'ｍ' => 'm', 'ｎ' => 'n',  
		                'ｏ' => 'o', 'ｐ' => 'p', 'ｑ' => 'q', 'ｒ' => 'r', 'ｓ' => 's',  
		                'ｔ' => 't', 'ｕ' => 'u', 'ｖ' => 'v', 'ｗ' => 'w', 'ｘ' => 'x',  
		                'ｙ' => 'y', 'ｚ' => 'z',  
		                '（' => '(', '）' => ')', '〔' => '[', '〕' => ']', '【' => '[',  
		                '】' => ']', '〖' => '[', '〗' => ']', '“' => '[', '”' => ']',  
		                '‘' => '[', '’' => ']', '｛' => '{', '｝' => '}', '《' => '<',  
		                '》' => '>',  
		                '％' => '%', '＋' => '+', '—' => '-', '－' => '-', '～' => '-',  
		                '：' => ':', '。' => '.', '、' => ',', '，' => '.', '、' => '.',  
		                '；' => ',', '？' => '?', '！' => '!', '…' => '-', '‖' => '|',  
		                '”' => '"', '’' => '`', '‘' => '`', '｜' => '|', '〃' => '"',  
		                '　' => ' '
		                );
	 			return  strtr ( $html , $arr );

	}  
	
}