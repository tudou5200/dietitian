<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
#购物车表
class Quanarticle extends Model
{
	protected $table = 'quan_article';
	protected $primaryKey = 'id';
    public $timestamps = false;
}
