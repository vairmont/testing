<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h2 style="text-align:right;">INVOICE</h2>
    <h3>PT. MITRA GROSIR NUSANTARA</h3>
    <div class="col-lg-6">
        <p> Jl.Boulevard Gading Serpong Pakulonan Barat,Kelapa dua,
            <br>Tangerang 15810 Banten, Ruko Rodeo Paramount, Block C No 22
        </p>
    </div>
    <p style="text-align:right;">Date   :
        {{ Carbon\Carbon::now()->format('d M Y ') }}
    </p>
    <h3>To</h3>
    @foreach($withdraw as $draw)
        Name     : {{ $draw ->name }}<br>
    </p>
    <table border="1" width="100%" cellpadding='0' cellspacing='0'>
        <thead>
            <tr>
                <th>Nama</th>
                <th>Amount</th>
                <th>No.Rek</th>
                <th>Bank</th>
            </tr>
        </thead>    
        <tbody>
            <tr style="text-align: top">
                  <td>{{$draw->name}}<br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br></td>
                  <td>
                  Rp. {{number_format($draw->amount)}}
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br></td>
                  <td>{{ $draw-> nokredit }}<br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br></td>
                  <td>{{$draw->bank}}<br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                 
            
            <tr>      
                @endforeach
        </tbody>
    </table> 
    <p style="border:1px solid #333; padding:5px;">Rekening<br>
        Account :566 80 000 9518<br>
        A.n PT.MITRA GROSIR NUSANTARA<br>
        BANK OCBC NISP
        </p>
    <p>Dokumen ini Sah<br>
       Telah ditandatangani secara elektronik 
    </p>
</body>
</html>
