@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

        <div class="container">
            <div class="row">
              <div class="col-lg-12">
                <a href="addsupplier" class="btn btn-primary">+ADD SUPPLIER</a>
              </div>
            </div>
        </div>
   
        <!-- /.panel-heading -->
      <div>
        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
          <thead>
            <tr>
              <th>Nama</th>
              <th>Kontak</th>
              <th>No.Telp</th>
              <th>Email</th>
              <th>Action</th>
            </tr>
          </thead>
          
          <tbody>
            @if(count($suppliers)> 0)
                @foreach($suppliers as $supplier)
            
                  <tr>
                    <td>{{$supplier -> name}}</td>
                    <td>{{$supplier -> contact}}</td>
                    <td>{{$supplier -> phone}}</td>
                    <td>{{$supplier -> email}}</td>
                    <td>
                    <a href="editsupplier/{{ $supplier->id }}">Edit</a>
                      <a href="deletesupplier/{{ $supplier->id }}">Delete</a>
                    </td>
                  </tr>
                  @endforeach
            @endif
          </tbody>
        </table>
      </div>

@endsection