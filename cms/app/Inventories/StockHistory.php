<?php

namespace App\Inventories;

use Illuminate\Database\Eloquent\Model;

class StockHistory extends Model
{
    protected $table = 'stock_history';
    protected $guarded = ['id'];

    public function store()
    {
        return $this->belongsTo('App\Stores\Store', 'store_id', 'id');
    }

    public function item()
    {
        return $this->hasOne('App\Products\Item', 'product_id', 'id');
    }
}