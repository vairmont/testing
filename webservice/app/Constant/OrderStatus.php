<?php

namespace App\Constant;
/**
 * Created by PhpStorm.
 * User: febrianjiuwira
 * Date: 31/03/18
 * Time: 13.27
 */
class OrderStatus {

  const CREATED = 1;
  const REASSIGN = 1;
  const ASSIGNED = 2;
  const PICKUP = 3;
  const FAILED = 4;
  const DELIVERY = 6;
  const COMPLETED = 7;
  const CASHDONE = 9;
  const CANCELLED = 8;
}