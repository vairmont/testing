<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

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
            	<th>Tanggal Pengajuan<th>
                <th>Nama</th>
                <th>Amount</th>
                <th>No.Rek</th>
                <th>Bank</th>
            </tr>
        </thead>    
        <tbody>
            <tr style="text-align: top">
             	<td>{{$draw->date}}<br>
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
                  </td>
                  
                  
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
  
</body>
</html>
