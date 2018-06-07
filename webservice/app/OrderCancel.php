<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderCancel extends Model
{
    protected $table = 'order_cancel';

    protected $fillable = [
    	'order_id','category_id','cancel_by','reason'
    ];
}
