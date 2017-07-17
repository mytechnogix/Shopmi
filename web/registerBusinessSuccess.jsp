<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Business Added Successfully - MyShejari.com</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css"/>
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css"/>
        <link rel="stylesheet" href="css/carousalOffers.css"/>
        <link rel="stylesheet" href="css/index.css"/>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <style>
            #login-after-div, #login-before-div
            {
                display: none;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed">
        <div class="wrapper">
            <jsp:include page="header.jsp"/>
            <div class="content-wrapper">
                <section class="content" style="padding-top:0px">
                    <h3 class="text-center"><img src="images/shopIcon_sm.png" style="width: 40px">   Registration Successful</h3>
                    <div class="row">
                        <div class="col-md-8" style="margin-left: 17%">
                            <div class="box box-primary text-center">
                                <div class="box-body">
                                    <h3>Your business is registered successfully with MyShejari.com</h3>
                                    <h3>Team MyShejari.com will connect to you soon</h3>
                                    <h3>Thank you for being part of MyShejari.com</h3>
                                </div>
                                <div class="box-footer">
                                    <a class="btn btn-primary" href="index.jsp">Back</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="plugins/fastclick/fastclick.js"></script>
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="js/jquery.newsTicker.min.js"></script> 
        <script src="js/custom.js"></script>
        <jsp:include page="modals.jsp"/>
    </body>
</html>
