<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/jsbarcode/3.6.0/JsBarcode.all.min.js"></script>
</head>
<body style="padding: 0 auto; margin: 0 auto;">
<div >
    <img src="{{asset('images/Logo.png')}}" alt="Logo" width="120">
    <img src="{{asset('images/jne.png')}}" alt="Logo" width="60"> 
    <span style="float:right"> 
    <img src="{{asset('images/fragile1.png')}}" alt="Logo" width="30">
    <img src="{{asset('images/fragile2.png')}}" alt="Logo" width="30">
    <img src="{{asset('images/fragile3.png')}}" alt="Logo" width="30">
    
  </span>
</div>
<div style="border: 1px solid #888D91;"> 
 <div style="margin: -10x; padding: 0px 0px;">
 <center><svg class="barcodeBill" style="width:200px;  padding-left:60px; margin:-20px"></svg></center>
</div>
</div>
<div style="border: 1px solid #888D91; ">

    
<div style="border-bottom: 1px dashed #888D91; padding: 10px 30px; ">
  <span style="float:right;"><svg class="barcodeInvoice" style="width:160px; margin-top: -33px;"> </svg></span>
  <p><b>No.account</b>:11105100<br>
  <b>Service</b>: Regular</p> 
  <div style="border">
      <table border="1" style="border-collapse:collapse;">
        <tr >
          <th style=" padding:5px 5px;">ORG</th>
          <th style=" padding:5px 5px;">DEST</th>
        </tr>
      
        
        <tr>
          <th style=" padding:5px 5px;">TGR</th>
          <th style=" padding:5px 5px;">TGR</th>
        </tr>
      </table>  
      </div>
</div>


<div style="border-bottom: 1px dashed #888D91; padding: 0 20px;">
<p> <b>Pengirim</b>: GrosirOne<br>
<b>No.Telp</b>:08119500311</p>
</div>

<div style="border-bottom: 1px dashed #888D91; padding: 0 20px;">
<p>
<b>Penerima</b>:{{ $jne->name }}<br><b>No Telp</b>:{{ $jne->phone }}<br>{{ $jne->address }}

</p>

</div>

<div style="border">
<table style="width:100%">
  <tr>
    <th>Produk</th>
    <th>Berat</th>
    <th>Quantity</th> 
  </tr>

  @foreach($itemDetail as $item)
  <tr>
    <td>{{ $item->product_name }}</td>
    <td>8 KG</td>
    <td>{{ $item->qty }}</td>
  </tr>
  @endforeach
  
</div>


</div>

<script>
    JsBarcode(".barcodeBill", "{{ $jne->bill}}");
    JsBarcode(".barcodeInvoice", "{{ $jne->invoice }}");
  </script>

</body>
</html>