<%-- 
    Document   : offerDetails
    Created on : Mar 12, 2017, 9:21:24 PM
    Author     : Ankush
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Contact Us - MyShejari.com</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="css/index.css">
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-104138274-1', 'auto');
            ga('send', 'pageview');

        </script>
        <style>
            li{
                padding: 10px;
                font-size: 16px;
                text-align: justify
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed">
        <jsp:include page="header.jsp"/>
        <div class="wrapper">
            <div class="content-wrapper">
                <section class="content">
                    <h2 class="text-center">Contact Us</h2>
                    <div class="row">
                        <div class="col-lg-2">

                        </div>
                        <div class="col-lg-8">
                            <div class="box box-primary">
                                <div class="box-body text-center">
                                    <div class="col-lg-6">
                                        <img src="images/contactus.jpg" id="contactUsImg" style="width: 90%">
                                    </div>
                                    <div class="col-lg-6" style="font-size: 20px">
                                        <br>
                                        <b>Team MyShejari is always happy to help you.</b><br><br>
                                        <b>Email us at <a href="mailto:care@myshejari.com">care@myshejari.com</a></b><br><br>
                                        <b>OR</b><br><br>
                                        <b>Call us (10 am to 10 pm) <br>
                                            <i class="fa fa-phone"></i> 8149783802<br><i class="fa fa-phone"></i> 8421705748
                                        </b>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">

                        </div>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="modals.jsp"/>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="plugins/fastclick/fastclick.js"></script>
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/pages/dashboard.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="js/jquery.newsTicker.min.js"></script> 
        <script src="js/custom.js"></script> 
        <link href="css/autocomplete.css" rel="stylesheet" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
    </body>
</html>
