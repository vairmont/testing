<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cash extends Model
{
    protected $table = 'cash';

    protected $fillable = [
    	'user_id'
    ];
}
