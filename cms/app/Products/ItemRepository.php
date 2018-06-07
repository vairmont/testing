<?php

namespace App\Products;
use DB;

class ItemRepository
{
    public function getItems($args=[])
    {
        $items = Item::select('*');

        if (!empty($args['product_name'])) {
            $items = $items->where('product_name', 'LIKE', '%'.$args['product_name'].'%');
        }

        if (!empty($args['category_id']) && $args['category_id']!="all") {
            $items = $items->where('category_id', $args['category_id']);
        }

        if (!empty($args['stock']) && $args['stock']!="all") {
            $items = $items->leftJoin('stock', function($join)
                         {
                             $join->on('stock.product_id', '=', 'product.id');
                             $join->on('stock.store_id', '=', 'product.store_id');
                         });


            if ($args['stock']=='sold') {
                $items = $items->where('quantity', $args['stock']);
            } else {
                $items = $items->where('quantity', '<=', 10);
            }
        }

        if (isset($args['pages']) && $args['pages']==0) {
            $items = $items->paginate(20);
        } else {
            $items = $items->get();
        } 
            
        return $items;
    }

    public function findItem($id)
    {
        $item = Item::find($id);
            
        return $item;
    }

    public function createOrUpdateItem($id, $input)
    {
        if (!empty($id)) {
            $item = $this->findItem($id);

            if (is_null($item)) {
                abort(404);
            }
        }

        $input['price_for_agen'] = 0.95 * $input['price_for_customer'];
        
        if (!isset($item)) {
            $item = Item::create($input);
        }
        else {
            $item->update($input);
        }

        return $item;
    }

    public function deleteItem(Item $item)
    {
        $item->delete();
    }
}