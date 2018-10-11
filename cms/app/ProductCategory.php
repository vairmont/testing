<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $table = 'product_category';
    protected $fillable = [
    	'id', 'name', 'description', 'photo_url', 'slug', 'created_at', 'updated_at'
    ];
}
