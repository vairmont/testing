<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WaneeHistory extends Model
{
    protected $table = "wanee_history";
    protected $fillable = [
        'user_id', 'amount', 'saldo_akhir', 'reason', 'created_at'
    ];
}
