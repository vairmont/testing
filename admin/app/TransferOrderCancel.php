<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $table = "transfer_order_cancel";
    protected $fillable = [
        'transfer_order_id', 'cancel_by', 'reason'
    ];
}
