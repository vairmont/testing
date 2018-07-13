@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    
    {{ Form::open(['url' => url('insert'), 'method' => 'post', 'enctype' => 'multipart/form-data']) }} 
<form class="form-horizontal" method="POST" action="{{url('/insert')}}">
{{csrf_field()}}
    <h1 class="page-header col-lg-12">Slider</h1>
 
    <!--DB product-->
    <div class="form-group col-lg-6">
        <label>Name</label>
        <input class="form-control" name="name" value="">
    </div>
    <!--DB product-->
    <div >
        <div class="form-group col-lg-6">
            <label>Page</label>
            <input class="form-control" placeholder="" name="page" value="">
        </div>
    </div>        
        <div class="form-group col-lg-6">
            <label>Image</label>
            <input type="file" class="form-control" name="photo">
            </div>
            
        </div>
        <div id="page-wrapper">
        <button type="submit" class="btn btn-default">Submit Button</button>
        <button type="reset" class="btn btn-default">Clear</button>
         </div>             
</form>
<!-- /#page-wrapper -->
{{ Form::close() }}
@endsection