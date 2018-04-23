<?php

namespace App\Constant;
/**
 * Created by PhpStorm.
 * User: febrianjiuwira
 * Date: 31/03/18
 * Time: 13.27
 */
class OrderStatus {

  const CREATED = 10000;
  const ASSIGNED = 20000;
  const REASSIGN = 20001;
  const COMPLETED = 50000;
  const CANCELLED = 90000;

}