<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderBillingDetail extends Model
{
    protected $table = 'order_billing_detail';

    protected $fillable = [
    	'order_id','customer_name','customer_phone','customer_address','lat', 'long', 'customer_address2'
    ];
}
