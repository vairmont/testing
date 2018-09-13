<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Voucher extends Model
{
    protected $table = 'voucher';
    protected $fillable = [
    	'voucher_code', 'product_type', 'valid_from', 'valid_until', 'quota', 'quota_per_account', 'discount','cashback','min_purchase','bonus_item','description'
    ];
}
