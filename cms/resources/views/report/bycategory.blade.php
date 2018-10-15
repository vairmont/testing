@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->

        <div class="container-fluid">
            <div>
                <h2>Penjualan Per Kategori</h2>
            </div>

            <!-- /.row -->
            <div class="row">
                    <form class="form-inline" method="GET" action="{{url('/bycategory')}}"> 
                        <button type="submit" name="is_export" value="1" class="btn btn-primary">Export</button>
                    </form>
            <!-- div col -->
                <div class="col-lg-12">
                    <!-- /.div 2 -->
                    <div class="table-responsive">
                        <table class=" sortable table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Kategori</th>
                                    <th>Barang terjual</th>
                                    <th>Total</th>
                                </tr>
                            </thead>

                            <tbody>
                                @foreach($categories as $c)
                                <tr>
                                    <td><a href="{{ url('/byproduct', $c->name) }}" style="color: green;">{{ $c->name}}</a></td>
                                    <td>{{ number_format($bycat[$c->name]->qty) }}</td>
                                    <td>Rp.{{ number_format($bycat[$c->name]->modal) }}</td>
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
