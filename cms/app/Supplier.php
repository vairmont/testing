<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    protected $table = 'suppliers';
    protected $fillable = ['id','name','contact','email','phone','website','address1','address2','city','zipcode','region','note'];
}
