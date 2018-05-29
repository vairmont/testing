<?php

namespace App\Inventories;

class PurchaseOrderRepository
{
    public function getPurchaseOrders($args=[])
    {
        $PurchaseOrders = PurchaseOrder::get();
            
        return $PurchaseOrders;
    }

    public function findPurchaseOrder($id)
    {
        $PurchaseOrder = PurchaseOrder::where('id', $id)
                        ->first();
            
        return $PurchaseOrder;
    }

    public function createOrUpdatePurchaseOrder($id, $input)
    {
        if (!empty($id)) {
            $PurchaseOrder = $this->findPurchaseOrder($id);
        }
        
        if (!isset($PurchaseOrder)) {
            $PurchaseOrder = PurchaseOrder::create($input);
        }
        else {
            $PurchaseOrder->update($input);
        }

        return $PurchaseOrder;
    }

    public function deletePurchaseOrder(PurchaseOrder $PurchaseOrder)
    {
        $PurchaseOrder->delete();
    }
}