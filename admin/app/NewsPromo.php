<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class NewsPromo extends Model
{
    protected $table = "newspromo";
    protected $fillable = [
    	'title', 'description', 'image', 'customer', 'reseller', 'dealer'
    ];
}
