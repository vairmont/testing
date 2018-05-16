@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

        <div class="container">
            <div class="row">
              <div class="col-lg-12">
                <form class="form-inline">
                    
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">+Add Supplier</button>
                    <div class="col-lg-12">
   
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
                @foreach($suppliers ->all() as $supplier)
            
                  <tr>
                    <td>{{$supplier -> name}}</td>
                    <td>{{$supplier -> contact}}</td>
                    <td>{{$supplier -> phone}}</td>
                    <td>{{$supplier -> email}}</td>
                    <td>
                    <a href="#">Edit</a>
                      <a href="#">Delete</a>
                    </td>
                  </tr>
                  @endforeach
            @endif
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
                    
                      <!-- Modal -->
                      <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                        
                          <!-- Modal content-->
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              <h4 class="modal-title">Create Option</h4>
                            </div>
                            <div class="modal-body col-lg-12">
                                   <div class="form-group col-lg-12">
                                        <label>Supplier Name :</label>
                                        <input class="form-control" placeholder="Nama supplier">
                                    </div>
                                       <div class="form-group col-lg-12">
                                        <label>Contact :</label>
                                        <input class="form-control" placeholder="Kontak">
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label>Email :</label>
                                        <input class="form-control" placeholder="Email">
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label>Phone Number :</label>
                                        <input class="form-control" placeholder="Phone number">
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label>Website :</label>
                                        <input class="form-control" placeholder="Website">
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label>Address 1 :</label>
                                        <input class="form-control" placeholder="Alamat 1">
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label>Address 2 :</label>
                                        <input class="form-control" placeholder="Alamat 2">
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>City :</label>
                                        <input class="form-control" placeholder="Kota">
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>zip code :</label>
                                        <input class="form-control" placeholder="Zip code">
                                    </div>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Region/state/Province :</label>
                                        <input class="form-control" placeholder="Negara/State/provinsi">
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label>Catatan :</label>
                                        <input class="form-control" placeholder="Catatan">
                                </div>
                       
                           
                            <button type="submit" class="btn btn-default">Save</button>
                            <button type="reset" class="btn btn-default">Clear</button>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            </div>
                          </div>
                  </form>
                  </div>
                  </div>
                  </div>
                 
              
          </div>
    </div>
    <!-- /#wrapper -->

@endsection