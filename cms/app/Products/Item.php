<?php

namespace App\Products;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $table = 'product';
    protected $guarded = ['id'];

    public function category()
    {
        return $this->belongsTo('App\Products\Category', 'category_id', 'id');
    }

    public function store()
    {
        return $this->belongsTo('App\Stores\Store', 'store_id', 'id');
    }

    public function stock()
    {
        return $this->hasOne('App\Inventories\Stock', 'product_id', 'id');
    }

    public function getMarginAttribute()
    {
    	$price = $this->price_for_customer;
    	$cost = $this->cost;

        $margin = $price - $cost;

        return $margin;
    }

}