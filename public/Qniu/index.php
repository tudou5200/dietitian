<?php 
require_once 'php-sdk-7.1.3/autoload.php';
use Qiniu\Auths;
use Qiniu\Storage\UploadManager;
use Qiniu\Storage\BucketManager;
#转码
$accessKey = 'bE0hAjBY6bx6tt0AznJ93yynkShTIE2PJHi-cgyb';
$secretKey = 'viOcaYKWQMKbnS5evdJWcbny6RmsqMceCAjEY3Xu';


$auth = new Auths($accessKey, $secretKey);
$bucketMgr = new BucketManager($auth);

$bucket = 'aiyang'; 

$pipeline = 'aiyangkeji';

$fops ='avthumb/mp3/ab/320k/ar/44100/acodec/libmp3lame';

$key_x = date('YmdHis').rand(10,99).".mp3";

$savekey = Qiniu\base64_urlSafeEncode("aiyang:".$key_x);

$fops = $fops.'|saveas/'.$savekey;

$policy = array('persistentOps' => $fops,'persistentPipeline' => $pipeline,);


$uptoken = $auth->uploadToken($bucket, null, 3600, $policy);

$filePath = $_POST['url'];

$uploadMgr = new UploadManager();


$key = $_POST['key'];


list($ret, $err) = $uploadMgr->putFile($uptoken, $key, $filePath);

	if ($err !== null) {
		echo '';
		exit;

	} else {
		echo "http://opq1i9mlg.bkt.clouddn.com/".$key_x;; 
		exit;

	}
