<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Shop Login</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
        <link rel="shortcut icon" href="images/logo1_img.png">        
    </head>
    <body class="hold-transition login-page" style="background-color: lightseagreen">
        <div class="login-box">
            <div class="login-logo">
                <a href="hallLogin.jsp"><img src="images/logoFinal.png" style="width: 110px; height: 90px"></a>
            </div>
            <div class="login-box-body">
                <p class="title text-center" style="font-size: 20px">Local Shop Login</p>
                <p class="login-box-msg">Sign in to start your session</p>

                <form action="aLoginCheck.jsp" method="post">
                    <input type="hidden" name="type" value="store">
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
