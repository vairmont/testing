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
                    placeholder: "Select an item",
                });

            $('.js-example-basic-single').on("change", function(){
                var idSelected = $('#select-items option:selected').val();
                var nameSelected = $('#select-items option:selected').text();
                var storeId = $('select[name=store_id]').val();
                var token = $('input[name=_token').val();
                if (idSelected!=='') {
	                $.ajax({
	                    url: "processitem",
	                    type: "POST",
	                    data: {"_token": token, "id": idSelected, "name": nameSelected, "store_id": storeId},
	                    success: function(result){
	                        //append html
	                        $('#table-items tbody').append(result);
	                        $('.js-example-basic-single').val(null).trigger('change');
	                    }
	                });
                }
            });
            
            $('tbody').on("keypress", '.item-price', function (){
            	var totalPrice = $('.total-price').text();
            	var id = this.id.split('-');
            	var price = this.value;

            	var qty = $('#qty-'+id).val();
            	var total = qty * price;

            	totalPrice = parseInt(totalPrice) + parseInt(total);

            	// $('<p>'+total+'/<p>').appendTo('#total-'+id);
            	$('#total-'+id).append('<p>'+total+'/<p>');
            	$('.total-price').empty().text(totalPrice);
            });

            $('tbody').on("click", '.remove-line', function (){
            	var id = this.id.split('-');
            	id = id[1];
                $("#item-"+id).remove();
            });
        });
    </script>
@endsection

@section('content')
@if(isset($supplier))
    {{ Form::open(['url' => url('editpurchaseorder/' . $purchaseOrder->id)]) }}
@else
    {{ Form::open(['url' => url('addpurchaseorder')]) }}
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
                    <th>Quantity</th>
                    <th>Purchase Cost</th>
                    <th>Amount</th>
   					@if (isset($purchaseOrder) && $purchaseOrder->status == 'Pending')
                    <th></th>
                    @endif
                </thead>
                <tbody>
                	<?php $total = 0; ?>
                	@if (isset($purchaseOrder->purchaseOrderDetails))
                		@foreach ($purchaseOrder->purchaseOrderDetails as $detail)
                			<?php $total += $detail->price * $detail->quantity; ?>
                			<tr id='item-{{ $detail->product_id }}'>
			                    <td><input type='hidden' name='product_id[]' value='{{ $detail->product_id }}'>
			                        {{ $detail->product->product_name }}
			                    </td>
			                    <td>
   									@if (isset($purchaseOrder) && $purchaseOrder->status == 'Pending')
			                        <input type='numeric' name='quantity[]' class='' id='qty-{{ $detail->product_id }}' value='{{ $detail->quantity }}'>
			                        @else
			                        	{{ $detail->quantity }}
			                        @endif
			                    </td>
			                    <td>
			                        Rp. 
   									@if (isset($purchaseOrder) && $purchaseOrder->status == 'Pending')
			                        <input type='numeric' name='price[]' class='item-price' id='price-{{ $detail->product_id }}' value='{{ number_format($detail->price, 2) }}'>
			                        @else
			                        	{{ number_format($detail->price, 2)}}
			                        @endif
			                    </td>
			                    <td class='item-total' id='total-{{ $detail->product_id }}'>
			                    	Rp. {{ number_format($detail->price * $detail->quantity, 2) }}
			                    </td>
   								@if (isset($purchaseOrder) && $purchaseOrder->status == 'Pending')
			                    <td>
			                        <a class='remove-line' id='remove-{{ $detail->product_id }}'>Remove</a>
			                    </td>
			                    @endif
			                </tr>
                		@endforeach
                	@endif
                </tbody>
            </table>
            <div class="form-group col-lg-12">
   				@if (isset($purchaseOrder) && $purchaseOrder->status == 'Pending' || !$purchaseOrder)
                <select class="js-example-basic-single" id="select-items" data-items="{{ $items->toJson() }}" style="width:100%;">
                    <option></option>
                  @foreach ($items as $item)
                    <option value="{{ $item->id }}"> {{ $item->product_name }} </option>
                  @endforeach
                </select>
                @endif
            </div>
            
            <div class="form-group col-lg-6">
                <h3>Total</h3>
                <p class="total-price">Rp. {{ number_format($total, 2) }}</p>
            </div>       
        </div>
   		
		<?php $base_url = URL::to('/'); ?>
   		@if (isset($purchaseOrder) && $purchaseOrder->status == 'Pending')
	        <button type="submit" class="btn btn-primary">Save</button>
	        <a href="{{ $base_url }}/changestatuspo/{{ $purchaseOrder->id }}/Close" class="btn btn-success">RECEIVED</a>
	        <a href="{{ $base_url }}/changestatuspo/{{ $purchaseOrder->id }}/Cancel" class="btn btn-danger">CANCEL</a>
        @endif
        
        <a href="{{ $base_url }}/bypurchaseorder" class="btn btn-default">Back</a>

{{ Form::close() }}
<!-- /#page-wrapper -->

@endsection