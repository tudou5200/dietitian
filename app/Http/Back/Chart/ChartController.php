<?php
namespace App\Http\Back\Chart;
use App\Http\BaseController;
use Illuminate\Http\Request;
use Validator;
use App\Models\AskList;
use App\Services\rongyun\ServerAPI;


class ChartController extends BaseController
{
	

    public function doLogin(Request $Request)
    {
    	$param=$Request->input();
        // $param = input('param.');

        if( '张三' == $param['uname'] ){
        	$array=array('uid'=>1,'uname'=>'张三','token'=>$param['token']);
        }else if( '李四' == $param['uname']){
  			$array=array('uid'=>2,'uname'=>'李四','token'=>$param['token']);
        }
        return $this->result($array);	
    }




	 //   public function _initialize()
  //   {
		// //
  //       if( cookie('uid')  ){
  //           //echo 1;die;
  //       }else{
		// 	$this->redirect( url('login/index') );
		// }
  //   }

    
    //聊天主方法
    public function index(Request $Request)
    {
    	$p=$Request->input();
        // $appKey = config('APP_KEY');
        // $appSecret = config('APP_SECRET');
    	$appKey = "e0x9wycfxxx5q";
        $appSecret ='F7sI8rkLtv';
        $rongYun = new ServerAPI( $appKey, $appSecret );

        $tx = "http://api.shoumeikeji.cn/picture/14958749676742.jpg";
        if( 2 == $p['uid'] ){
            $tx = "http://api.shoumeikeji.cn/picture/14958754402615.jpg";
        }
        if($p['uid']==1){
        	$uname='张三';
        }else{
        	$uname='李四';
        }
        $token = $rongYun->getToken($p['uid'], $uname, $tx);

        $token = json_decode($token,true)['token'];
       $array=array('token'=>$token);
         return $this->result($array);	
    }

    //所有的用户信息
    public function userInfo()
    {
        $return['userlist'] = [
            ['id' => 1, 'name' => '张三', 'portraitUri' => 'http://api.shoumeikeji.cn/picture/14958749676742.jpg'],
            ['id' => 2, 'name' => '李四', 'portraitUri' => 'http://api.shoumeikeji.cn/picture/14958754402615.jpg']
        ];
        return $this->result($return);
    }

    //登录用户信息
    public function onLine()
    {
        $return['data'] = [
            ['id' => '1', 'status' => true],
            ['id' => '2', 'status' => true]
        ];
        return $this->result($return);
    }




}	