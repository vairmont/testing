<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('title')</title>
    <!-- Bootstrap Core CSS -->
    <link href="{{ asset('sbadmin/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="{{ asset('sbadmin/vendor/metisMenu/metisMenu.min.css') }}" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="{{ asset('sbadmin/dist/css/sb-admin-2.css') }}" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <!-- Custom Fonts -->
    <link href="{{ asset('sbadmin/vendor/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css">  
    <script src="{{ asset('sbadmin/vendor/jquery/jquery.min.js') }}"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="{{ asset('sbadmin/vendor/bootstrap/js/bootstrap.min.js') }}"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="{{ asset('sbadmin/vendor/metisMenu/metisMenu.min.js') }}"></script>
    <!-- Custom Theme JavaScript -->
    <script src="{{ asset('sbadmin/dist/js/sb-admin-2.js') }}"></script>
    <script src="{{ asset('js/sorttable.js') }}"></script>
    
    <!-- Bower Datetime picker -->
    <script type="text/javascript" src="{{ asset('../bower_components/moment/min/moment.min.js') }}"></script>

    <script type="text/javascript" src="{{ asset('../bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('../bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css') }}" />    

    <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="container-fluid" style="background-color: white">
        <div class="row text-center">
            <div class="col-sm-6 col-sm-offset-3">
            <br><br> <h2 style="color:green">Success</h2>
            <img style="width: 200px;" src="../../cms/storage/app/image/success.gif">
            <p style="font-size:20px;color:#5C5C5C;">Terima Kasih. Pembayaran anda sukses, silahkan klik tombol dibawah untuk kembali berbelanja.</p>
            <a href=""><button type="submit" class="btn btn-primary">Kembali</button></a>
            <br><br>
            </div>

        </div>
        
    </div>  
    <!-- container -->
    </div>

</html>