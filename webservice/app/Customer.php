<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table = 'customer';
    protected $fillable = [
    	'identifier', 'agen_id', 'name', 'phone', 'email', 'address', 'gender' 
    ];
}
