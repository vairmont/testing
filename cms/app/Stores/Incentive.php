<?php

namespace App\Stores;

use Illuminate\Database\Eloquent\Model;

class Incentive extends Model
{
    protected $table = 'incentive_category';
    protected $guarded = ['id'];
}