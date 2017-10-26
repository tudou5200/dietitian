<?php
namespace App\Http\Front\Personal;
use App\Http\BaseController;
use App\Services\Tool\SMS\SendTemplateSMS;#短信类
// use App\Services\Front\SMS\SendTemplateSMS;#短信类语音
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\UserCode;
use App\Models\UserInfo;
use App\Models\Category;

class PersonalController extends BaseController
{
	#会员  生成验证码发送短信
	public function Apply(Request $request)
	{	
		session_start();
		if($this->verCode($request->all(),[			
			'mobile'=>'required',
		])){
			return $this->publicparaResponse();
		}

			$mobile  = $request->input('mobile');	//获取手机号
			
			#生成随机验证码
			$mobile_code = '';
			$charser = '4321560987';
			$_len = strlen($charser) - 1;
			for ($i=0; $i < 6; ++$i) { 
				$mobile_code .= $charser[mt_rand(0,$_len)];
			}

			$UserCodeModel = UserCode::where('mobile',$mobile)->first();
			if(!$UserCodeModel){
				$UserCodeModel  = New UserCode();
			}
			$UserCodeModel->mobile = $mobile;
			$UserCodeModel->code = $mobile_code;
			$UserCodeModel->time = time()+60*60*24;
			$returns=$UserCodeModel->save()?[]:array('code'=>'5','msg'=>'网络错误');
			
			$SendTemplateSMS = new SendTemplateSMS();
				//短信接口地址
				$target = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
				
				if(empty($mobile)){
					
					$gets  = array('code'=>5,'msg'=>'手机号码不能为空');
				}
				//防用户恶意请求
				if(empty($_SESSION['send_code']) or $send_code!=$_SESSION['send_code']){
					$gets  = array('code'=>5,'msg'=>'请求超时，请刷新页面后重试');
					
				}

				$post_data = "account=54044399&password=eb2a9a410a34035e94621a95c4b12281&mobile=".$mobile."&content=".
				rawurlencode("您的验证码是：".$mobile_code."。请不要把验证码泄露给其他人。");
				//用户名请登录用户中心->验证码、通知短信->帐户及签名设置->APIID
				//查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
				$gets =  $SendTemplateSMS->xml_to_array($SendTemplateSMS->Post($post_data, $target));
				if($gets['SubmitResult']['code']==2){
					$_SESSION['mobile'] = $mobile;
					$_SESSION['mobile_code'] = $mobile_code;
				}

			return $this->result($gets);
	}


	#验证手机验证码
	public function Contrast(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'=>'required',
			'code'=>'required',
			'mobile'=>'required',
		])){
			return $this->publicparaResponse();
		}
		$input = $request->input();
		$UserCodeModel = UserCode::where('mobile',$input['mobile'])->first();
		if(!$UserCodeModel){
			$return = array('code'=>'5','msg'=>'验证码获取失败');
		}
		$time = time();
		if($UserCodeModel['time'] > $time){
			if($UserCodeModel['code'] == $input['code']){
				$UsersModel = Users::where('token',$input['token'])->first();
				$UsersModel->mobile = $UserCodeModel['mobile'];
				$UsersModel->type   = 2;
				$return=$UsersModel->save()?[]:array('code'=>'5','msg'=>'网络错误');
			}else{
				$return = array('code'=>'5','msg'=>'验证码错误');
			}
		}else{
			$return = array('code'=>'5','msg'=>'验证码失效');
		}
		return $this->result($return);
	}


}