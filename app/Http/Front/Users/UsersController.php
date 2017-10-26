<?php
namespace App\Http\Front\Users;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\UserInfo;
use App\Models\Dietinfo;
use App\Models\UserCode;
use App\Models\Quanarticle;
use App\Models\AskList;
use App\Models\Askconslist;
use App\Helpers\PublishBatchSMSMessageDemo;
use App\Models\UserEarningsAt;
use App\Models\UserEarningsBay;
use App\Models\UserEarningsThe;
use App\Models\CommissionThe;
use App\Models\UsersTickling;
use App\Models\Userwithdrawal;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use App\Models\UserSpokesmanMapping;
use Intervention\Image\Facades\Image;
use App\Helpers\Curl;
use App\Helpers\actionjssdk;//微信jsdk
use App\Helpers\Wx;
class UsersController extends BaseController
{

	  function __construct() 
    {
        $this->curl = new Curl();
         $this->wx=new Wx();
    }
     
   public function tests(Request $request){

		//必传参token
   		if($this->verCode($request->all(),[
			'token'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		} 
		$token = $request->input('token');
   	    $UserInfo = UserInfo::where('token',$token)->first();
        // $uname = $UserInfo->user_name;
        $user_img = $UserInfo->user_img;
        $json=$this->curl->get($user_img);
        $uimg=imagecreatefromstring($json);

     	// $imgsize=getimagesize($uimg);
     	// 
     	$width = imagesx($uimg);//logo图片宽度
     	$height = imagesy($logo);//logo图片高度
     	// return $this->result($logo_width);

		//无需传参
		  //  		//获取用户列表
		  //       $accesstoken= $this->wx->getAccessToken();
		  //  		$obj=Users::get();
		  //  		$array=$obj->toArray();
		  //  		$ar=array_column($array,'openid');
				// $arrsq=array_slice($ar,200,100);
				// // $a=count($arrsq);
			 //    foreach($arrsq as $k=>$v){
		  //           $arrs['user_list'][$k]['openid']=$v;
		  //           $arrs['user_list'][$k]['lang']='zh_CN';
		  //       }
		  //       $data=json_encode($arrs);
		  //       $urls="https://api.weixin.qq.com/cgi-bin/user/info/batchget?access_token=".$accesstoken;
		  //       $json=$this->curl->post($urls,$data);
		  //       $jsonArr=json_decode($json,true);
		  //       return $this->result($jsonArr);
   }


   	//授权进入找营养师界面,判断是否关注公众号
   	public function  pan(Request $request){
   		if($this->verCode($request->all(),[
			'token'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		} 
		$token = $request->input('token');
   		$Model=Users::where('token',$token)->select('subscribe')->first();
   		 return $this->result($Model['subscribe']);
   	}
   
	#个人中心 账户金额 
	public function userprice(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		} 
			$token = $request->input('token');

			$UserEarningsThe = UserEarningsThe::where('token',$token)->first();

			//判断yprice是否为空
			if($UserEarningsThe['price']){
				$price = ($UserEarningsThe['price'] - $UserEarningsThe['yprice'])/100;
			}else{
				$price = ($UserEarningsThe['price'] - 0)/100;
			}
			return $this->result($price);	

	}

	#我是首页 判断是否是营养师
	public function Judge(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		} 

			$token = $request->input('token');
			$returns = Users::where('token',$token)->select('type')->first();

			if(!$returns){
				$returns = array('code'=>'5','msg'=>'网络错误');
			}

			return $this->result($returns);	

	}	


	#获取验证码
	public function usercode(Request $request)
	{
		if($this->verCode($request->all(),[
			'mobile'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
		$mobile = $request->input('mobile');

		
		#生成随机验证码
		$mobile_code = '';

		$charser = '4321560987';
		$_len = strlen($charser) - 1;
		for ($i=0; $i < 6; ++$i) { 
			$mobile_code .= $charser[mt_rand(0,$_len)];
		}
		
		$UserCodeModel = New UserCode();
		$UserCodeModel->mobile 	= $mobile;
		$UserCodeModel->code 	= $mobile_code;
		$UserCodeModel->time 	= time();
		//存入数据库  后发送至手机

		 if( $UserCodeModel->save() ){
			$instance = new PublishBatchSMSMessageDemo();
			$inst = $instance->run($mobile,$mobile_code);	
				if(empty($inst)){
					$returns=array('code'=>'5','msg'=>'网络失败');
				}else{
					$returns=array('code'=>'1','msg'=>'发送成功');
				}
		 	}

		 return $this->result($returns);	

	}


	#判断用户是否 是会员
	public function touser(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}

		$token  = $request->input('token');
		$UsersModel = Users::where('token',$token)->first();
		$returns = !empty($UsersModel['type']!=1)?1:5;
		return $this->result($returns);	

	}


	#提交注册
	public function register(Request $request)
	{
		if($this->verCode($request->all(),[
			'code'=>'required',
			'mobile'=>'required',
			'token'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}

		$mobile = $request->input('mobile');
		$code   = $request->input('code');
		$token  = $request->input('token');
		$UserCodeModel = UserCode::where('mobile',$mobile)->where('code',$code)->first();

		if(!$UserCodeModel){
			$returns = array('code'=>'5','msg'=>'网络错误');
		}

		$UsersModel = Users::where('token',$token)->first();
		$UsersModel->type  	 = 2;
		$UsersModel->mobile  = $UserCodeModel['mobile'];
		$returns=$UsersModel->save()?[]:array('code'=>'5','msg'=>'网络错误');

		return $this->result($returns);	

	}

	#个人中心
	public function userinfo(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}

		$token  = $request->input('token');
		$Users = Users::where('token',$token)->first();
		if($Users){
			$Dietinfo = Dietinfo::where('token',$token)->first();
			if($Dietinfo){
				$UserInfo['user_name']  = $Dietinfo['name'];
				$UserInfo['user_img']   = $Dietinfo['mgpic'];
				$UserInfo['type']  		= $Users['type'];
				$UserInfo['subscribe']  = $Users['subscribe'];
			}else{
				$UserInfo = UserInfo::where('token',$token)->select('user_name','user_img')->first();
				$UserInfo['type']  = $Users['type'];
				$UserInfo['subscribe']  = $Users['subscribe'];
			}
		}else{
			$UserInfo = array('code'=>'5','msg'=>'网络错误');
		}
		
		//获取会员收益
		$UserEarningsThe = UserEarningsThe::where('token',$token)->first();
		//判断yprice是否为空
		if($UserEarningsThe['price']){
			$UserInfo['shengprice'] = ($UserEarningsThe['price'] - $UserEarningsThe['yprice'])/100;
			$UserInfo['totalprice'] = $UserEarningsThe['price']/100;
			$UserInfo['tiprice'] 	= $UserEarningsThe['yprice']/100;
		}else{
			$UserInfo['shengprice'] = 0;
			$UserInfo['totalprice'] = 0;
			$UserInfo['tiprice'] 	= 0;
		}
	

		return $this->result($UserInfo);	
	}

	#用户个人中心new
	public function usersNews(Request $request)
	{
		/*Users;
		UserInfo;*/
		if($this->verCode($request->all(),[
			'token'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
		$token  = $request->input('token');

		$Users = Users::where('token',$token)->first();
		if(!$Users){
			$UserInfo = array('code'=>'5','msg'=>'网络错误');
		}
		return $this->result($Users);

	}


	#营养师个人中心new
	public function dietsNews(Request $request)
	{
		/*Dietinfo*/
	}






	#个人中心 修改头像
	public function userimg(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'=>'required',
			'user_img'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}

		$token  = $request->input('token');
		$user_img  = $request->input('user_img');
		
		$Dietinfo = Dietinfo::where('token',$token)->first();
		if($Dietinfo){
			$Dietinfo->mgpic = $user_img;
			if($Dietinfo->save()){
					$AskList = AskList::where('dietitian',$Dietinfo['dietitian'])->get();
					foreach ($AskList as $key => $value) {
						$value->dietitian_img = $user_img;
						$value->save();
					}	
					$Askconslist = Askconslist::where('dietitian',$Dietinfo['dietitian'])->get();
					foreach ($Askconslist as $keys => $values) {
						$values->dimg = $user_img;
						$values->save();
					}
					$Quanarticle = Quanarticle::where('token',$Dietinfo['token'])->get();
					foreach ($Quanarticle as $keys => $values) {
						$values->user_img = $user_img;
						$values->save();
					}

					$returns = [];
				}else{
					$returns = array('code'=>'5','msg'=>'网络错误');
				}
		}else{
			#不是营养师修改用户头像
			$UserInfo = UserInfo::where('token',$token)->first();
			$UserInfo->user_img = $user_img;			
			if( $UserInfo->save() ){
				$AskList = AskList::where('token',$token)->get();
					foreach ($AskList as $key => $value){
						$value->token_img = $user_img;
						$value->save();
					}	
					$Askconslist = Askconslist::where('token',$token)->get();
					foreach ($Askconslist as $keys => $values) {
						$values->timg = $user_img;
						$values->save();
					}
					$Quanarticle = Quanarticle::where('token',$token)->get();
					foreach ($Quanarticle as $keys => $values) {
						$values->user_img = $user_img;
						$values->save();
					}
				$returns = [];
			}else{
				$returns = array('code'=>'5','msg'=>'网络错误');
			}
		}
		return $this->result($returns);	
	}


	#个人中心
	public function usernews(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}

		$token  = $request->input('token');

		$Dietinfo = Dietinfo::where('token',$token)->first();
		if($Dietinfo){
			#用户收益-营养师
			$UserEarningsThe = UserEarningsThe::where('token',$token)->first();
			$Models['userthe'] = ( $UserEarningsThe['price'] - $UserEarningsThe['yprice'] )/100;
		}else{
			$UserInfo = UserInfo::where('token',$token)->first();
			if($UserInfo){
				#用户收益-用户
				$UserEarningsThe = UserEarningsThe::where('token',$token)->first();
				$Models['userthe'] = ( $UserEarningsThe['price'] - $UserEarningsThe['yprice'] )/100;
			}else{
				$Models = array();
			}
		}
		
		

		return $this->result($Models);

	}


	#用户意见反馈
	public function tickling(Request $request){
		if($this->verCode($request->all(),[
			'token'=>'required',
			'desc'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
		$tickling=new UsersTickling;
		$tickling->token=$request->input('token');
		$tickling->desc = $request->input('desc');
		$tickling->ctime = time();
		$returns=$tickling->save()?[]:array('code'=>'5','msg'=>'网络错误');
		return $this->result($returns);	
	}


	#提现申请
	public function withdrawal(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'=>'required',
			'price'=>'required',
			'tname'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}

		$token=$request->input('token');
		$tname=$request->input('tname');
		$price=(int)$request->input('price')*100;


		if($price>=1000){
			$UserEarningsThe = UserEarningsThe::where('token',$token)->first();
			$yprice = $UserEarningsThe['price']-$UserEarningsThe['yprice'];
			if($price>$yprice){
				return $this->result(array('code'=>'1','msg'=>'超出可提现金额'));exit;
			}

			$UserInfo = UserInfo::where('token',$token)->first();
			if(!$UserInfo){
				return $this->result(array('code'=>'1','msg'=>'非法用户。。。'));exit;
			}

			$withdrawalModels = Userwithdrawal::where('token',$token)->where('status',2)->first();
			if($withdrawalModels){
				return $this->result(array('code'=>'1','msg'=>'提现处理中。。。'));exit;
			}

			$withdrawalModele = Userwithdrawal::where('token',$token)->where('status',1)->first();
			if($withdrawalModele){
				return $this->result(array('code'=>'1','msg'=>'提现申请中。。。'));exit;
			}	

			$Userwithdrawal = new Userwithdrawal();
			$Userwithdrawal->token = $token;
			$Userwithdrawal->tname = $tname;
			$Userwithdrawal->price = $price;
			$Userwithdrawal->ctime = time();
			$Userwithdrawal->status = 1;
			$Userwithdrawal->type = 1;//营养师提现
			$UserEarningsThe = UserEarningsThe::where('token',$token)->first();
			$UserEarningsThe->yprice = $UserEarningsThe->yprice+$price;			
			if($UserEarningsThe->save()){
				$returns = $Userwithdrawal->save()?array('code'=>'1','msg'=>'提现成功'):array('code'=>'5','msg'=>'网络错误');
			}else{
				$returns = array('code'=>'5','msg'=>'网络错误');
			}
			return $this->result($returns);	exit;
		}else{
			return $this->result(array('code'=>'5','msg'=>'请输入可提现金额'));	exit;
		}
	}


	#佣金提现
	public function commmwithdrawal(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'=>'required',
			'price'=>'required',
			'tname'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}

		$token=$request->input('token');
		$tname=$request->input('tname');
		$price=(int)$request->input('price')*100;


		if($price>=1000){
			$CommissionThe = CommissionThe::where('token',$token)->first();
			$yprice = $CommissionThe['price']-$CommissionThe['yprice'];
			if($price>$yprice){
				return $this->result(array('code'=>'1','msg'=>'超出可提现金额'));exit;
			}

			$UserInfo = UserInfo::where('token',$token)->first();
			if(!$UserInfo){
				return $this->result(array('code'=>'1','msg'=>'非法用户。。。'));exit;
			}

			$withdrawalModels = Userwithdrawal::where('token',$token)->where('tname',$tname)->where('status',2)->first();
			if($withdrawalModels){
				return $this->result(array('code'=>'1','msg'=>'提现处理中。。。'));	exit;
			}

			$withdrawalModele = Userwithdrawal::where('token',$token)->where('tname',$tname)->where('status',1)->first();
			if($withdrawalModele){
				return $this->result(array('code'=>'1','msg'=>'提现申请中。。。'));	exit;
			}	

			$Userwithdrawal = new Userwithdrawal();
			$Userwithdrawal->token = $token;
			$Userwithdrawal->tname = $tname;
			$Userwithdrawal->price = $price;
			$Userwithdrawal->ctime = time();
			$Userwithdrawal->status = 1;
			$Userwithdrawal->type = 2;
			$CommissionThe = CommissionThe::where('token',$token)->first();
			$CommissionThe->yprice = $CommissionThe->yprice+$price;			
			if($CommissionThe->save()){
				$returns = $Userwithdrawal->save()?array('code'=>'1','msg'=>'提现成功'):array('code'=>'5','msg'=>'网络错误');
			}else{
				$returns = array('code'=>'5','msg'=>'网络错误');
			}
			return $this->result($returns);	exit;
		}else{
			return $this->result(array('code'=>'5','msg'=>'请输入可提现金额'));	exit;
		}
	}

	//我是代言人
	public function spokesmanCode(Request $request) {
        if($this->verCode($request->all(),[
            'token'=>'required',
        ]))
        {
            return $this->publicparaResponse();
        }
        $token = $request->input('token');
        $count = UserSpokesmanMapping::where('token', $token)->count();//求总数
        $returns = Users::where('token',$token)->select('spokesman_code')->select('id')->first();
        if(!$returns->spokesman_code) {
            $locationUrl = 'http://wx.shoumeikeji.cn/diet/index.html?ftoken='.$token;
            $fileName = 'qrcodes/'.$returns->id.'.png';
            QrCode::format('png')->size(200)->margin(0)->generate($locationUrl, public_path($fileName));
            $returns->spokesman_code = $fileName;
            $returns->save();
        }


        if(!$returns){
            $returns = array('code'=>'5','msg'=>'网络错误');
        }
        $CommissionThe = CommissionThe::where('token',$token)->first();
        $UserInfo = UserInfo::where('token',$token)->first();
        if(!$UserInfo){
			$returns = array('code'=>'5','msg'=>'网络错误');
        }
       	$returns->price = !empty($CommissionThe)?$CommissionThe['price']/100:'';
       	$returns->yprice = !empty($CommissionThe)?($CommissionThe['price']-$CommissionThe['yprice'])/100:'';
        $returns->user_name = $UserInfo->user_name;
        $returns->user_img  = $UserInfo->user_img;
        $returns->user_count = $count;
        return $this->result($returns);
    }

  //   //微信生成二维码
    public function makecode(Request $request){
    	$token = $request->input('token');
      
       // $sence = 'http://wx.shoumeikeji.cn/diet/index.html?ftoken='.$token;
    	$sence ='123';
        $jssdk = new actionjssdk();
        $astoken = $jssdk->getToken();
   
        $returns = Users::where('token',$token)->select('id','openid','spokesman_code')->first();
        // if(!$returns['ticket']){
        	      // $utoken=$request->input('token');#用户标识#
	        $url="https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=".$astoken;
	 //        //永久二维码
	        // $data='{"action_name": "QR_LIMIT_SCENE", "action_info": {"scene": {"scene_id":'.$sence.'}}}';
	 //        //临时二维码
	         $time=24*60*60;
	  		$data='{"expire_seconds":'.$time.', "action_name": "QR_SCENE", "action_info": {"scene": {"scene_id":'.$sence.'}}}';

	       $json=$this->curl->post($url,$data);
	       $jsonarr=json_decode($json,true);
	 //       if(!$jsonarr['ticket']){
	 //       	 return $this->result(['code' => 5, 'msg' => '二维码生成失败!']);
	 //       }

		   $ticket=$jsonarr["ticket"];
		//    $returns->ticket=$ticket;
		//    $returns->save();
        // }
        // else{
        //    $ticket=$returns['ticket'];
        // }
        $ul="https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=".urlencode($ticket);
  //       // $ul = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGs8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeDMtMDhXX2xibV8xc1l2bDFwMXQAAgS8jVRZAwSAUQEA";
     	$old =imagecreatefromjpeg($ul);//二维码
        $new="http://api.shoumeikeji.cn/qrcodes/back.jpg";
        $newold =imagecreatefromjpeg($new);//背景

        $dst = ImageCreateTrueColor(156,156); // 获取新图
        imagecopyresampled($dst,$old,0, 0, 0, 0, 156, 156, 430, 430);//缩小
        imagecopy($newold,$dst, 457, 830, 0, 0, 156, 156);    //水印位置
        imagedestroy($dst);

        $UserInfo = UserInfo::where('token',$token)->first();
        $uname = $UserInfo->user_name;
        $user_img = $UserInfo->user_img;
        $json=$this->curl->get($user_img);
        $uimg=imagecreatefromstring($json);

        $width  = imagesx($uimg);//logo图片宽度
     	$height = imagesy($uimg);//logo图片高度
     	$imgsize=getimagesize($user_img);
        $uback  = ImageCreateTrueColor(86,86); // 获取新图
        imagecopyresampled($uback,$uimg,0,0,0,0,86,86,$width,$height);
        imagecopy($newold,$uback,31,840, 0, 0, 86, 86);    //水印位置
        imagedestroy($uback);

        $im=imagecreatetruecolor(400,30);
        $white = imagecolorallocate($im, 255, 255, 255);//白色
        $grey = imagecolorallocate($im, 128, 128, 128);//灰色
		$text =  $uname;
		$font = '/home/www/api/public/fonts/msyh.ttc';
        imagettftext($newold, 18, 0, 123, 870, $white,$font,$text);
      
        $openid=$returns ->openid;
        $filename='qrcodes/'.$returns->id.'.jpg';
    	// header('Content-Type: image/jpeg');
    	imagejpeg($newold,$filename);

        
        $url2="https://api.weixin.qq.com/cgi-bin/media/upload?access_token=$astoken&type=image";
        $data2="/home/www/api/public/".$filename;
  
        $curl = curl_init();
        if (class_exists('\CURLFile')) {// 这里用特性检测判断php版本
            curl_setopt($curl, CURLOPT_SAFE_UPLOAD, true);
               $data = array('media' => new \CURLFile($data2));//>=5.5
               // echo 1;
        } else {
            if (defined('CURLOPT_SAFE_UPLOAD')) {
                curl_setopt($curl, CURLOPT_SAFE_UPLOAD, false);
            }
            $data = array('media' => '@' . $data2);//<=5.5
            // echo 2;
        }
        
        curl_setopt($curl, CURLOPT_URL, $url2);
        curl_setopt($curl, CURLOPT_POST, 1 );
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_USERAGENT,"TEST");
        $result = curl_exec($curl);
        $error = curl_error($curl);
        curl_close($curl);
        // echo $result;
        $jsonarr=json_decode($result,true);

        var_dump($jsonarr['media_id']);
        echo $error;
       
        $url3="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
    
        $data3='{
		    "touser":"'.$openid.'",
		    "msgtype":"image",
		    "image":
		    {
		      "media_id":"'.$jsonarr['media_id'].'"
		    }
		}';
        $json3=$this->curl->post($url3,$data3);
        // // echo $json2;
        $arr3=json_decode($json3,true);
        if($arr3['errcode']==0){
        	 $returns=[];
        }else{
        	$returns=$arr3['errcode'];	
        }
       
   	  // }
   	   return $returns;


        //上传永久图片素材
        // $jssdk = new actionjssdk();
        // $astoken = $jssdk->getToken();
        //  $url2="https://api.weixin.qq.com/cgi-bin/media/upload?access_token=$astoken&type=image";
        // $data2="/home/www/api/public/qrcodes/11111.jpg";
  
        // $curl = curl_init();
        // if (class_exists('\CURLFile')) {// 这里用特性检测判断php版本
        //     curl_setopt($curl, CURLOPT_SAFE_UPLOAD, true);
        //        $data = array('media' => new \CURLFile($data2));//>=5.5
        //        // echo 1;
        // } else {
        //     if (defined('CURLOPT_SAFE_UPLOAD')) {
        //         curl_setopt($curl, CURLOPT_SAFE_UPLOAD, false);
        //     }
        //     $data = array('media' => '@' . $data2);//<=5.5
        //     // echo 2;
        // }
        
        // curl_setopt($curl, CURLOPT_URL, $url2);
        // curl_setopt($curl, CURLOPT_POST, 1 );
        // curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        // curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        // curl_setopt($curl, CURLOPT_USERAGENT,"TEST");
        // $result = curl_exec($curl);
        // $error = curl_error($curl);
        // curl_close($curl);
        // $jsonarr=json_decode($result,true);
        // var_dump($jsonarr);   


        //生成永久二维码
        // $jssdk = new actionjssdk();
        // $astoken = $jssdk->getToken();
        // $sence ='yongjiuerweima';
    }


    #推送二维码海报
    public function sendCode(Request $request) {
        if($this->verCode($request->all(),[
            'token'=>'required',
        ]))
        {
            return $this->publicparaResponse();
        }
        $token = $request->input('token');
         $jssdk = new actionjssdk();
        $astoken = $jssdk->getToken();
     
        $returns = Users::where('token',$token)->select('id','spokesman_code','openid')->first();
         if(!$returns){
            $returns = array('code'=>'5','msg'=>'网络错误');
        }
        if(!$returns->spokesman_code) {
            $locationUrl = 'http://wx.shoumeikeji.cn/diet/index.html?ftoken='.$token;
            $fileName = 'qrcodes/'.$returns->id.'.png';
            QrCode::format('png')->size(200)->margin(0)->generate($locationUrl, public_path($fileName));
            $returns->spokesman_code = $fileName;
            if( $returns->save()){
            	$ewm="http://api.shoumeikeji.cn/".$fileName;
            }
        }else{
        	$ewm= "http://api.shoumeikeji.cn/".$returns['spokesman_code'];
        }
        $old=imagecreatefrompng($ewm);
        $new="http://api.shoumeikeji.cn/qrcodes/back.jpg";
        $newold =imagecreatefromjpeg($new);//背景

        $dst = ImageCreateTrueColor(156,156); // 获取新图
        imagecopyresampled($dst,$old,0, 0, 0, 0, 156, 156, 200, 200);//缩小
        imagecopy($newold,$dst, 457, 830, 0, 0, 156, 156);    //水印位置
        imagedestroy($dst);

        $UserInfo = UserInfo::where('token',$token)->first();
        $uname = $UserInfo->user_name;
        $user_img = $UserInfo->user_img;

        $json=$this->curl->get($user_img);
        $uimg=imagecreatefromstring($json);
     	$width  = imagesx($uimg);//logo图片宽度
     	$height = imagesy($uimg);//logo图片高度
        $uback = ImageCreateTrueColor(86,86); // 获取新图
        imagecopyresampled($uback,$uimg,0,0,0,0,86,86,$width,$height);
        imagecopy($newold,$uback,31,840, 0, 0, 86, 86);    //水印位置
        imagedestroy($uback);

        $im=imagecreatetruecolor(400,30);
        $white = imagecolorallocate($im, 255, 255, 255);//白色
        $grey = imagecolorallocate($im, 128, 128, 128);//灰色
		$text =  $uname;
		$font = '/home/www/api/public/fonts/msyh.ttc';
        imagettftext($newold, 18, 0, 123, 870, $white,$font,$text);
      
        $openid=$returns ->openid;
        $filename='qrcodes/'.$returns->id.'.jpg';
    	imagejpeg($newold,$filename);
  
        $url2="https://api.weixin.qq.com/cgi-bin/media/upload?access_token=$astoken&type=image";
        $data2="/home/www/api/public/".$filename;
  
        $curl = curl_init();
        if (class_exists('\CURLFile')) {// 这里用特性检测判断php版本
            curl_setopt($curl, CURLOPT_SAFE_UPLOAD, true);
               $data = array('media' => new \CURLFile($data2));//>=5.5
             
        } else {
            if (defined('CURLOPT_SAFE_UPLOAD')) {
                curl_setopt($curl, CURLOPT_SAFE_UPLOAD, false);
            }
            $data = array('media' => '@' . $data2);//<=5.5
          
        }
        
        curl_setopt($curl, CURLOPT_URL, $url2);
        curl_setopt($curl, CURLOPT_POST, 1 );
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_USERAGENT,"TEST");
        $result = curl_exec($curl);
        $error = curl_error($curl);
        curl_close($curl);

        $jsonarr=json_decode($result,true);
       
        $url3="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$astoken;
        $data3='{
		    "touser":"'.$openid.'",
		    "msgtype":"image",
		    "image":
		    {
		      "media_id":"'.$jsonarr['media_id'].'"
		    }
		}';
        $json3=$this->curl->post($url3,$data3);
        // // echo $json2;
        $arr3=json_decode($json3,true);
        if($arr3['errcode']==0){
        	$returns=[];
        }else{
        	$returns=array('code'=>5,'msg'=>$arr3['errcode']);	
        }
       	
   	    return $this->result($returns);
       //  $new="http://api.shoumeikeji.cn/qrcodes/back.jpg";
       //   $dst = ImageCreateTrueColor(150,150); // 获取新图
       //   $ewmold =imagecreatefrompng($ewm);
       //     $newold =imagecreatefrompng($new);
       // // imagecopyresampled($dst, $ewmold, 0, 0, 0, 0, 150, 150, 100, 100);

       //  imagecopy($newold,$ewmold, 0, 0, 0, 0, 100, 100);    //水印位置
       //  // $UserInfo = UserInfo::where('token',$token)->first();
       //  // // $returns->user_name = $UserInfo->user_name;
       //  // $returns->user_img = $UserInfo->user_img;
       //  imagejpeg($newold,"qrcodes/3.jpg");
       //  echo '<img src="http://api.shoumeikeji.cn/qrcodes/3.jpg" >';
       //  // return $this->result(imagejpeg($qrcode_thumb));
    }


    //代言人绑定
    public function bindSpokesman(Request $request) {
	file_put_contents('/tmp/token_debug.log', var_export($request->all(), true), FILE_APPEND);
        if($this->verCode($request->all(),[
            'token'=>'required',
            'bindToken'=>'required',
        ]))
        {
            return $this->publicparaResponse();
        }

        $token = $request->input('token');
        $bindToken = $request->input('bindToken');
        if($token == $bindToken) {
            return $this->result(['code' => 1, 'msg' => '不能给自己代言哦!']);
        }
        $currentUser = Users::where('token',$token)->select('id')->first();
        if(!$currentUser){
            return $this->result(['code' => 1, 'msg' => '用户不存在!']);
        }
        $bindUser = Users::where('token',$bindToken)->select('id')->first();
        if(!$bindUser){
            return $this->result(['code' => 1, 'msg' => '被绑定用户不存在!']);
        }
        $mappingInfo = UserSpokesmanMapping::where('bind_token', $token)->where('level', 1)->select()->first();
        if($mappingInfo) {
            return $this->result(['code' => 1, 'msg' => '您已经绑定过她了!']);
        }
        $bindInfo = UserSpokesmanMapping::where('bind_token', $bindToken)->where('level', 1)->select('token')->first();

        if($bindInfo && !UserSpokesmanMapping::where('token', $bindInfo->token)->where('bind_token', $token)->select('token')->first()) {
            $mappingModel = new UserSpokesmanMapping();
            $mappingModel->token = $bindInfo->token;
            $mappingModel->bind_token = $token;
            $mappingModel->level = 2;
            $mappingModel->ctime =  time();
            $levelTwoRst = $mappingModel->save();
            if(!$levelTwoRst) {
                return $this->result(['code' => 5, 'msg' => '绑定失败!']);
            }
        }
        $mappingModel = new UserSpokesmanMapping();
        $mappingModel->token = $bindToken;
        $mappingModel->bind_token = $token;
        $mappingModel->level = 1;
        $mappingModel->ctime =  time();
        $levelOne = $mappingModel->save();
        if(!$levelOne) {
            $this->result(['code' => 5, 'msg' => '绑定失败!']);
        }
        return $this->result(['code' => 1, 'msg' => '绑定成功!']);
    }


    //我的下级spokesman 列表
    public function spokesmanUsers(Request $request) {
        if($this->verCode($request->all(),[
            'token'=>'required',
        ]))
        {
            return $this->publicparaResponse();
        }
        $token = $request->input('token');
        #接参
        $page 		= $request->input('page');
        $pageSize	= $request->input('pageSize');
        $page     = empty($page)     ? 1 : $page;
        $take     = empty($pageSize) ? 100 : $pageSize;
        $skip     = ($page - 1) * $take;

        $count = UserSpokesmanMapping::where('token', $token)->count();//求总数
        $list  = UserSpokesmanMapping::skip($skip)->take($take)->where('token', $token)->select()->orderBy('ctime', 'desc')->get();
        //无数据
        if ($list->toArray() == null) {
            return $this->result(array('list'=> ''));
        }
        $where = array_column($list->toArray(),'bind_token');
        $user_info = UserInfo::whereIn('token', $where)
            ->select('user_img', 'token', 'user_name')->get();
        $user_info = array_column($user_info->toArray(),Null,'token');

        foreach ($list as $key => $value) {
            $user['id'] = $value['id'];
            if( in_array($value['bind_token'],array_keys($user_info) ) ){
                $user['user_name'] = $user_info[$value['bind_token']] ? $user_info[$value['bind_token']]['user_name'] : "";
                $user['user_img']  = $user_info[$value['bind_token']] ? $user_info[$value['bind_token']]['user_img'] : "";
            }else{
                $user['user_name'] = "";
                $user['user_img']  = "";
            }
            $user['create_time'] = date('Y-m-d H:i:s', $value['ctime']);
            $users[] = $user;
        }

        $returns = $list ?array('list'=> $users,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
        return $this->result($returns);
    }




}
