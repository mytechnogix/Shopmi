<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <%
        String id = request.getParameter("id");
        if (id == "" || id == null) {
    %>
    <jsp:forward page="aDashboard.jsp"/>
    <%        }
        String subStart = "", storeid = "", advTitle = "", storeName = "", subType = "", sDate = "", eDate = "", advStatus = "", timedate = "";
        PreparedStatement pst;
        ResultSet rs;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from view_advertise where aid=?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        if (rs.next()) {
            storeid = rs.getString("storeid");
            storeName = rs.getString("storename");
            advTitle = rs.getString("advtitle");
            sDate = rs.getString("sDate");
            eDate = rs.getString("eDate");
            advStatus = rs.getString("advstatus");
            timedate = rs.getString("timedate");
            subType = rs.getString("subtype");
            subStart = rs.getString("substart");
        } else {
    %>
    <jsp:forward page="aDashboard.jsp"/>
    <%        }
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
        <link rel="stylesheet" href="css/datepicker3.min.css"/>
        <link rel="stylesheet" href="css/datepicker.min.css"/>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <style>
            .tblSubs td
            {
                padding: 5px;
                font-size: 15px;
            }
            .tblSubs td:first-child
            {
                font-weight: bold;
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
                        <%=storeName%> : Subscription
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active"> Advertise Subscription</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Business Details</h3>
                                </div>
                                <div class="box-body">
                                    <table class="tblSubs">
                                        <tr><td>Advertise ID</td><td><%=id%></td></tr>
                                        <tr><td>Store ID</td><td><%=storeid%></td></tr>
                                        <tr><td>Store Name</td><td><%=storeName%></td></tr>
                                        <tr><td>Advertise Title</td><td><%=advTitle%></td></tr>
                                        <tr><td>Advertise Duration</td><td><%=sDate%> to <%=eDate%></td></tr>
                                        <tr><td>Advertise Status</td><td><%=advStatus%></td></tr>
                                        <tr><td>Added on</td><td><%=timedate%></td></tr>
                                        <tr><td>Subscription Type</td><td><%=subType%></td></tr>
                                        <tr><td>Subscription Start (mm/dd/yyyy)</td><td><%=subStart%></td></tr>
                                        <tr><td></td><td></td></tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Start Subscription</h3>
                                </div>
                                <div class="box-body">
                                    <input type="hidden" name="aid" id="aid" value="<%=id%>">
                                    <div class="form-group">
                                        <label>Subscription Start Date</label>
                                        <div class="date">
                                            <div class="input-group input-append date" id="datePicker">
                                                <input type="text" class="form-control" id="date" name="date" placeholder="Select subscription start date" required="required">
                                                <span class="input-group-addon add-on">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="button" class="btn btn-primary" onclick="aStartAdvSubscription()" value="Start">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <%
                    con.close();
                %>
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
            <script src="js/bootstrap-datepicker.min.js"></script>
            <jsp:include page="modals.jsp"/>
            <script src="js/custom.js"></script>
            <script>
                $('#datePicker')
                .datepicker({
                    autoclose: true,    // It is false, by default
                    format: 'mm/dd/yyyy'
                })
                .on('changeDate', function(e) {
                    
                });
            </script>
        </div>
    </body>
</html>