<?php
namespace App\Http\Front\Diet;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Goods;
use App\Services\Sys\Img;


class Test2Controller extends BaseController
{
	//测试用
	public function index(Request $request)
	{
	 $file = Input::file('myfile');

	if($file -> isValid()){

    //检验一下上传的文件是否有效.

    $clientName = $file -> getClientOriginalName();

    $tmpName = $file ->getFileName(); // 缓存在tmp文件夹中的文件名 例如 php8933.tmp 这种类型的.

  	$realPath = $file -> getRealPath();    //这个表示的是缓存在tmp文件夹下的文件的绝对路径

   //例如我的是: G:\xampp\tmp\php5A69.tmp

  //这里要注意,如果我使用接下来的move方法之后, getRealPath() 就找不到文件的路径了.因为文件已经被移走了.

   // 所以这里道出了文件上传的原理,将文件上传的某个临时目录中,然后使用Php的函数将文件移动到指定的文件夹.

  $entension = $file -> getClientOriginalExtension(); //上传文件的后缀.

    $mimeTye = file -> getMimeType();//大家对mimeType应该不陌生了. 我得到的结果是 image/jpeg.

   //这里要注意一点,以前我们使用 mime_content_type() ,在php5.3 之后,开始使用 fileinfo 来获取文件的mime类型.所以要加入 php_fileinfo的php拓展.windows下是 php_fileinfo.dll,在php.ini文件中将 extension=php_fileinfo.dll前面的分号去掉即可.当然要重启服务器.

// 将其放置在app的storage目录下的uploads目录中,并且需要改名的话..

	$newName = md5(date('ymdhis').$clientName).".".$extension;
	  $path = $file -> move(app_path().'/storage/uploads',$newName);
// 
 	 // 这里app_path()就是app文件夹所在的路径.$newName 可以是你通过某种算法获得的文件的名称.主要是不能重复产生冲突即可.   比如 


	}

		

	}

	public function file(){

    $id=$request->input("id");       //id
    $m_idcard=$request->input("m_idcard");     //图片名称
    $file = $request->file('m_license');
    $hou = $file->getClientOriginalExtension();//文件后缀
    $path = './admin/public/';
    $filename = rand(1, 999999) . "." . $hou;
    $m_license = $path . $filename;     //文件路径
    $file->move($path, $filename);  // 移动文件到指定目录
    $arr=array('m_license'=>$m_license,'m_idcard'=>$m_idcard);
    $re=DB::table('merchant')
        ->where(['id'=>$id] )
        ->update($arr);
    //var_dump($re);die;
    if($re){
        $s=DB::select("select m_phone from merchant where id='$id'");
        return view("mer.login.mermessage",['list'=>$s]);
    }else{
        echo "失败";
    }
    //return redirect('mercarList');

  
	}
}