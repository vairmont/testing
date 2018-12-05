<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BankAccount extends Model{

  protected $table = 'bank_account';

  protected $fillable = ['id', 'user_id', 'bank_id', 'name', 'account_no'];

}