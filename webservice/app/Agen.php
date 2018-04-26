<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Agen extends Model
{
    protected $table = 'agen';
    protected $fillable = [
    	'identifier', 'business_name', 'name', 'phone', 'address'
    ];
}
