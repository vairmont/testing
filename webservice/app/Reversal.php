<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reversal extends Model
{
    protected $table = 'reversal';
    protected $fillable = [
    	'server_id', 'client_id', 'status_code', 'kp', 'msisdn', 'sn', 'msg'  
    ];
}
