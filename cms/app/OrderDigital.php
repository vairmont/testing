<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDigital extends Model
{
    protected $table = 'order_digital';
    protected $fillable = ['id','order_id','product_id','category_id','qty','price_for_customer','price_for_agen','created_at','update_at'];
}
