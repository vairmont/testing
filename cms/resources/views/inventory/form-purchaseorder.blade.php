@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

@if(isset($supplier))
    {{ Form::open(['url' => url('editsupplier/' . $supplier->id)]) }}
@else
    {{ Form::open(['url' => url('addsupplier')]) }}
@endif       
    <h1 class="page-header col-lg-12">New Purchase Order</h1>
      <div class="form-group col-lg-6">
   		 <label for="inputState">Pemasok</label>
        <select id="inputState" class="form-control">
                <option selected>1</option>
                <option>2</option>
                <option>3</option>
        </select>
      </div>
      <div class="form-group col-lg-6">
            <label for="inputState">Toko</label>
            <select id="inputState" class="form-control">
              <option selected>Mobile MiniGrosir</option>
              <option>Toko MiniGrosir</option>
            </select>
          </div>     
          <div class="form-group col-lg-6">
                <form action="/action_page.php">
                    <p>Purchase order date:</p>
                    <input type="date" name="bday">
                  </form>
            </div>
            <div class="form-group col-lg-6">
                <form action="/action_page.php">
                    <p>Expeted On :</p>
                    <input type="date" name="bday">
                  </form>
            </div>
            <div class="form-group col-lg-12">
                <label>Note</label>
                <textarea class="form-control" rows="3"></textarea>
            </div>
            <div class="form-group col-lg-12">
                <h2>Items</h2>
            </div>
            <div class="form-group col-lg-2">
                <p class="help-block">In stock</p>
            </div>
            <div class="form-group col-lg-2">
                <p class="help-block">Incoming</p>
            </div>
            <div class="form-group col-lg-2">
                <p class="help-block">Quantity</p>
            </div>
            <div class="form-group col-lg-2">
                <p class="help-block">Purchase cost</p>
            </div>
            <div class="form-group col-lg-2">
                <p class="help-block">Amount</p>
            </div>
            <div class="form-group col-lg-12">
                <label></label>
                <input class="form-control" placeholder="Search">
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