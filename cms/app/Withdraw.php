<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Withdraw extends Model
{
    protected $table = 'withdraw';
    protected $fillable = ['id','agen_id','amount','status'];
}
