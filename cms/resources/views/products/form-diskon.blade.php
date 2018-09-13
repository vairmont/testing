@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

@if(isset($discount))
    {{ Form::open(['url' => url('editdiskon/' . $discount->id)]) }}
@else
    {{ Form::open(['url' => url('adddiskon')]) }}
@endif
  <h1>Discounts</h1>
  <p class="help-block">Diskon bisa diaplikasikan selama penjualan.</p>

  <div class="modal-content">
    <div class="modal-header">
      <h4 class="modal-title">Create Option</h4>
    </div>
    <div class="modal-body col-lg-12">
       <div class="form-group col-lg-12">
           <label>Nama Discount</label>
           <input class="form-control" placeholder="Discount Name" name="name" required value="{{ isset($discount) ? $discount->name : old('name') }}">
       </div>
       <div class="form-group col-lg-12">
          <label>Type</label>
          <label class="radio-inline">
            <input type="radio" name="type" id="optionsRadiosInline1" value="percent" {{ isset($discount) && $discount->type =="percent" ? "checked" : "" }}>Persentasi
          </label>
          <label class="radio-inline">
            <input type="radio" name="type" id="optionsRadiosInline2" value="amount" {{ isset($discount) && $discount->type =="amount" ? "checked" : "" }}>Jumlah
          </label>
      </div>
      <div class="form-group col-lg-6">
          <label>Jumlah</label>
          <input class="form-control" placeholder="Value" name="rate" required value="{{ isset($discount) ? $discount->rate : old('rate') }}">
      </div>
      <div class="form-group col-lg-6">
      <p class="help-block">Diskon bisa diaplikasikan selama penjualan.</p>
      </div>
      <div class="form-group col-lg-6">
          <div class="radio">
              <label class="checkbox-inline">
                  <input type="checkbox" name="restriction" {{ isset($discount) && $discount->restriction == 1 ? "checked" : "" }}>Akses Terbatas
              </label>
          </div>
      </div>
      <div class="form-group col-lg-6">
      <p class="help-block">Karyawan harus memasukkan PIN yang benar agar bisa melakukan diskon</p>
        <button type="submit" class="btn btn-primary">Save</button>
        <button type="reset" class="btn btn-danger">Clear</button>
      </div>
    </div>

.
  </div>
{{ Form::close() }}

@endsection