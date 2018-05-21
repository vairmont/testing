<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    protected $table = "rating";
    protected $fillable = ['order_id','agen_id','customer_id','value','notes'];
}
