@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

        <div class="container">
            <div class="row">
              <div class="col-lg-12">
                <form class="form-inline">
                    
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">+Add StockAdjustment</button>

                    <div class="form-group col-3 ">
                        <label for="inputState">Status</label>
                        <select id="inputState" class="form-control">
                          <option selected>All Item</option>
                          <option>Draft</option>
                          <option>Pending</option>
                          <option>Partially received</option>
                          <option>Closed</option>
                        </select>
                      </div>
                    <div class="form-group col-3 ">
                            <label for="inputState">Supplier</label>
                            <select id="inputState" class="form-control">
                              <option selected>All Supplier</option>
                              <option>No Category</option>
                            </select>
                          </div>
                          <div class="form-group col-3 ">
                                <label for="inputState">Toko</label>
                                <select id="inputState" class="form-control">
                                  <option selected>Semua Toko</option>
                                  <option>Mobile MiniGrosir</option>
                                  <option>Toko MiniGrosir</option>
                                </select>
                                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                              </div>
                  </form>
                  <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">CMS MiniGrosir</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    ...
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Adjustment #</th>
                                                <th>Tanggal</th>
                                                <th>Reason</th>
                                                <th>Toko</th>
                                                <th>Quantity</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                       
                                        </tbody>
                                    </table>
          </div>
    </div>
    </div>
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
                        <div class="form-group col-lg-6">
                                <label for="inputState">Received Item</label>
                                <select id="inputState" class="form-control">
                                        <option selected>Iventory Count</option>
                                        <option>Loss</option>
                                        <option>Damage</option>
                                </select>
                              </div>
                              <div class="form-group col-lg-6">
                                    <label for="inputState">Destination store</label>
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
    </div>
    <!-- /#wrapper -->

@endsection