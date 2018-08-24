<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Products\ItemRepository;
use App\Products\CategoryRepository;
use App\Products\DiscountRepository;
use App\Stores\StoreRepository;
use App\Stores\TaxRepository;
use App\Stores\IncentiveRepository;
use App\Inventories\StockRepository;
use App\Slider;
use App\Product;

use Excel;

class ItemController extends Controller
{
    protected $items, $categories, $discounts, $stores, $taxes, $incentives, $stocks;

    public function __construct(ItemRepository $items, CategoryRepository $categories, DiscountRepository $discounts, StoreRepository $stores, TaxRepository $taxes, IncentiveRepository $incentives, StockRepository $stocks)
    {
        $this->items = $items;
        $this->categories = $categories;
        $this->discounts = $discounts;
        $this->stores = $stores;
        $this->taxes = $taxes;
        $this->incentives = $incentives;
        $this->stocks = $stocks;
    }
    public function getByAddSlider(){

        return view('products.slider')->withTitle('by slider');
    }
    public function saveSlider(Request $request)
    {
        
        if($request->hasFile('photo')){
            $path = $request->file('photo')->store('image');
        }else { $path = ""; }
        $this->validate($request,[
            'name'=> 'required',
            'page'=> 'required'
        ]);
      
        $slider = new Slider;
        $slider->name = $request->input('name');
        $slider->page = $request->input('page');
        $slider['photo']= "storage/app/".$path;
        $slider->save();
        return redirect ('/slider');
        
    }
    public function getDaftarItem(Request $req) {
        $args = $req->only(['product_name', 'category_id', 'stock']);
        $isExport = $req->get('is_export', 0);
        $args['pages'] = $isExport;

        $categories = $this->categories->getCategories();
        $items = $this->items->getItems($args);
        if ($isExport) {
            $this->_export_excel($items);
        }
        return view('products.daftaritem', compact('items', 'categories'))->withTitle('Daftar Item');
    }

    private function _export_excel($items) {
        $data = [];
        foreach ($items as $item) {
            $store = isset($item->store) ? $item->store->store_name : "";
            $stock = isset($item->stock) ? $item->stock->quantity : "0";
            $data[] = ([
                'Nama Barang' => $item->product_name,
                'Kategori' => $item->category->name,
                'Harga' => "Rp. ".$item->price_for_customer,
                'Biaya' => "Rp. ".$item->cost,
                'Margin' => "Rp. ".$item->margin,
                'Toko' => $store,
                'Persediaan' => $stock, 
            ]);
        }

        return Excel::create('Daftar_Item', function($excel) use($data) {
            $excel->sheet('Sheetname', function($sheet) use($data) {
                $row = 1;

                $sheet->fromArray($data, null, 'A' . $row, true, true);

                $sheet->getStyle("A1:" . 'G' . $row)
                    ->getAlignment()->setWrapText(false);
            });
        })->export('xls');
    }

    public function formItem($id="") {
        $title = empty($id) ? "Add Item" : "Edit Item";
        $categories = $this->categories->getCategories();
        $stores = $this->stores->getStores();
        $taxes = $this->taxes->getTaxes();
        $incentives = $this->incentives->getIncentives();

        if (!empty($id)) {
            $item = $this->items->findItem($id);

            if (is_null($item)) {
                abort(404);
            }
        }

        return view('products.form-item', compact('item', 'categories', 'stores', 'taxes', 'incentives'))->withTitle($title);
    }
 
