@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')
<div class="container">
  <div class="row">
    <div class="col-lg-12">
      @if(isset($category))
          {{ Form::open(['url' => url('editkategori/' . $category->id)]) }}
      @else
          {{ Form::open(['url' => url('addkategori')]) }}
      @endif
         <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <div class="form-group col-lg-4">
           <label>Nama Kategori</label>
           <input class="form-control" name="name" placeholder="Category Name" required value="{{ isset($category) ? $category->name : old('name') }}">
         </div>
               
        <div class="form-group col-lg-12">
          <button type="submit" class="btn btn-success">Save</button>
          <button type="reset" class="btn btn-danger">Clear</button>
        </div>
      {{ Form::close() }}     
    </div>
  </div>
</div>

<!-- jQuery -->
    <script src="{{ asset('sbadmin/vendor/jquery/jquery.min.js') }}"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="{{ asset('sbadmin/vendor/bootstrap/js/bootstrap.min.js') }}"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="{{ asset('sbadmin/vendor/metisMenu/metisMenu.min.js') }}"></script>

    <!-- Custom Theme JavaScript -->
    <script src="{{ asset('sbadmin/dist/js/sb-admin-2.js') }}"></script>

@endsection