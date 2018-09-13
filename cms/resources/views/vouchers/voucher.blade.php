@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

  
    </table>
        <div class="">
                <h2>Daftar Voucher</h1>
        </div>

            <div class="">
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#additem">
                    Add Voucher
                  </button>
            </div>
            <br>

                    <!-- Modal add -->
                    <div class="modal fade" id="additem">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Add Voucher</h4>
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
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Voucher Code</th>
                                                <th>Product Type</th>
                                                <th>Valid From</th>
                                                <th>Valid Until</th>
                                                <th>Quota</th>
                                                <th>Quota Per Account</th>
                                                <th>Discount</th>
                                                <th>Cash Back</th>
                                                <th>Min Purchase</th>
                                                <th>Bonus Item</th>
                                                <th>Description</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            @foreach($voucher as $vouchers)
                                            <tr>
                                                <td>{{$vouchers->voucher_code}}</td>
                                                <td>{{$vouchers->product_type}}</td>
                                                <td>{{$vouchers->valid_from}}</td>
                                                <td>{{$vouchers->valid_until}}</td>
                                                <td>{{$vouchers->quota}}</td>
                                                <td>{{$vouchers->quota_per_account}}</td>
                                                <td>{{$vouchers->discount}}</td>
                                                <td>{{$vouchers->cashback}}</td>
                                                <td>{{$vouchers->min_purchase}}</td>
                                                <td>{{$vouchers->bonus_item}}</td>
                                                <td>{{$vouchers->description}}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                    </div>

            
        

    </div>   
 
 <script type="text/javascript">
            $('#datetimepicker6').datetimepicker({
                format: 'YYYY-MM-DD HH:mm:ss',
                sideBySide: true,
                extraFormats: [ 'DD.MM.YYYY LT', 'DD-MM-YYYY HH:mm:ss' ]
            });
            $('#datetimepicker7').datetimepicker({
                format: 'YYYY-MM-DD HH:mm:ss',
                sideBySide: true,
                extraFormats: [ 'DD.MM.YYYY LT', 'DD-MM-YYYY HH:mm:ss' ],
                useCurrent: false //Important! See issue #1075
            });
            $("#datetimepicker6").on("dp.change", function (e) {
                $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
            });
            $("#datetimepicker7").on("dp.change", function (e) {
                $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
            });
    </script>
@endsection