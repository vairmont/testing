<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransferOrderCancel extends Model
{
    protected $table = "transfer_order_cancel";
    protected $fillable = [
        'transfer_order_id', 'cancel_by', 'reason'
    ];
}
