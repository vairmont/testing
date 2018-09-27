@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

  
    </table>
        <div class="">
                <h2>Edit Harga</h1>
        </div>

            <div class="row">
                    {{ Form::open(['url' => url('modifier'), 'method' => 'get']) }}
                    <div class="form-group col-md-6">
                            <label for="inputState">Category</label>
                            <select id="inputState" class="form-control" name="category_id">
                              <option value="all" selected>All Item</option>
                              @if ($categories)
                                @foreach ($categories as $category)
                                  <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                              @endif
                            </select>
                    </div>
            

                        <div class="form-group col-md-6">
                                <label for="inputState">Stock Alert</label>
                                <select id="inputState" class="form-control" name="stock">
                                  <option value="all" selected>All Item</option>
                                  <option value="low">Low Stock</option>
                                  <option value="sold">Out Of Stock</option>
                                </select>
                        </div>
                        <div class="col-md-6">
                        <input class="form-control mr-sm-2" type="text" name="product_name" placeholder="Product Name" aria-label="Search">
                        <button type="submit" class="btn btn-primary">Search</button>
                        <button class="btn btn-danger"type="reset" value="Reset">Clear</button>
                        </div>
                        <div class="col-md-6">
                        <button type="submit" name="export" value="1" class="btn btn-success">Export</button>
                        </div>
                </div>
                  {{ Form::close() }}

                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover sortable" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Nama Barang</th>
                                                <th>Kategori</th>
                                                <th>Harga Jual(Rp.)</th>
                                                <th>Harga Modal (Rp.)</th>
                                                <th>Harga Diskon (Rp.)</th>
                                                <th>Margin (Rp.)</th>
                                                <th>Persentase (%)</th>
                                                <th>Stock</th>
                                                <th>Pengedit</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            @if ($items)
                                              @foreach ($items as $item)
                                              {{ Form::open(['url' => url('editmodifier/' . $item->id), 'method' => 'post', 'enctype' => 'multipart/form-data']) }}
                                                <tr>
                                                  <td>{{$item->product_name}}</td>
                                                  <td>{{$item->category->name}}</td>
                                                  <td><input class="form-control" name="price_for_customer" type="number" value="{{$item->price_for_customer}}" value=""></td>
                                                  <td><input class="form-control" name="cost" type="number" value="{{ $item->cost}}"></td>
                                                  <td><input class="form-control" name="promo_price" type="number" value="{{ $item->promo_price}}"></td>
                                                  <td>{{$item->margin}}</td>
                                                  <td>{{ number_format( $item->margin/$item->cost*100, 2) }}</td>
                                                  <td>{{ isset($item->stock) ? $item->stock->quantity : "0" }}</td>
                                                  <td>{{ $item->updated_by }}</td>
                                                  <td>
                                                    <button class="btn btn-primary" type="submit">Edit</button>
                                                  </td>
                                                </tr>
                                                {{ Form::close() }}
                                              @endforeach
                                            @endif
                                        </tbody>
                                        <tfoot>
                                          {{ $items->links() }}
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                    </div>

            
        

    </div>   

 

@endsection