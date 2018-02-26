<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = 'order';

    protected $fillable = [
    	'invoice_no','user_id','subtotal','discount','tax', 'total'
    ];
}
