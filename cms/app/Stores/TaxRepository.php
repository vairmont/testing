<?php

namespace App\Stores;

class TaxRepository
{
    public function getTaxes($args=[])
    {
        $taxes = Tax::get();
            
        return $taxes;
    }

    public function findTax($id)
    {
        $tax = Tax::find($id);
            
        return $tax;
    }
}