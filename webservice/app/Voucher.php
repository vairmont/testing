<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Voucher extends Model
{
    protected $table = "voucher";
    protected $fillable = [
        'voucher_code','product_type','discount','for','product_category','valid_from','valid_until','quota','quota_per_account','description', 'cashback', 'min_purchase', 'bonus_item', 'max_purchase'
    ];

}
