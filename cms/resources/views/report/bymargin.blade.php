@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->
        <div class="container-fluid">
            <div>
                <h2>Laporan Margin G1</h2>
            </div>

            <div class="row">
            <p> </p>
            </div>
            <div class="row">
                <form class="form-inline" method="GET" action="{{url('/bymargin')}}"> 
                   
                    <div class="form-group">
                        <input type="date" class="form-control mr-sm-2" name="dayword1" @if(isset($request->dayword1)) value="{{$request->dayword1}}" @endif>
                        <p class="glyphicon glyphicon-minus"></p>
                        <input type="date" class="form-control mr-sm-2" name="dayword2" @if(isset($request->dayword2)) value="{{$request->dayword2}}" @endif>
                    </div>

                    <button type="submit" class="btn btn-primary">Filter</button>
                    <button type="submit" name="is_export" value="1" class="btn btn-primary">Export</button>
                </form>
            </div>

         
            <!-- /.row -->
            <div class="row">
            <!-- div col -->
                <div class="col-lg-12">
                    <!-- /.div 2 -->
                    <div class="table-responsive">
                        <table class=" sortable table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Tanggal</th>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Sales G1</th>
                                    <th>HPP</th>
                                    <th>GrosirOne Margin</th>
                                    <th>Insentif agen</th>
                                    <th>Net Margin</th>
                                    
                                </tr>
                            </thead>

                            <tbody>
                                @if(count($margin) > 0)
                                    @foreach($margin as $mar)
                                <tr>
                                    <td>{{$mar->create }}</td>
                                    <td>{{ $mar->proname }}</td>
                                    <td>{{ $mar->qty }}</td>
                                    <td>Rp.{{ number_format($mar->customer_price * $mar->qty * 0.95) }}</td>
                                    <td>Rp.{{ number_format($mar->cost * $mar->qty) }}</td>
                                    <td>Rp.{{ number_format(($mar->customer_price * $mar->qty * 0.95)-($mar->cost * $mar->qty)) }}</td>
                                    <td>Rp.{{ number_format($mar->customer_price * $mar->qty * 0.95 * $mar->rate / 100)}}</td>
                                    <td>Rp.{{ number_format((($mar->customer_price * $mar->qty * 0.95)-($mar->cost * $mar->qty))-(($mar->customer_price * $mar->qty * 0.95 * $mar->rate / 100)))}}</td>
                                </tr>
                                    @endforeach
                                @endif   
                            </tbody>
                            <tfoot>
                                    {{ $margin->appends($_GET)->links() }}
                        </tfoot>
                        </table>
                        <!-- /div 2 -->
                    </div>
                    <!-- /div col -->
                </div>
                <!-- /div row -->
            </div>


         <!-- /div container -->
        </div>
                                    
    
    
    <!-- /#wrapper -->

 @endsection
