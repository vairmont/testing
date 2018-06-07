<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StokAdjustment extends Model
{
    protected $table = "stock_adjustment";
    protected $fillable = [
        'store_id','product_id', 'category_id', 'quantity', 'reason'
    ];
}
