<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BannerPromo extends Model
{
    protected $table = 'banner_promo';
    protected $fillable = [
    	'name', 'photo', 'description', 'period', 'terms'
    ];
}
