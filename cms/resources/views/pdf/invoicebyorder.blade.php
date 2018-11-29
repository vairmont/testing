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
    <h3>Transaksi</h3>
    @foreach($flowreport as $flow)
    <p><b>Agen</b><br>
       Nama : {{ $flow->name }}
    </p>
    
    <p><b>Customer</b><br>
       Nama : {{ $flow->name }}
    </p>
    <table border="1" width="100%" cellpadding='0' cellspacing='0'>
        <thead>
            <tr>
                <th>Order</th>
                <th>Nama Produk</th>
                <th>Qty</th>
                <th>Margin</th>
                <th>Insentif</th>
                <th>Paid by Agen</th>
                <th>Paid by Customer</th>
            </tr>
        </thead>    
        <tbody>
            <tr style="text-align: top">
                  
            </tr>
            <tr>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
            </tr>
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