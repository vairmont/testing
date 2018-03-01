<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reseller extends Model
{
    protected $table = 'barcode';
    protected $fillable = [
    	'product_id'
    ];
}
