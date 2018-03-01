<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reseller extends Model
{
    protected $table = 'admin';
    protected $fillable = [
    	'identifier', 'name', 'phone', 'department'
    ];
}
