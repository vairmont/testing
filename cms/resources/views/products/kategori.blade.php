@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')
<div class="container-fluid">

<div class="">
                <h2>Kategori</h1>
        </div>

  <div class="form-group">
    <a href="addkategori" class="btn btn-primary">+ADD CATEGORY</a>
  </div>
  <div class="col-lg-12">
   
        <!-- /.panel-heading -->
      <div>
        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
          <thead>
            <tr>
              <th>Kategori</th>
              <th>Action</th>
            </tr>
          </thead>
          
          <tbody>
              @if ($categories)
                @foreach ($categories as $category)
                  <tr>
                    <th>{{ $category->name }}</th>
                    <th>
                      <a href="editkategori/{{ $category->id }}" type="button" class="btn btn-info">Edit</a>
                      <a href="deletekategori/{{ $category->id }}" type="button" class="btn btn-danger">Delete</a>
                    </th>
                  </tr>
                @endforeach
              @endif
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="{{ asset('sbadmin/vendor/jquery/jquery.min.js') }}"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="{{ asset('sbadmin/vendor/bootstrap/js/bootstrap.min.js') }}"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="{{ asset('sbadmin/vendor/metisMenu/metisMenu.min.js') }}"></script>

    <!-- Custom Theme JavaScript -->
    <script src="{{ asset('sbadmin/dist/js/sb-admin-2.js') }}"></script>

@endsection