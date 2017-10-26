<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
#购物车表
class Article extends Model
{
	protected $table = 'the_article';
	protected $primaryKey = 'id';
    public $timestamps=false;
}
