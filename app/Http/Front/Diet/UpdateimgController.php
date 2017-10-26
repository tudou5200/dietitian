<?php
namespace App\Http\Front\Diet;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Goods;
use App\Services\Sys\Img;
use App\Helpers;


class UpdateimgController extends BaseController
{
	

	#图片上传
	public function indexs(Request $request)
	{
	
		$types		= 	trim($request->input('type'));
		$type 		= 	empty($types)?0:$types;
		$ImgObj 	=	new Img();
		$key 		=	array_keys($_FILES);
		$returns	=	$ImgObj->index($key[0],$type);
		$returnsx   =   'http://api.shoumeikeji.cn/'.$returns['img'];
		$msg['url']  = $returnsx;
        $msg['status'] =200;
        $msg=json_encode($msg);
		$remsg = "<script>window.location.href='http://59.110.29.200:8080/php/upload.php?callback=".$msg."'</script>";
		echo $remsg;
		 
		//return $this->result($returnsx);
	}
   

 	#图片上传
	public function indexd(Request $request)
	{
		
		$types		= 	trim($request->input('type'));
		$type 		= 	empty($types)?0:$types;
		$ImgObj 	=	new Img();
		$key 		=	array_keys($_FILES);
		$returns = $ImgObj->index($key[0],$type);
		$returnsx['img']   =  $returns['img'];
		if(!function_exists('exif_read_data')) return false;
		// $ret = $this->correct_image_orientation('http://api.shoumeikeji.cn/images/20170506134439.jpg);
		// $ret = $this->correct_image_orientation($_FILES['name_url']);

		// if(!function_exists('exif_read_data')) return false;
		// $image = imagecreatefromstring(file_get_contents(trim($returnsx['img'])));

		// $image = file_get_contents($file=iconv("UTF-8","GB2312",$_FILES['name_url']['tmp_name']));
		// $image = imagecreatefromstring(file_get_contents($file=iconv("UTF-8","GB2312",$_FILES['name_url']['tmp_name'])));
		// // $image = imagecreatefromstring($_FILES['name_url']['tmp_name']);
		$exif = exif_read_data($returnsx['img']);
		// // var_dump($image);
		// if(!empty($exif['Orientation'])) {
		// 	 switch($exif['Orientation']) {
		// 	  case 8:
		// 	   $image = imagerotate($image,90,0);
		// 	   break;
		// 	  case 3:
		// 	   $image = imagerotate($image,180,0);
		// 	   break;
		// 	  case 6:
		// 	   $image = imagerotate($image,-90,0);
		// 	   break;
		// 	   case 0:
		// 	   $image = imagerotate($image,90,0);
		// 	   break;
		// 	 }
		// }
		// $_FILES['name_url']['tmp_name'] = $image;


		var_dump($exif);
		// $returnsx['img']   =  $returns['img'];


		// $string[0] = urldecode("%E9%9D%A0");
		// $string[1] = urldecode("%BF%BF");
		// file_put_contents($_FILES['name_url']['tmp_name'], $string[0]);
		// file_put_contents($_FILES['name_url']['tmp_name'], $string[1]);
		// echo file_get_contents($filename[0]);
		// echo file_get_contents($filename[1]);
		// $returnsx['e']   = $image;
		return $this->result($image);
	}


	// public function index(Request $request)
	// {
	// 	$types		= 	trim($request->input('type'));
	// 	$type 		= 	empty($types)?0:$types;
	// 	$ImgObj 	=	new Img();
	// 	$key 		=	array_keys($_FILES);
	// 	$returns = $ImgObj->index($key[0],$type);
	// 	$a['img'] = $returns['img'];
	// 	return $this->result($a);
	// }


	// public  function array_utf8_encode($dat)
	// {
	//     if (is_string($dat))
	//         return utf8_encode($dat);
	//     if (!is_array($dat))
	//         return $dat;
	//     $ret = array();
	//     foreach ($dat as $i => $d)
	//         $ret[$i] = self::array_utf8_encode($d);
	//     return $ret;
	// }



	// public function correct_image_orientation($target) {
	// 	    if(!function_exists('exif_read_data')) {
	// 	        return false;
	// 	    }
	// 	    $exif = exif_read_data($target);
	// 	    if($exif && isset($exif['Orientation']) && $exif['Orientation'] != 1) {
	// 	        switch ($exif['Orientation']) {
	// 	            case 3: $deg = 180; break;
	// 	            case 6: $deg = 270; break;
	// 	            case 8: $deg = 90; break;
	// 	            default: $deg = 0;
	// 	        }
	// 	        if($deg > 0) {
	// 	            $img = imagecreatefromjpeg($target);
	// 	            $img = imagerotate($img, $deg, 0);
	// 	            imagejpeg($img, $target, 95);
	// 	        }
	// 	    }
	// 	    return $img;
	// }

	#图片上传
	public function index(Request $request)
	{
		$types		= 	trim($request->input('type'));
		$type 		= 	empty($types)?0:$types;
		$ImgObj 	=	new Img();
		$key 		=	array_keys($_FILES);
		$returns = $ImgObj->index($key[0],$type);
	
		return $this->result($returns['img']);
	}
  
}