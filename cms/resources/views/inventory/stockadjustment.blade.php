@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

        <div class="">
                <h2>Stock Adjustments</h1>
        </div>
<!--                       <button type="button" class="btn btn-primary form-inline form-group" data-toggle="modal" data-target="#additem">
                        Add
                      </button> -->
            <div class="">
              <form class="form-inline" enctype="multipart" method="GET" action="{{url('/bystockadjustment')}}"> 
                {{ csrf_field() }}
                  <div class="col-md-12">
                    <input type="text" class="form-control form-inline" name="keyword">
                    <select class="form-control form-inline" name="store_id">
                      <option value="">Semua</option>
                      @foreach($store as $stores)
                      <option value="{{$stores->id}}">{{$stores->store_name}}</option>
                      @endforeach
                    </select>
                      <button type="submit" class="btn btn-primary form-inline form-group">
                        Filter
                      </button>
                  </div>
              </form>
            </div>
            <br>

                    <!-- Modal add -->
                    <div class="modal fade" id="additem">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Add Stock</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="{{ url('/voucher/add') }}" enctype="multipart/form-data" method="POST">
                                    {{ csrf_field() }}
                                    <input type="hidden" name="action" value="Update Data">
                                <div class="modal-body">

                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Voucher Code</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="voucher_code" value="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Voucher Code</label>
                                            <div class="col-sm-10">
                                                <select name="product_type" class="form-control">
                                                  <option value="physical">Physical</option>
                                                  <option value="digital">Digital</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Start at End at</label>
                                            <div class='col-md-5'>
                                                <div class="form-group">
                                                    <div class='input-group date' id='datetimepicker6'>
                                                        <input type='text' name="valid_from" class="form-control" placeholder="Start Date">
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class='col-md-5'>
                                                <div class="form-group">
                                                    <div class='input-group date' id='datetimepicker7'>
                                                        <input type='text' name="valid_until" class="form-control" placeholder="End Date">
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Quota</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="quota" value="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Quota Per Account</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="quota_per_account" value="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Discount</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="discount" value="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Cashback</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="cashback" value="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Min Purchase</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="min_purchase" value="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Bonus Item</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="bonus_item" value="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Description</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" name="description"></textarea>
                                            </div>
                                        </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="col-md-8">
                                        <button type="submit" class="btn btn-primary">Confirm</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <br>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered sortable table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Store Name</th>
                                                <th>Product Name</th>
                                                <th>Cost</th>
                                                <th>Quantity</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                          @if($stock)
                                             @foreach($stock as $stocks)
                                              {{ Form::open(['url' => url('editstock/' . $stocks->id), 'method' => 'post', 'enctype' => 'multipart/form-data']) }}
                                            <tr>
                                                <td>{{$stocks->store_name}}</td>
                                                <td>{{$stocks->product_name}}</td>
                                                <td>Rp.{{number_format($stocks->cost)}},-</td>
                                                <td><input class="form-control" name="quantity" type="number" value="{{ $stocks->quantity}}"></td>
                                                <td><button type="button" class="btn btn-primary btn-sm"  data-toggle="modal" data-target="#edit-{{$stocks->id}}">Confirm</button></td>
                                                <!-- modal -->
                                                <div class="modal fade" id="edit-{{$stocks->id}}" tabindex="-1" role="dialog" aria-labelledby="editmodal" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                      <div class="modal-content">
                                                        <div class="modal-header">
                                                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                          <h4 class="modal-title" id="editmodal">Confirmation</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                          <textarea class="form-control" rows="5" name="reason" type="text" value="" placeholder="write your note here..." required=""></textarea>
                                                        </div>
                                                        <div class="modal-footer">
                                                          <button type="submit" class="btn btn-primary">Save</button>
                                                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </div>
                                                      </div><!-- /.modal-content -->
                                                    </div><!-- /.modal-dialog -->
                                                  </div><!-- /.modal -->
                                            </tr>
                                            {{ Form::close() }}
                                            @endforeach
                                          @endif
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                    </div>
    </div>   
@endsection