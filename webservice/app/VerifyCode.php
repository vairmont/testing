<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VerifyCode extends Model
{
    protected $table = 'verify_code';

    protected $fillable = [
    	'otp','hash'
    ];
}
