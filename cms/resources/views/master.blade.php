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
    

    <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
  <div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
      <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="{{url('/dashboard')}}">
          <img src="{{asset('images/logogrosirone-3.png')}}" width="120" height="40" alt="" style="margin-top: -7px">
        </a>
      </div> <!-- /.navbar-header -->

      <!-- render partial navbar top right dropdown -->
      @include('navbar-topright-dropdown')

      <!-- render partial layout menu.blade.php -->
      @include('menu')
    
    </nav>
    <!-- End Navigation -->

    <!-- page-wrapper -->
    <div id="page-wrapper" style="padding: 20px;">
        @yield('content')
    </div>
    <!-- end #page-wrapper -->
  </div>
  <!-- /#wrapper -->
</body>
</html>
