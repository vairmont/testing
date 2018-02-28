<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VoucherUse extends Model
{
    protected $table = 'voucher_use';

    protected $fillable = [
    	'voucher_id','order_id'
    ];
}
