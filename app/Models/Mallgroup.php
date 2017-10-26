<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

#数据表类
class Mallgroup extends Model
{
	
	protected $table = 'mall_group';#表名
	protected $primaryKey = 'id';#主键ID
    public $timestamps=false;#不适用时间戳
}
