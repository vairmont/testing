@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

        <div class="container">
            <div class="row">
              <div class="col-lg-12">
                <form class="form-inline">
                    
                    <div class="form-group col-3 ">
                        <label for="inputState">Semua Toko</label>
                        <select id="inputState" class="form-control">
                            <option selected>Semua Toko</option>
                            <option>Mobile MiniGrosir</option>
                            <option>Toko MiniGrosir</option>
                          </select>
                      </div>
                    <div class="form-group col-3 ">
                            <label for="inputState">All Category</label>
                            <select id="inputState" class="form-control">
                              <option selected>All Category</option>
                              <option>BAHAN KUE</option>
                              <option>PROMOSI</option>
                              <option>PACKAGING</option>
                              <option>NOODLE</option>
                            </select>
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
                                   <div class="col-lg-3">
                                        <p>Total inventory value</p>
                                        <h2>888</h2>
                                   </div>
                                   <div class="col-lg-3">
                                    <p>Total retail value</p>
                                    <h2>4.342</h2>
                               </div>
                               <div class="col-lg-3">
                                <p>Potential profit</p>
                                <h2>3.4537</h2>
                           </div>
                           <div class="col-lg-3">
                            <p>Margin</p>
                            <h2>79,54%</h2>
                       </div>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Transfer Order #</th>
                                                <th>Tanggal</th>
                                                <th>Received</th>
                                                <th>Source store</th>
                                                <th>Destination store</th>
                                                <th>Status</th>
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
    </div>
    <!-- /#wrapper -->

@endsection
