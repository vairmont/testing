<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <table border="1" width="100%" cellpadding='0' cellspacing='0'>
        <thead>
            <tr>
                <th>No.</th>
                <th>Nama Agen</th>
                <th>Saldo Awal</th>
                <th>Amount</th>
                <th>Saldo Akhir</th>
                <th>Tanggal</th>
                <th>Nomor telpon</th>
            </tr>
        </thead>    
        <tbody>
            @foreach($his as $key => $h)
            <tr>
                <td>{{ $key + 1 }}</td>
                <td>{{$h->name}}</td>
                <td>Rp.{{number_format($h->saldoakhir - $h->amount)}}</td>
                <td>Rp.{{number_format($h->amount)}}</td>
                <td>Rp.{{number_format($h->saldoakhir)}}</td>
                <td>{{$h->date}}</td>
                <td>{{$h->phone}}</td>
            </tr>
            @endforeach
        </tbody>
    </table> 
</body>
</html>