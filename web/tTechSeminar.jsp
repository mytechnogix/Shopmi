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
        <title>Technical Seminars - TechnoGix</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="css/index.css">
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <style>
            @media (max-width: 750px) {
                #technogix_img
                {
                    width: 70%!important;
                    margin-top: 20px;
                }
            }
            li{
                padding: 10px;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed">
        <jsp:include page="header.jsp"/>
        <div class="wrapper">
            <div class="content-wrapper">
                <section class="content">
                    <div class="text-center">
                        <img id="technogix_img" src="images/technogix.png" style="width: 20%">
                    </div>
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <h2>Technical Seminars</h2>
                                    <hr>
                                    <p style="font-family: aharoni; font-size: 22px; text-align: justify; padding: 10px">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Freshers and students 
                                        need industry guidance and motivation in order to perceive there dream 
                                        destination in IT industry. From our resources and knowledge base in IT 
                                        industry, We provide key facts and guidelines about hiring process, 
                                        technology trends and technical preparation.
                                        We also provide short term training programs for programing language 
                                        concepts and processes. We also provide an
                                        opportunity to work on live projects.<br><br>
                                        Invite us for free seminars !!

                                    </p>
                                    <ul style="list-style-type: square;">
                                        <li style="font-size: 18px">Ankush R. Nistane <br> <a href="tel:+919049469246">+919049469246</a></li>
                                        <li style="font-size: 18px">Akshay S. Kende <br><a href="tel:+917709588509">+917709588509</a></li>
                                        <li style="font-size: 18px">Email us on :<br> <a href="mailto:technogixmanager@gmail.com">technogixmanager@gmail.com</a></li>
                                    </ul>
                                    <br>
                                    <br>
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
