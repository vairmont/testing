<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="{{ asset('css/invoicenov.css') }}" rel="stylesheet">
    <title>Document</title>
</head>
<body>
<div class="container">
<h2 style="text-align:center;">INVOICE</h2>
    <h2>PT. MITRA GROSIR NUSANTARA</h2>
    <div class="col-lg-6">
        <p class="small"> Jl.Boulevard Gading Serpong Pakulonan Barat,Kelapa dua,
            <br>Tangerang 15810 Banten, Ruko Rodeo Paramount, Block C No 22
        </p>
    </div>
    <h3>Transaksi</h3>
    @foreach($flowreport as $flow)
    <p><b>Customer</b><br>

       Nama   : {{ $flow->cusname }} <br>
       Order  : {{$flow->invoice}}<br>
       Date   : {{$flow->create}}<br> 
    </p>
    <table border="1" width="100%" cellpadding='0' cellspacing='0'>
        <thead>
            <tr style="text-align: center;">
                <th><font size="1">Nama Produk</font></th>
                <th><font size="1">Qty</font></th>
                <th><font size="1">Harga Jual</font></th>
                <th><font size="1">Diskon</font></th>
                <th><font size="1">DPP</font></th>
                <th><font size="1">PPN</font></th>
                <th><font size="1">Paid by Customer</font></th>
            </tr>
        </thead>    
        <tbody>
            <tr style="text-align: center;">
                <td><font size="1">{{$flow->proname}}</font></td>
                <td><font size="1">{{$flow->qty}}</font></td>
                <td><font size="1">
                    Rp.{{  /* DPP */
                        number_format(
                            (($flow->customer_price * $flow->qty * 0.95) / 1.1)+($flow->customer_price * $flow->qty * 0.05)
                        )
                    }}
                </font></td>
                <td><font size="1">
                    @if($flow->source == NULL)
                        Rp.0
                    @else
                        Rp.{{ /* Discount (Margin) */
                    number_format($flow->customer_price * $flow->qty * 0.05)}}
                    @endif
                </font></td>
                <td><font size="1">
                    Rp.{{ /* DPP setelah discount */
                        number_format(
                            ($flow->customer_price * $flow->qty * 0.95) / 1.1
                        )
                    }}
                </font></td>
                <td><font size="1">
                    @if($flow->tax == 0)
                        Rp.{{  /* PPN */
                            number_format( 
                                (
                                    (($flow->customer_price * $flow->qty * 0.95) / 1.1)
                                        ) / 100 * 10 
                                )
                            }}
                    @else
                        0
                    @endif
                </font></td>
                <td><font size="1">
                    @if($flow->tax == 0)
                        Rp.{{ /*Paid by Customer */
                                number_format($flow->customer_price * $flow->qty * 0.95)
                            }}
                    @else
                        Rp.{{ 
                            number_format(
                                ($flow->customer_price * $flow->qty * 0.95) / 1.1
                            )
                        }}
                    @endif        
                </font></td>
                
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
</div>
</body>
</html>

