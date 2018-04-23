<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = 'receipt';

    protected $fillable = [
    	'order_id', 'header', 'footer'
    ]
}
