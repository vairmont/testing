<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="{{asset('public/js/barcode.js')  }}"></script>

</head>
<body>
<div style="border: 2px solid #888D91; ">
<span style="float:right"> <svg id="barcode"> </svg></span>
<div style="border-bottom: 2px dashed #888D91; padding: 20px; ">
<p style="color:#888D91">Kurir</p>
<p>JNE REG</p> 
<p style="color:#888D91">No Pesanan</p>
{{$invoice}}
</div>

<div style="border-bottom: 2px dashed #888D91; padding: 20px;">
<p style="text-align:left;">
Dari

<p style="text-align:left;">
{{$name}}<br>
{{$busname}}
</p>
<p style="text-align:left;">
628502935945
<span style="float:right;">Ke :{{$name}}</span>
</p>

<p style="text-align:right;">{{$phone}}</p>
<p style="text-align:right;">{{$address}}</p>
</div>

<div style="padding:0px; border-bottom: 2px dashed #888D91; padding: 0px">
<p>DAFTAR PRODUK</p>
</div>
<div style="border">
<table style="width:100%">
  <tr>
    <th>Produk</th>
    <th>Quantity</th> 
  </tr>
  <tr>
  	<td>{{$product}}</td>
    <td>{{$quantity}}</td>
  </tr>
  
</div>


</div>
<script>JsBarcode("#barcode", "Hi world!");</script>
</body>
</html>