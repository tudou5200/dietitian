<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

#数据表类
class ChatLog extends Model
{
	
	protected $table = 'chat_log';#表名
	protected $primaryKey = 'id';#主键ID
    public $timestamps=false;#不适用时间戳
}
