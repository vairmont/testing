@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->
        <div class="container-fluid">
        
            <div>
                <h2>Pesanan Pembelian</h2>
            </div>

                <form class="form-inline"> 
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">+Tambah Pemesanan pembelian</button>

                    <!-- form group -->
                    <div class="form group">
                               
                                <input type="date" name="">
                     
                                <select id="inputState" class="form-control">
                                <option selected>All Item</option>
                                <option>Draft</option>
                                <option>Pending</option>
                                <option>Pending</option>
                                <option>Partially received</option>
                                <option>Close</option>
                        </select>
                        <select id="inputState" class="form-control">
                                <option selected>All Supllier</option>
                                <option>No category</option>
                               
                        </select>
                        <select id="inputState" class="form-control">
                                <option selected>Semua Toko</option>
                                <option>Mobile MiniGrosir</option>
                                <option>Toko MiniGrosir</option>
                        </select>
                       <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    </div>
                  </form>
                  
            <!-- /.row -->
            <div class="row">
            <!-- div col -->
                <div class="col-lg-12">
                    <!-- /.div 2 -->
                    <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Purchase Order#</th>
                                        <th>Tanggal</th>
                                        <th>Pemasok</th>
                                        <th>Toko</th>
                                        <th>Status</th>
                                        <th>Received</th>
                                        <th>Expeted on</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>

                                <tbody>
                                
                                </tbody>
                            </table>
                        <!-- /div 2 -->
                    </div>
                    <!-- /div col -->
                </div>
                <!-- /div row -->
            </div>


         <!-- /div container -->
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
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
              </div>     
    
    
    <!-- /#wrapper -->

 @endsection
