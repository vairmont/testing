@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

                <div class="row">
                  <div class="col-lg-12">
                    <form class="form-inline">
                        
                            <label>Nama Pengubah Item</label>
                            <input class="form-control" placeholder="Item Modifier">
                            
                            <label>Nama Option</label>
                            <input class="form-control" placeholder="Option Name">
                        
                            <label>Price</label>

                            <input class="form-control" placeholder="Price">
                        
                            <button type="submit" class="btn btn-default">Submit Button</button>
                            <button type="reset" class="btn btn-default">Clear</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        
                        
                       
                      </form>
                  
              </div>
   


@endsection