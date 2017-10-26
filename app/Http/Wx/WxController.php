<?php
namespace App\Http\Wx;

use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Helpers\Wx;
use App\Models\Users;
use App\Models\UserInfo;

class WxController extends BaseController 
{

    private $wx;

    public function __construct()
    {
      $this->wx=new Wx();
    } 



     // 过滤掉emoji表情 
    public  function filterEmoji($str) 
    { 
     $str = preg_replace_callback( 
       '/./u', 
       function (array $match) { 
        return strlen($match[0]) >= 4 ? '' : $match[0]; 
       }, 
       $str); 
      
      return $str; 
     } 



    public function code(Request $request)
    {
        if($this->verCode($request->all(),[
          'url'=>'required|url'
          ]))
        { 
          return $this->publicparaResponse();
        }   

        return $this->result($this->wx->codeurl($request->input('url')));
    }
    public function info(Request $request)
    {
        if($this->verCode($request->all(),[
          'code'=>'required'
          ]))
        { 
          return $this->publicparaResponse();
        }   

        $msg=false;
        $res = $this->wx->getToken($request->input('code'),$msg);
        if($msg)
        {
          return array(
              'code'=>5,
              'msg'=>'网络错误，请刷新后重试'
              );
        }



        //获取用户信息
        do
        { 
          $msg=false;
          $res = $this->wx->getInfo($res['access_token'],$res['openid'],$msg);

        }while($msg); 

        $user=Users::where('openid',$res['openid'])->first();
        if(!$user)
        {
          $token = sha1($res['openid']); 

          $Userinfo = new UserInfo();
          $Userinfo->token=$token;
          // $Userinfo->user_name=$this->filterEmoji($res['nickname']);
          $Userinfo->user_name=$res['nickname'];
          $Userinfo->user_img=$res['headimgurl'];
          $Userinfo->ctime=time();
          
          if($Userinfo->save()){
              $user=new Users();  
              $user->openid=$res['openid'];
              $user->token=$token;
              $user->type=1;
              $user->save();
          }
        }else{

          $token = sha1($res['openid']); 
          $uinfo=UserInfo::where('token',$token)->first();
          if($user->type==3){//营养师
            if($uinfo->user_name!=$res['nickname']){
              $uinfo->user_name=$res['nickname'];
            }
            if($uinfo->user_img!=$res['headimgurl']){
              $uinfo->user_img=$res['headimgurl'];
            }
          }elseif($user->type==1||$user->type==2){
            if($uinfo->user_name!=$res['nickname']){
              $uinfo->user_name=$res['nickname'];
            }
            $imgarr=explode('.', $uinfo->user_img);
            $count=count($imgarr)-1;
            if($imgarr[$count]!="jpg"){
              if($uinfo->user_img!=$res['headimgurl']){
              $uinfo->user_img=$res['headimgurl'];
              }
            }
          } 
        }
        $uinfo->save();
        $r=array(
            'token'=>$user->token,
            'type'=>$user->type,
            'nickname'=>$res['nickname'],
            'headimgurl'=>$res['headimgurl'],
            );
        return $this->result($r);
    }


  
}