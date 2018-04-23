@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

            <div class="row">
              <div class="col-lg-12">
                <form class="form-inline">
                    <h1>Pengubah item</h1>

                    <img src="https://cdn3.iconfinder.com/data/icons/folders-outline/512/agreed_approved_folder_endorsed_ok_validate_archive-512.png" alt="" width="280" height="280">
                    <p class="help-block">Membuat set opsi yang dapat diterapkan ke item.</p>
                    <div class="form-group col-3 ">
                            <a href="addmodifier" class="btn btn-primary">+TAMBAHKAN PENGUBAH</a>
                    </div>  
                   
                  </form>
              
          </div>


@endsection