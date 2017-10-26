<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
#购物车表
class Cart extends Model
{
	protected $table = 'mall_cart';
	protected $primaryKey = 'id';
    public $timestamps=false;
}
