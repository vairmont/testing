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
    <table border="1" width="100%" cellpadding='0' cellspacing='0'>
        <thead>
            <tr>
                <th>Waktu pengajuan</th>
            	<th>Nama</th>
                <th>Amount</th>
                <th>No.Rek</th>
                <th>Bank</th>
            </tr>
        </thead>    
        <tbody>
            @foreach($draw as $draw)
            <tr style="text-align: top">
             	<td>{{ Carbon\Carbon::parse($draw->date)->format('d M Y H:i:s') }}</td>
                <td>{{$draw->name}}</td>
                <td>Rp {{number_format($draw->amount)}}</td>
                <td>{{ $draw-> nokredit }}</td>
                <td>{{ $draw->bank}}</td>
            </tr>
            @endforeach   
        </tbody>
    </table> 
    <p style="text-align: right;"><br>Di setujui<br>
        <br>
        <br>
        <br>
        <br>
        <br>
        Erben
        </p>
</body>
</html>
