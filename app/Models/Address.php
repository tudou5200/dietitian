<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

#数据表类
class Address extends Model
{

	protected $table = 'user_address';#表名
	protected $primaryKey = 'address_id';#主键ID
    public $timestamps = false;#不适用时间戳
	
}