    public function saveItem(Request $request, $id = "")
    {
        if($request->hasFile('img_url')){
            $path = $request->file('img_url')->store('image');
        }else { $path=""; }
          $inputItem['product_name'] = $request->product_name;
          $inputItem['category_id'] = $request->category_id;
          $inputItem['price_for_customer'] = $request->price_for_customer;
          $inputItem['cost'] = $request->cost;
          $inputItem['sku'] = $request->sku;
          $inputItem['incentive_id'] = $request->incentive_id;
          $inputItem['store_id'] = $request->store_id;
          $inputItem['tax_id'] = $request->tax_id;
          $inputItem['description'] = $request->description;
          $inputItem['shelf'] = $request->shelf;
          $inputItem['img_url']= "storage/app/".$path;
          
          
        /*$inputItem = $request->only(['product_name', 'category_id', 'price_for_customer', 'cost', 'sku', 'incentive_id', 'store_id', 'tax_id','description','shelf']);*/

        $inputStock = $request->only(['quantity', 'store_id']);

        $item = $this->items->createOrUpdateItem($id, $inputItem);

        $inputStock['product_id'] = $item->id;
        $stock = $this->stocks->createOrUpdateStock($id, $inputStock);

        return redirect('daftaritem');
    }

    public function editItem(Request $request, $id = "")
    {
        $item = Product::where('id','=',$id)
        ->update(['cost' => $request->cost,
                  'price_for_customer' => $request->price_for_customer,
                  'promo_price' => $request->promo_price]);

        return redirect('modifier');
    }

    public function deleteItem($id = "")
    {
        if (!empty($id)) {
            $item = $this->items->findItem($id);

            if (is_null($item)) {
                abort(404);
            } else {
                $stock = $this->stocks->findStockbyProductStoreId($id, $item->store_id);
               $this->items->deleteItem($item);
               $this->stocks->deleteStock($stock);
            }
        }

        return redirect('daftaritem');
    }

    public function getKategori() {
        $categories = $this->categories->getCategories();

        return view('products.kategori', compact('categories'))->withTitle('Kategori');
    }

    public function formKategori($id="") {
        $title = empty($id) ? "Add Category" : "Edit Category";

        if (!empty($id)) {
            $category = $this->categories->findCategory($id);

            if (is_null($category)) {
                abort(404);
            }
        }

        return view('products.form-kategori', compact('category'))->withTitle($title);
    }

    public function saveKategori(Request $request, $id = "")
    {
        $input = $request->only(['name']);

        $this->categories->createOrUpdateCategory($id, $input);

        return redirect('kategori');
    }

    public function deleteKategori($id = "")
    {
        if (!empty($id)) {
            $category = $this->categories->findCategory($id);

            if (is_null($category)) {
                abort(404);
            } else {
               $this->categories->deleteCategory($category);
            }
        }

        return redirect('kategori');
    }

    public function getModifier(Request $req) {
        $args = $req->only(['product_name', 'category_id', 'stock']);
        $isExport = $req->get('is_export', 0);
        $args['pages'] = $isExport;

        $categories = $this->categories->getCategories();
        $items = $this->items->getItems($args);

        if ($isExport) {
            $this->_export_excel($items);
        }

        return view('products.modifier', compact('items', 'categories'))->withTitle('Modifier');
    }



    public function getAddModifier() {
        return view('products.addmodifier')->withTitle('Add Modifier');
    }

    public function getDiskon() {
        $discounts = $this->discounts->getDiscounts();

        return view('products.diskon', compact('discounts'))->withTitle('Discount');
    }

    public function formDiskon($id="") {
        $title = empty($id) ? "Add Discount" : "Edit Discount";

        if (!empty($id)) {
            $discount = $this->discounts->findDiscount($id);

            if (is_null($discount)) {
                abort(404);
            }
        }

        return view('products.form-diskon', compact('discount', 'categories'))->withTitle($title);
    }

    public function saveDiskon(Request $request, $id = "")
    {
        $input = $request->only(['name', 'rate', 'type', 'restriction']);

        $input['restriction'] = is_null($input['restriction']) ? 0 : 1;

        $this->discounts->createOrUpdateDiscount($id, $input);

        return redirect('diskon');
    }

    public function deleteDiskon($id = "")
    {
        if (!empty($id)) {
            $discount = $this->discounts->findDiscount($id);

            if (is_null($discount)) {
                abort(404);
            } else {
               $this->discounts->deleteDiscount($discount);
            }
        }

        return redirect('diskon');
    }
}
