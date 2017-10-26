<?php
/**
    *@author leishangjie 2016-11-16
    *@version 2.0
    *@brief  图片上传
**/
namespace App\Services\Sys;

use App\Services\BaseService;
use Illuminate\Support\Facades\Input;

class Img extends BaseService
{
	//fieled：图片name
	public function index($field,$type)
	{
		$file=Input::file($field);

		$path=config('img.path');

		switch (false)
		{
			case $file:
				$r=array(
					'code'=>'6',
					'msg'=>'未上传图片',
						);
					break;
			case $file->isValid():
				$r=array(
					'code'=>'6',
					'msg'=>'未上传图片',
					);
				break;
			case $file->getSize()<=config('img.size'):
				$r=array(
					'code'=>'5',
					'msg'=>'上传图片过大',

					);
				break;
			case in_array($file->getClientOriginalExtension(),config('img.type')):
				$r=array(
					'code'=>'5',
					'msg'=>'图片类型上传错误',
					);
				break;
			case $type == 0:
				list($width,$height,$type,$attr)=getimagesize($file);

				if(intval($width)*$path[$type][2] == intval($height)*$path[$type][1])
				{
					$r=$this->moveImg($file,$path[$type][0]);
				}
				else
				{
					$r=array(
						'code'=>'5',
						'msg'=>'图片宽高比例应为'.$path[$type][1].':'.$path[$type][2],
						);
				}

				break;
			default:
				$r=$this->moveImg($file,$path[$type][0]);			
				
				break;
		}
		return $r;
	}

	//获取详情
	private function  moveImg($file,$destinationPath)
	{
        $extension = $file->getClientOriginalExtension();
        $fileName = time().str_random(4).'.'.$extension;
        // return  $file->move($destinationPath, $fileName)?array('img'=>$destinationPath.$fileName):array('code'=>'5','msg'=>'图片上传失败');
        return  $file->move($destinationPath, $fileName)?array('img'=>$destinationPath.$fileName,):array('code'=>'5','msg'=>'图片上传失败');
	}

}
