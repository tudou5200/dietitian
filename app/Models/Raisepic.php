<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

#数据表类
class Raisepic extends Model
{
	
	protected $table = 'raise_pic';#表名
	protected $primaryKey = 'id';#主键ID
    public $timestamps = false;#不适用时间戳
}
