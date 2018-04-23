<?php

namespace App\Products;

class DiscountRepository
{
    public function getDiscounts($args=[])
    {
        $discounts = Discount::paginate(20);
            
        return $discounts;
    }

    public function findDiscount($id)
    {
        $discount = Discount::find($id);
            
        return $discount;
    }

    public function createOrUpdateDiscount($id, $input)
    {
        if (!empty($id)) {
            $discount = $this->findDiscount($id);

            if (is_null($discount)) {
                abort(404);
            }
        }
        
        if (!isset($discount)) {
            $discount = Discount::create($input);
        }
        else {
            $discount->update($input);
        }

        return $discount;
    }

    public function deleteDiscount(Discount $discount)
    {
        $discount->delete();
    }

}