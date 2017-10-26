<?php
namespace App\Http;

use Crypt;
use Validator;

class BaseController extends Controller
{

	/*
	|--------------------------------------------------------------------------
	| Base Controller
	|--------------------------------------------------------------------------
	|	错误返回由需要添加
		错误码统一写responseCode 中，状态由注释添加
	|
	*/

// 响应状态
  protected $responseCode = 1;  # 1正确处理 2 退出登录 3 需要登录 4 请求数据错误 5 server端错误 0后端正确处理
  # 响应信息
  protected $responseMsg = 'SUCCESS';
  # 响应错误信息
  protected $responseErrors = [];
  # 响应应用数据
  protected $responseContent = [];

  # 版本信息
  protected $responseVersion = '1.0';
  
  # 数据量／分页
  protected $responseCount = 0;
	/**
   * 公共返回参数
   *
   * @return array
   */
  protected function publicResponse()
  {
    $data = [
      'code'    => $this->responseCode,
      'version' => $this->responseVersion,
      'msg'     => $this->responseMsg,
      'errors'  => $this->responseErrors,
      'content' => $this->responseContent,
    ];
    return response()->json($data);
  }
  /**
   * 需要登录
   *
   * @return json
   */
  protected function publicloginResponse()
  {

    $this->responseCode   = 3;
    $this->responseMsg    = 'FAIL';
    return $this->publicResponse();
  }

  /**
   * 请求数据错误
   *
   * @return json
   */
  protected function publicparaResponse()
  {

    $this->responseCode   = 4;
    $this->responseMsg    = 'FAIL';
    $this->responseErrors ='缺少必要参数';
    return $this->publicResponse();
  }

  /**
   * 服务端网络错误
   *
   * @return json
   */
  protected function publicnetResponse()
  {


    $this->responseCode = 5;
    $this->responseMsg  = 'FAIL';
    return $this->publicResponse();
  }

   /**
   * 逻辑返回
   *
   * @return json
   */
  public function result($r,$version=null)
  {

      if(is_array($r)&&isset($r['code']))
      {
        $this->responseCode=(int)$r['code'];
        $this->responseMsg = 'FAIL';
        $this->responseErrors=$r['msg'];
      }
      else
      {
        $this->responseContent=$r;
      }
      return $this->publicResponse();

  }
  /**
   * 验证
   *
   * @return json
   */
   protected function verCode($request,$array)
  {

      $validator = Validator::make($request, $array);
      return $validator->fails();
  }
  

  
  protected function resmsg($res)
  {
    switch ($res['status']) {
      case 'success':
          if (isset($res['content'])) {
            $this->responseContent = $res['content'];
          }
          return $this->publicResponse();
        break;

      case 'fail':
          $this->responseErrors = $res['msg'];
          $this->responseCode = '4';
          return $this->publicResponse();
        break;

    }
  }




  /**
   * 公共返回参数
   *
   * @return array
   */
  protected function publicResponseAdmin()
  {
    $data = [
      'code'    => $this->responseCode,
      'msg'     => $this->responseMsg,
      'list'    => $this->responseContent,
      'count'   => $this->responseCount,
    ];
    return response()->json($data);
  }


  /**
   * 逻辑返回
   *
   * @return json
   */
  public function resultAdmin($r)
  {

    switch ($r['status']) {
      case 'success':
          if (isset($r['list'])) {
            $this->responseCode = 0;
            $this->responseContent = $r['list'];
            $this->responseCount = $r['count'];
          }
          return $this->publicResponseAdmin();
        break;

      case 'fail':
          $this->responseErrors = $r['msg'];
          $this->responseCode = 4;
          $this->responseCount= 0;

          return $this->publicResponseAdmin();
        break;
    }
    return $this->publicResponseAdmin();
  }


  protected function retvali($request,$array) {

    $validator = Validator::make($request, $array);

    if ($validator->fails()) {

      $messages = $validator->errors();
      $this->responseErrors = $messages->toArray();

      return $this->publicparaResponse();
    }

  }
}
