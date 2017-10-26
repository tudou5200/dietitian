<?php
/**
	*@author leishangjie 2016-11-1
	*@version 1.0
	*@brief 图片上传
**/
namespace App\Http\Sys;

use App\Http\BaseController;
use App\Services\Sys\Img;
use Illuminate\Http\Request;
use App\Services\Fire;
class UpController extends BaseController
{	
	public function test(Request $request)
	{


		$f=new Fire();
		$r=$f->index();

	}
	public function ueditor()
	{
		return require(app_path('Library/ueditor/php/controller.php'));
	}
	
	public function upImg(Request $request)
	{
		$type = trim($request->input('type'));

		$type=empty($type)?0:$type;

		$f=new Img();
		$key=array_keys($_FILES);
		$r=$f->index($key[0],$type);
		return $this->result($r);
	}
}

