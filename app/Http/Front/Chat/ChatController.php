<?php
namespace App\Http\Front\Chat;
use App\Http\BaseController;
use Illuminate\Http\Request;


class ChatController extends BaseController
{
	public function getChat()
	{
		header('Content-Type: text/event-stream');
		header('Cache-Control: no-cache');

		$serverTime = time();

		$this->sendMsg($serverTime, 'server time111111rfdfd: ' . date("h:i:s", time()));


	}
	private function sendMsg($id, $msg) 
	{
	  echo "id: $id" . PHP_EOL;
	  echo "data: $msg" . PHP_EOL;
	  echo PHP_EOL;
	  ob_flush();
	  flush();
	  exit();
	}
}