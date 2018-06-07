<?php

namespace App\Inventories;

class SupplierRepository
{
    public function getSuppliers($args=[])
    {
        $Suppliers = Supplier::get();
            
        return $Suppliers;
    }

    public function findSupplier($id)
    {
        $Supplier = Supplier::where('id', $id)
                        ->first();
            
        return $Supplier;
    }

    public function createOrUpdateSupplier($id, $input)
    {
        if (!empty($id)) {
            $Supplier = $this->findSupplier($id);
        }
        
        if (!isset($Supplier)) {
            $Supplier = Supplier::create($input);
        }
        else {
            $Supplier->update($input);
        }

        return $Supplier;
    }

    public function deleteSupplier(Supplier $Supplier)
    {
        $Supplier->delete();
    }
}