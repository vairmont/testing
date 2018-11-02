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
                <th>Nama Agen</th>
                <th>Tanggal</th>
                <th>No Telepon</th>
                <th>Saldo Awal</th>
                <th>Amount</th>
                <th>Saldo Akhir</th>
            </tr>
        </thead>    
        <tbody>
                @if(count($his) > 0)
                @foreach($his->all() as $h)
                <tr>
                    <td>{{$h->name}}</td>
                    <td>{{$h->date}}</td>
                    <td>{{$h->phone}}</td>
                    <td>Rp.{{number_format($h->saldoakhir - $h->amount)}}</td>
                    <td>Rp.{{number_format($h->amount)}}</td>
                    <td>Rp.{{number_format($h->saldoakhir)}}</td>                                       
                    
                </tr>
                @endforeach
            @endif       
            </tr>
            <tr>
                <td style="border-color : transparent !important; border: none !important; "></td>
                <td style="border-color : transparent !important; border: none !important; "></td>
                <td>Total</td>
                <td>Rp.{{number_format( $total1 )}}</td>
                <td>Rp.{{number_format( $total2 )}}</td>
                <td>Rp.{{number_format( $total3 )}}</td>
            </tr>
                
        </tbody>
    </table> 

</body>
</html>