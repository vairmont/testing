<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $table = 'cart';

    protected $fillable = [
    	'user_id', 'voucher_id', 'subtotal', 'discount', 'tax', 'total'
    ];
}
