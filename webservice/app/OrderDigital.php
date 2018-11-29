<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDigital extends Model
{
    protected $table = 'order_digital';

    protected $fillable = [
    	'order_id','invoice_no','category_id','qty','base_price', 'discount', 'voucher_code', 'total'
    ];
}
