<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

#数据表类
class Admin extends Model
{

	protected $table = 'admin';#表名
	protected $primaryKey = 'id';#主键ID
    public $timestamps = false;#不适用时间戳
	
}