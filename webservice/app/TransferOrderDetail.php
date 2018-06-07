<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransferOrderDetail extends Model
{
    protected $table = "transfer_order_detail";
    protected $fillable = [
        'transfer_order_id', 'product_id', 'quantity', 'transfer_date'
    ];
}
