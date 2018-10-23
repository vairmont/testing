@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->

        <div class="container-fluid">
            <div>
                <h2>Penjualan Per Product</h2>
            </div>

            <!-- /.row -->
            <div class="row">
                    <form class="form-inline" method="GET"> 
                            <div class="form-group">
                                    <input name="keyword" class="form-control mr-sm-2" type="text" placeholder="Nama Product" aria-label="Search" @if(isset($request->keyword)) value="{{$request->keyword}}" @endif>
                            </div>
                            <button type="submit" class="btn btn-primary">Filter</button>
                        <button type="submit" name="is_export" value="1" class="btn btn-primary">Export</button>
                    </form>
            <!-- div col -->
                <div class="col-lg-12">
                    <!-- /.div 2 -->
                    <div class="table-responsive">
                        <table class=" sortable table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Nama</th>
                                    <th>Quantity</th>
                                    <th>Modal</th>
                                </tr>
                            </thead>

                            <tbody>
                            @foreach($products as $p)
                                <tr>
                                    <td>{{ $p->product_name}}</a></td>
                                    <td>{{ number_format($byprod[$p->product_name]->qty) }}</td>
                                    <td>Rp.{{ number_format($byprod[$p->product_name]->modal) }}</td>
                                </tr>
                            @endforeach
                            </tbody>
                                <tfoot>
                
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
