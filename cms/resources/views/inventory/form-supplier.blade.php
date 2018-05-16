@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

@if(isset($item))
    {{ Form::open(['url' => url('editsupplier/' . $supplier->id)]) }}
@else
    {{ Form::open(['url' => url('addsupplier')]) }}
@endif
    <h1 class="page-header col-lg-12">Supplier</h1>
    <div class="form-group col-lg-6">
       <label>Supplier Name :</label>
       <input class="form-control" placeholder="Nama supplier" name="name">
   </div>
   <div class="form-group col-lg-6">
        <label>Contact :</label>
        <input class="form-control" placeholder="Kontak" name="contact">
    </div>
    <div class="form-group col-lg-6">
        <label>Email :</label>
        <input class="form-control" placeholder="Email" name="email">
    </div>
    <div class="form-group col-lg-6">
        <label>Phone Number :</label>
        <input class="form-control" placeholder="Phone number" name="phone">
    </div>
    <div class="form-group col-lg-12">
        <label>Website :</label>
        <input class="form-control" placeholder="Website" name="website">
    </div>
    <div class="form-group col-lg-6">
        <label>Address 1 :</label>
        <textarea rows="4" class="form-control" placeholder="Alamat 1" name="address_1">
        </textarea>
    </div>
    <div class="form-group col-lg-6">
        <label>Address 2 :</label>
        <textarea rows="4" class="form-control" placeholder="Alamat 2" name="address_2">
        </textarea>
    </div>
    <div class="form-group col-lg-6">
        <label>City :</label>
        <input class="form-control" placeholder="Kota" name="city">
    </div>
    <div class="form-group col-lg-6">
        <label>zip code :</label>
        <input class="form-control" placeholder="Zip code" name="zipcode">
    </div>
    <div class="form-group col-lg-6">
        <label>Region/state/Province :</label>
        <input class="form-control" placeholder="Negara/State/provinsi" name="province">
    </div>
    <div class="form-group col-lg-6">
        <label>Catatan :</label>
        <textarea rows="4" class="form-control" placeholder="Catatan" name="notes">
        </textarea>
    </div>

    <div class="form-group col-lg-12">
        <button type="submit" class="btn btn-default">Submit Button</button>
        <button type="reset" class="btn btn-default">Clear</button>
    </div>                    
{{ Form::close() }}
<!-- /#page-wrapper -->

@endsection