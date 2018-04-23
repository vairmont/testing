<?php

namespace App\Products;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'product_category';
    protected $fillable = ['name'];
}