<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
*
*/
class Ticklist extends Model
{
	protected $table = 'user_tickling';
	protected $primaryKey = 'id';
    public $timestamps=false;
}
