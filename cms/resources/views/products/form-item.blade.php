@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

@if(isset($item))
    {{ Form::open(['url' => url('edititem/' . $item->id), 'method' => 'post', 'enctype' => 'multipart/form-data']) }}
@else
    {{ Form::open(['url' => url('additem'), 'method' => 'post', 'enctype' => 'multipart/form-data']) }} 
@endif
    <h1 class="page-header col-lg-12">Product</h1>
    <!--DB product-->
    <div class="form-group col-lg-6">
        <label>Name</label>
        <input class="form-control" name="product_name" value="{{ isset($item) ? $item->product_name : old('product_name') }}">
    </div>
    <!--DB product_category-->
    <div class="form-group col-lg-6">
        <label for="inputState">Category</label>
        <select id="inputState" class="form-control" name="category_id">
            <option selected>All Item</option>
            @if ($categories)
                @foreach ($categories as $category)
                    <option value="{{ $category->id }}" {{ (isset($item) && $category->id==$item->category_id) ? "selected" : "" }} >{{ $category->name }}</option>
                @endforeach
            @endif
        </select>
    </div>
    <!--DB product-->
    <div class="form-group col-lg-12">
        <div class="form-group col-lg-6">
            <label>Price</label>
            <input class="form-control" placeholder="Price" name="price_for_customer" value="{{ isset($item) ? $item->price_for_customer : old('price_for_customer') }}">
        </div>
        <div class="form-group col-lg-6">
            <label>Cost</label>
            <input class="form-control" placeholder="Cost" name="cost" value="{{ isset($item) ? $item->cost : old('cost') }}">
        </div>
    </div>        
    <div class="form-group col-lg-12">
        <div class="form-group col-lg-6">
            <label>SKUD</label>
            <input class="form-control" placeholder="SKUD" name="sku" value="{{ isset($item) ? $item->sku : old('sku') }}">
        </div>
        <div class="form-group col-lg-6">
            <label>Incentive Rate</label>
            <select class="form-control" placeholder="Rate" name="incentive_id">
                @if (isset($incentives))
                    @foreach ($incentives as $incentive)
                        <option value="{{ $incentive->id }}" {{ (isset($item) && $incentive->id==$item->incentive_id) ? "selected" : "" }} >{{ $incentive->rate }}</option>
                    @endforeach
                @endif
            </select>
        </div>
            <div class="form-group">
            <label>Description</label>
            <textarea class="form-control" rows="3" name='description' value="{{ isset($item) ? $item->description : old('description') }}"></textarea>
            </div>
            <div class="form-group col-lg-6">
            <label>Shelf</label>
            <input class="form-control" placeholder="Shelf" name="shelf" value="{{ isset($item) ? $item->shelf : old('shelf') }}">
            </div>
            <div class="form-group col-lg-6">
            <label>Image</label>
            <input type="file" class="form-control" name="img_url">
            </div>
        </div>
        <div class="form-group col-lg-6">
            <label>Image</lab~el>
            <input class="form-control" placeholder="Shelf" name="shelf" value="{{ isset($item) ? $item->shelf : old('shelf') }}">
        </div>
    </div>
    <!--DB Stock-->
    <div class="col-lg-12">
        <h1 class="page-header">Inventory</h1>
    </div>
    <div class="col-lg-6">
        <label>Jumlah Stok</label>
        <input class="form-control" placeholder="Stok" name="quantity" value="{{ isset($item) && isset($item->stock) ? $item->stock->quantity : old('quantity') }}"> 
    </div>
    <div class="form-group col-lg-12">
        <div class="col-lg-6">
            <!-- DB Store -->
            <h2>TOKO</h2>
        </div>
        <div class="checkbox col-lg-12">
            @if (isset($stores))
                @foreach ($stores as $store)
                    <input type="radio" value="{{ $store->id }}" name="store_id" {{ (isset($item) && $item->store_id>0 && $store->id==$item->store_id) ? "checked" : "" }} > {{ $store->store_name }}
                @endforeach
            @endif
        </div>
    </div>
    <div class="form-group col-lg-12">
        <!-- DB Tax -->
        <h2>Pajak</h2>
        @if (isset($taxes))
            @foreach ($taxes as $tax)
                <input type="radio" value="{{ $tax->id }}" name="tax_id" {{ (isset($item) && $item->tax_id > 0 && $tax->id==$item->tax_id) ? "checked" : "" }} > {{ $tax->tax_value }}
            @endforeach
        @endif
    </div>

    <div>
        <button type="submit" class="btn btn-default">Submit Button</button>
        <button type="reset" class="btn btn-default">Clear</button>
    </div>                    
{{ Form::close() }}
<!-- /#page-wrapper -->

@endsection