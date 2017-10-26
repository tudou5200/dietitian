<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
#购物车表
class Quancommend extends Model
{
	protected $table = 'quan_commend';
	protected $primaryKey = 'id';
    public $timestamps=false;
}
