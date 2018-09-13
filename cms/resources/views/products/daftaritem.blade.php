@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

  
    </table>
        <div class="">
                <h2>Daftar Item</h1>
        </div>

            <div class="row">
                    <div class="form-group col-md-12">
                        <a href="additem" class="btn btn-primary">+ADD ITEM</a>
                    </div>

                    {{ Form::open(['url' => url('daftaritem'), 'method' => 'get']) }}
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
                        <div class="form-group col-md-1">
                        <button type="submit" name="is_export" value="1" class="btn btn-success">Export</button>
                        </div>
                </div>
                  {{ Form::close() }}

                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Nama Barang</th>
                                                <th>Kategori</th>
                                                <th>Harga</th>
                                                <th>Biaya</th>
                                                <th>Margin</th>
                                                <th>Persediaan</th>
                                                <th>Description</th>
                                                <th>Shelf</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            @if ($items)
                                              @foreach ($items as $item)
                                                <tr>
                                                  <td>{{$item->product_name}}</td>
                                                  <td>{{$item->category->name}}</td>
                                                  <td>Rp.{{number_format( $item->price_for_customer)}}</td>
                                                  <td>Rp.{{number_format( $item->cost )}}</td>
                                                  <td>Rp.{{number_format( $item->margin )}}</td>
                                                  <td>{{ isset($item->stock) ? $item->stock->quantity : "0" }}</td>
                                                  <td>{{$item->description}}</td>
                                                  <td>{{$item->shelf}}</td>
                                                  <td>
                                                    <a href="edititem/{{ $item->id }}" type="button" class="btn btn-info">Edit</a>
                                                    <a href="deleteitem/{{ $item->id }}" type="button" class="btn btn-danger">Delete</a>
                                                  </td>
                                                </tr>
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