<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Family extends Model
{
    protected $table = "family";
    protected $fillable = ['parent_id','child_id','relation'];
}
