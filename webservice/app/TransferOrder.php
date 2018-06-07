<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransferOrder extends Model
{
    protected $table = "transfer_order";
    protected $fillable = [
        'store_id_from', 'store_id_to'
    ];
}
