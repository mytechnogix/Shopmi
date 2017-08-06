<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Business Login</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
        <link rel="shortcut icon" href="images/logo1_img.png">        
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-104138274-1', 'auto');
            ga('send', 'pageview');

        </script>
    </head>
    <body class="hold-transition login-page" style="background-color: lightseagreen">
        <div class="login-box">
            <div class="login-logo">
                <a href="businessLogin.jsp"><img src="images/logoFinal.png" style="width: 110px; height: 90px"></a>
            </div>
            <div class="login-box-body">
                <p class="title text-center" style="font-size: 20px">Business Login</p>
                <p class="login-box-msg">Sign in to start your session</p>

                <form action="aLoginCheck.jsp" method="post">
                    <div class="form-group has-feedback">
                        <select name="type" class="form-control" required>
                            <option value="">Select Business Type</option>
                            <option value="store">Local Shop</option>
                            <option value="hall">Party Hall</option>
                            <option value="mes">Mes Service</option>
                            <option value="hostel">Property</option>
                        </select>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="email" class="form-control" name="id" placeholder="Email Address" required>
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" name="pass" placeholder="Password" required>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-4 pull-right">
                            <button type="submit" class="btn btn-primary pull-right">Sign In</button>
                        </div>
                    </div>
                </form>
                <div class="social-auth-links text-center">
                    <p>- OR -</p>
                    <a href="#">I forgot my password</a><br>
                </div>
            </div>
        </div>
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
