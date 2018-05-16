<?php

namespace App\Inventories;

class SupplierRepository
{
    public function getSuppliers($args=[])
    {
        $suppliers = Supplier::get();
            
        return $suppliers;
    }

    public function findSupplier($id)
    {
        $supplier = Supplier::where('id', $id)
                        ->first();
            
        return $supplier;
    }

    public function createOrUpdateSupplier($id, $input)
    {
        if (!empty($id)) {
            $supplier = $this->findSupplier($id);
        }
        
        if (!isset($supplier)) {
            $supplier = Supplier::create($input);
        }
        else {
            $supplier->update($input);
        }

        return $supplier;
    }

    public function deleteSupplier(Supplier $supplier)
    {
        $supplier->delete();
    }
}