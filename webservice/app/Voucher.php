<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Voucher extends Model
{
    protected $table = "voucher";
    protected $fillable = [
        'voucher_code','discount_rate','for','product_category','valid_from','valid_until','quota','description'
    ];

}
