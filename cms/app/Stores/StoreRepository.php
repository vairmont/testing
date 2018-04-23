<?php

namespace App\Stores;

class StoreRepository
{
    public function getStores($args=[])
    {
        $stores = Store::get();
            
        return $stores;
    }

    public function findStore($id)
    {
        $store = Store::find($id);
            
        return $store;
    }
}