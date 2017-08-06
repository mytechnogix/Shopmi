<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <%
        PreparedStatement pst;
        ResultSet rs;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
//        pst = con.prepareStatement("select storename from storedetails where storeid=? and storestatus='Active'");
//        pst.setInt(1, storeId);
//        rs = pst.executeQuery();
//        while (rs.next()) {
//            storeName = rs.getString("storename");
//        }
%>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Business Subscriptions</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"/>
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css"/>
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css"/>
        <link rel="stylesheet" href="css/carousalOffers.css"/>
        <link rel="stylesheet" href="css/index.css"/>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <style>
            #searchRes
            {
                background-color:lightgray;
                padding: 0 100px;
            }
            table
            {
                background-color: transparent;
            }
            table .searchRes
            {
                margin-top:  10px;
                padding: 5px;
            }
            table .searchRes td
            {
                padding: 10px
            }
            table .searchRes td a
            {
                font-size: 15px;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="aHeader.jsp"/>
            <jsp:include page="aSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Business Subscriptions
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active"> Manage Subscriptions : Business</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-9">
                            <label>Business Name</label>
                            <div class="form-group">
                                <input type="search" id="searchBus" name="searchBus" onkeyup="aSearchBusiness()" class="form-control" placeholder="Search by business name" required>
                            </div>
                            <div id="searchRes"></div>
                        </div>
                    </div>
                    <div class="row text-center">
                        <br><br>
                        <span> - - - OR - - - </span>
                        <br><br><br>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Select Business Type</label>
                            <select class="form-control" id="ddlBusType" name="ddlBusType" required>
                                <option value="store">Local Shop</option>
                                <option value="hall">Party Hall</option>
                                <option value="mes">Mes Service</option>
                                <option value="hostel">Property</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label>Business ID</label>
                            <div class="form-group">
                                <input type="number" id="txtBusId" name="txtBusId" class="form-control" placeholder="Business Id" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>&nbsp;</label>
                            <div class="form-group">
                                <input type="button" id="btnBusGo" onclick="aRedirectToSubPage()" name="btnBusGo" class="btn btn-primary" value="Go" required>
                            </div>
                        </div>
                    </div>
                </section>
                <%
                    con.close();
                %>
                </section>
            </div>
            <script src="bootstrap/js/bootstrap.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
            <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
            <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
            <script src="plugins/fastclick/fastclick.js"></script>
            <script src="dist/js/app.min.js"></script>
            <script src="dist/js/pages/dashboard.js"></script>
            <script src="dist/js/demo.js"></script>
            <script src="js/jquery.newsTicker.min.js"></script> 
            <jsp:include page="modals.jsp"/>
            <script src="js/custom.js"></script>
        </div>
    </body>
</html>
