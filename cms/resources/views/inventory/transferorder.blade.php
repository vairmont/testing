@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">
                <h2>Transfer order</h1>
        </div>

            <div class="row">
                    <div class="form-group col-md-12">
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">+ADD TRANSFER ORDER</a>
                    </div>

                    
                    <div class="form-group col-md-4">
                            <label for="inputState">Category</label>
                            <select id="inputState" class="form-control" name="category_id">
                              <option value="all" selected>All Item</option>
                              
                                  
                                
                            </select>
                    </div>
            

                        <div class="form-group col-md-4">
                                <label for="inputState">Stock Alert</label>
                                <select id="inputState" class="form-control" name="stock">
                                  <option value="all" selected>All Item</option>
                                  <option value="low">Low Stock</option>
                                  <option value="sold">Out Of Stock</option>
                                </select>
                                <input class="form-control mr-sm-2" type="text" name="product_name" placeholder="Product Name" aria-label="Search">
                        </div>
                        <div class="form-group col-md-4">
                        <button type="submit" name="is_export" value="1" class="btn btn-default">Export</button>
                        <button type="submit" class="btn btn-default">Search</button>
                        <button type="reset" class="btn btn-default">Clear</button>
                        </div>
                </div>
                 

                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Transfer order</th>
                                                <th>Tanggal</th>
                                                <th>Received</th>
                                                <th>Source Store</th>
                                                <th>Destination store</th>
                                                <th>Status</th>
                                                <th>Quantity</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                              
                                             
                                        <tfoot>
                                         
                                        </tfoot>
                                    </table>
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
                              <h4 class="modal-title">Transfer Order</h4>
                            </div>
                            <div class="modal-body col-lg-12">
                                        <div class="form-group col-lg-6">
                                            <label>Toko Asal</label>
                                            <select class="form-control">
                                            <option>Mobile MiniGrosir</option>
                                            <option>Toko MiniGrosir</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label>Toko Tujuan</label>
                                            <select class="form-control">
                                            <option>Mobile MiniGrosir</option>
                                            <option>Toko MiniGrosir</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-lg-12">
                                        <form action="/action_page.php">
                                            <p>Tanggal pesanan transfer :</p>
                                            <input type="date" name="bday">
                                          </form>
                                    </div>
                                    <h2>Barang</h2>
                                    
                                    <input class="form-control mr-sm-2" type="text" name="product_name" placeholder="Barang" aria-label="Search">
                                </div>
                       
                           <div class="col-lg-12">
                            <button type="submit" class="btn btn-default">Create</button>
                            <button type="reset" class="btn btn-default">Clear</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            </div>
                            <div class="modal-footer">
                              
                            </div>
                          </div>
                  </form>
                  </div>

            
        

    </div>
                          


@endsection