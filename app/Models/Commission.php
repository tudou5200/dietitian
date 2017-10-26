<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Commission extends Model
{
	
	protected $table = 'user_commission';#表名
	protected $primaryKey = 'id';#主键ID
    public $timestamps=false;#不适用时间戳 
}
