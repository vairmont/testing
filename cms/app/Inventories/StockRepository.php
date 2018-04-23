<?php

namespace App\Inventories;

class StockRepository
{
    public function getStocks($args=[])
    {
        $stocks = Stock::get();
            
        return $stocks;
    }

    public function findStockbyProductStoreId($id, $store_id)
    {
        $stock = Stock::where('product_id', $id)
                        ->where('store_id', $store_id)
                        ->first();
            
        return $stock;
    }

    public function createOrUpdateStock($id, $input)
    {
        if (!empty($id)) {
            $stock = $this->findStockbyProductStoreId($id, $input['store_id']);
        }
        
        if (!isset($stock)) {
            $stock = Stock::create($input);
        }
        else {
            $stock->update($input);
        }

        return $stock;
    }

    public function deleteStock(Stock $stock)
    {
        $stock->delete();
    }
}