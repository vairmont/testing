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
    <h1 class="page-header col-lg-12">Supplier</h1>
    <div class="form-group col-lg-6">
       <label>Supplier Name :</label>
       <input class="form-control" placeholder="Nama supplier" name="name" value="{{ isset($supplier) ? $supplier->name : old('name')}}">
   </div>
   <div class="form-group col-lg-6">
        <label>Contact :</label>
        <input class="form-control" placeholder="Kontak" name="contact" value="{{ isset($supplier) ? $supplier->contact : old('contact')}}">
    </div>
    <div class="form-group col-lg-6">
        <label>Email :</label>
        <input class="form-control" placeholder="Email" name="email" value="{{ isset($supplier) ? $supplier->email : old('email')}}">
    </div>
    <div class="form-group col-lg-6">
        <label>Phone Number :</label>
        <input class="form-control" placeholder="Phone number" name="phone" value="{{ isset($supplier) ? $supplier->phone : old('phone')}}">
    </div>
    <div class="form-group col-lg-12">
        <label>Website :</label>
        <input class="form-control" placeholder="Website" name="website" value="{{ isset($supplier) ? $supplier->website : old('website')}}">
    </div>
    <div class="form-group col-lg-6">
        <label>Address 1 :</label>
        <textarea rows="4" class="form-control" placeholder="Alamat 1" name="address_1">
            {{ isset($supplier) ? $supplier->address_1 : old('address_1')}}
        </textarea>
    </div>
    <div class="form-group col-lg-6">
        <label>Address 2 :</label>
        <textarea rows="4" class="form-control" placeholder="Alamat 2" name="address_2">
            {{ isset($supplier) ? $supplier->address_2 : old('address_2')}}
        </textarea>
    </div>
    <div class="form-group col-lg-6">
        <label>City :</label>
        <input class="form-control" placeholder="Kota" name="city" value="{{ isset($supplier) ? $supplier->city : old('city')}}">
    </div>
    <div class="form-group col-lg-6">
        <label>zip code :</label>
        <input class="form-control" placeholder="Zip code" name="zipcode" value="{{ isset($supplier) ? $supplier->zipcode : old('zipcode')}}">
    </div>
    <div class="form-group col-lg-6">
        <label>Region/state/Province :</label>
        <input class="form-control" placeholder="Negara/State/provinsi" name="province" value="{{ isset($supplier) ? $supplier->province : old('province')}}">
    </div>
    <div class="form-group col-lg-6">
        <label>Catatan :</label>
        <textarea rows="4" class="form-control" placeholder="Catatan" name="notes">
            {{ isset($supplier) ? $supplier->notes : old('notes')}}
        </textarea>
    </div>

    <div class="form-group col-lg-12">
        <button type="submit" class="btn btn-default">Submit Button</button>
        <button type="reset" class="btn btn-default">Clear</button>
    </div>                    
{{ Form::close() }}
<!-- /#page-wrapper -->

@endsection