<?php

namespace App\Stores;

class IncentiveRepository
{
    public function getIncentives($args=[])
    {
        $incentives = Incentive::get();
            
        return $incentives;
    }

    public function findIncentive($id)
    {
        $incentive = Incentive::find($id);
            
        return $incentive;
    }
}