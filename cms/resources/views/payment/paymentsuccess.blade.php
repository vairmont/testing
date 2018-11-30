@extends('paymentmaster')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">
        <div class="row text-center">
            <div class="col-sm-6 col-sm-offset-3">
            <br><br> <h2 style="color:#0fad00">Success</h2>
            <img src="http://osmhotels.com//assets/check-true.jpg">
            <p style="font-size:20px;color:#5C5C5C;">Terima Kasih. Pembayaran anda sukses, silahkan klik tombol dibawah untuk kembali berbelanja.</p>
            <a href=""><button type="submit" class="btn btn-primary">Kembali</button></a>
            <br><br>
            </div>

        </div>
        
    </div>  
    <!-- container -->
    </div>
@endsection