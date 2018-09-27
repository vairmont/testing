<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Login</title>

    <link  type="text/css" href="{{asset('vendor/animate/animate.css')}}" rel="stylesheet">

    <!-- Bootstrap Core CSS -->
    <link href="{{ asset('sbadmin/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">

    <!-- MetisMenu CSS -->
  
    <!-- Custom CSS -->
    <link href="{{ asset('sbadmin/dist/css/sb-admin-2.css') }}" rel="stylesheet">

 


    <!-- Custom Fonts -->
    <link href="{{ asset('sbadmin/vendor/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css">



    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style class="cp-pen-styles">@import url(https://fonts.googleapis.com/css?family=Open+Sans);
.btn { display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5; background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6)); background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6); background-image: linear-gradient(top, #ffffff, #e6e6e6); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); border: 1px solid #e6e6e6; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer; *margin-left: .3em; }
.btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { background-color: #e6e6e6; }
.btn-large { padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }
.btn:hover { color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear; }
.btn-primary, .btn-primary:hover { text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; }
.btn-primary.active { color: rgba(255, 255, 255, 0.75); }
.btn-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
.btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] { filter: none; background-color: #4a77d4; }
.btn-block { width: 100%; display:block; }

* { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }

html { width: 100%; height:100%; overflow:hidden; }

body { 
    width: 100%;
    height:100%;
    font-family: 'Open Sans', sans-serif;
    background: #092756;
    background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(246, 255, 217, 0.36) 10%,rgba(39, 255, 0, 0) 40%), linear-gradient(to bottom, rgba(0, 171, 5, 0.38) 0%,rgba(146, 220, 0, 0.55) 100%), linear-gradient(135deg, #0db002 0%,#d4fc79 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(246, 255, 217, 0.36) 10%,rgba(39, 255, 0, 0) 40%), linear-gradient(to bottom, rgba(0, 171, 5, 0.38) 0%,rgba(146, 220, 0, 0.55) 100%), linear-gradient(135deg, #0db002 0%,#d4fc79 100%);
    background: -o-radial-gradient(0% 100%, ellipse cover, rgba(246, 255, 217, 0.36) 10%,rgba(39, 255, 0, 0) 40%), linear-gradient(to bottom, rgba(0, 171, 5, 0.38) 0%,rgba(146, 220, 0, 0.55) 100%), linear-gradient(135deg, #0db002 0%,#d4fc79 100%);
    background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(246, 255, 217, 0.36) 10%,rgba(39, 255, 0, 0) 40%), linear-gradient(to bottom, rgba(0, 171, 5, 0.38) 0%,rgba(146, 220, 0, 0.55) 100%), linear-gradient(135deg, #0db002 0%,#d4fc79 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(246, 255, 217, 0.36) 10%,rgba(39, 255, 0, 0) 40%), linear-gradient(to bottom, rgba(0, 171, 5, 0.38) 0%,rgba(146, 220, 0, 0.55) 100%), linear-gradient(135deg, #0db002 0%,#d4fc79 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#42b97c', endColorstr='#092756',GradientType=1 );
}
.login { 
    position: absolute;
    top: 50%;
    left: 50%;
    margin: -150px 0 0 -150px;
    width:300px;
    height:300px;
}
.login h1 { color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center; }

.logo {
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 100%;
    padding-bottom: 20px
}

input { 
    width: 100%; 
    margin-bottom: 10px; 
    background: rgba(107, 107, 107, 0.3);
    border: none;
    outline: none;
    padding: 10px;
    font-size: 13px;
    color: #fff;
    text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
    border-radius: 4px;
    box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
    -webkit-transition: box-shadow .5s ease;
    -moz-transition: box-shadow .5s ease;
    -o-transition: box-shadow .5s ease;
    -ms-transition: box-shadow .5s ease;
    transition: box-shadow .5s ease;
}
input:focus { box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4), 0 1px 1px rgba(255,255,255,0.2); }
</style>
</head>

<body>

    <div class="login">
        <div class="row">
                        <img class="logo" src="{{asset('images/logogrosirone-3.png')}}">
                        <!-- <h1 class>Grosir One</h1> -->
         
                        <form form class="form-horizontal" method="GET" action="{{url('/dologin')}}" >
                        {{csrf_field()}}
                            <fieldset>
                                <input type="text" name="phone" placeholder="Phone" required="required" />
                                <input type="password" name="password" placeholder="Password" required="required" />
                                <button type="submit" class="btn btn-primary btn-block btn-large">Login</button>
                            </fieldset>
                      
                        </form>
        </div>
    </div>


    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    
</body>

</html>
