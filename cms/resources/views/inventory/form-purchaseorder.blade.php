@extends('master')

@section('title')
    {{$title}}
@endsection

@section('css')
s    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
@endsection

@section('js')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('.js-example-basic-single').select2({
                    placeholder: "Select an item"
                });

            $('.js-example-basic-single').on("change", function(){
                var idSelected = $('#select-items option:selected').val();
                var nameSelected = $('#select-items option:selected').text();
                var storeId = $('select[name=store_id]').val();
                var token = $('input[name=_token').val();
                $.ajax({
                    url: "processitem",
                    type: "POST",
                    data: {"_token": token, "id": idSelected, "name": nameSelected, "store_id": storeId},
                    success: function(result){
                        //append html
                        console.log(result);
                        $('#table-items tbody').append(result);
                    }
                });
            });

            function removeLine(id)
            {
            	console.log(id);
                $("#item-"+id).remove();
            }
        });
    </script>
@endsection

@section('content')
@if(isset($supplier))
    {{ Form::open(['url' => url('editsupplier/' . $supplier->id)]) }}
@else
    {{ Form::open(['url' => url('addsupplier')]) }}
@endif       
    <input type="hidden" name="_token" value="{{ csrf_token() }}">
    <h1 class="page-header col-lg-12">New Purchase Order</h1>
      <div class="form-group col-lg-6">
   		 <label for="inputState">Pemasok</label>
        <select id="inputState" class="form-control" name="supplier_id">
            <?php 
                $supplier_id = isset($purchaseOrder) ? $purchaseOrder->supplier_id : old('supplier_id');
            ?>
            @foreach ($suppliers as $supplier)
                <option value="{{ $supplier->id }}" {{ $supplier_id == $supplier->id ? 'selected' : '' }}>{{ $supplier->name }}</option>
            @endforeach
        </select>
      </div>
      <div class="form-group col-lg-6">
            <label for="inputState">Toko</label>
            <select id="inputState" class="form-control" name="store_id">
            <?php 
                $store_id = isset($purchaseOrder) ? $purchaseOrder->store_id : old('store_id');
            ?>
            @foreach ($stores as $store)
                <option value="{{ $store->id }}" {{ $store_id == $store->id ? 'selected' : '' }}>{{ $store->store_name }}</option>
            @endforeach
            </select>
          </div>     
          <div class="form-group col-lg-6">
                <p>Purchase order date:</p>
                <input type="date" name="po_date" value="{{ isset($purchaseOrder) ? $purchaseOrder->po_date : old('po_date') }}">
            </div>
            <div class="form-group col-lg-6">
                <p>Expeted On :</p>
                <input type="date" name="po_estimate_date" value="{{ isset($purchaseOrder) ? $purchaseOrder->po_estimate_date : old('po_estimate_date') }}">
            </div>
            <div class="form-group col-lg-12">
                <label>Note</label>
                <textarea class="form-control" rows="3" name="notes">{{ isset($purchaseOrder) ? $purchaseOrder->notes : old('notes') }}</textarea>
            </div>
            <div class="form-group col-lg-12">
                <h2>Items</h2>
            </div>
            <table id="table-items" class="table table-striped table-bordered table-hover">
                <thead>
                    <th>Items</th>
                    <th>In Stock</th>
                    <th>Incoming</th>
                    <th>Quantity</th>
                    <th>Purchase Cost</th>
                    <th>Amount</th>
                    <th></th>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div class="form-group col-lg-12">
                <select class="js-example-basic-single" id="select-items" data-items="{{ $items->toJson() }}" style="width:100%;">
                    <option></option>
                  @foreach ($items as $item)
                    <option value="{{ $item->id }}"> {{ $item->product_name }} </option>
                  @endforeach
                </select>
            </div>
            
            <div class="form-group col-lg-6">
                <h3>Total</h3>
            </div>       
        </div>
   
       
        <button type="submit" class="btn btn-default">Save</button>
        <button type="reset" class="btn btn-default">Clear</button>
        <button type="reset" class="btn btn-default">Cancel</button>
    

{{ Form::close() }}
<!-- /#page-wrapper -->

@endsection