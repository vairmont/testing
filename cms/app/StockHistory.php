<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StockHistory extends Model
{
    protected $table = 'stock_history';
    protected $fillable = ['reason', 'store_id', 'quantity','product_id'];
}
