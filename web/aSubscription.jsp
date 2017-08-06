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
        String type = request.getParameter("type");
        if (id == "" || id == null || type == "" || type == null) {
    %>
    <jsp:forward page="aDashboard.jsp"/>
    <%        }
        String subStart = "", busName = "", busStatus = "", busAdd = "", subType = "", regDate = "", addedBy = "", contact = "", email = "";
        PreparedStatement pst;
        ResultSet rs;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (type.equalsIgnoreCase("store")) {
            pst = con.prepareStatement("select * from storedetails where storeid=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                busName = rs.getString("storename");
                busStatus = rs.getString("storestatus");
                busAdd = rs.getString("busadd");
                subType = rs.getString("subtype");
                regDate = rs.getString("regdate");
                addedBy = rs.getString("addedby");
                contact = rs.getString("contact");
                email = rs.getString("email");
                subStart = rs.getString("substart");
            }
        } else if (type.equalsIgnoreCase("hall")) {
            pst = con.prepareStatement("select * from halls where hallid=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                busName = rs.getString("hallname");
                busStatus = rs.getString("status");
                busAdd = rs.getString("busadd");
                subType = rs.getString("substype");
                regDate = rs.getString("regDate");
                addedBy = rs.getString("addedBy");
                contact = rs.getString("contact");
                email = rs.getString("email");
                subStart = rs.getString("substart");
            }
        } else if (type.equalsIgnoreCase("mes")) {
            pst = con.prepareStatement("select * from mes where mesid=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                busName = rs.getString("mesname");
                busStatus = rs.getString("messtatus");
                busAdd = rs.getString("busadd");
                subType = rs.getString("subtype");
                regDate = rs.getString("regdate");
                addedBy = rs.getString("addedby");
                contact = rs.getString("contact");
                email = rs.getString("email");
                subStart = rs.getString("substart");
            }
        } else if (type.equalsIgnoreCase("hostel")) {
            pst = con.prepareStatement("select * from hostel where hostid=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                busName = rs.getString("hostname");
                busStatus = rs.getString("hoststatus");
                busAdd = rs.getString("busadd");
                subType = rs.getString("substype");
                regDate = rs.getString("regdate");
                addedBy = rs.getString("addedby");
                contact = rs.getString("contact");
                email = rs.getString("email");
                subStart = rs.getString("substart");
            }
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
                        <%=busName%> : Subscription
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active"> Business Subscription</li>
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
                                        <tr><td>Business ID</td><td><%=id%></td></tr>
                                        <tr><td>Business Name</td><td><%=busName%></td></tr>
                                        <tr><td>Business Type</td><td><%=type%></td></tr>
                                        <tr><td>Contact</td><td><%=contact%></td></tr>
                                        <tr><td>Email</td><td><%=email%></td></tr>
                                        <tr><td>Business Status</td><td><%=busStatus%></td></tr>
                                        <tr><td>Online Registration</td><td><%=busAdd%></td></tr>
                                        <tr><td>Subscription Type</td><td><%=subType%></td></tr>
                                        <tr><td>Registration Date</td><td><%=regDate%></td></tr>
                                        <tr><td>Added By</td><td><%=addedBy%></td></tr>
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
                                    <input type="hidden" name="id" id="busid" value="<%=id%>">
                                    <input type="hidden" name="type" id="bustype" value="<%=type%>">
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
                                    <input type="button" class="btn btn-primary" onclick="aStartBusSubscription()" value="Start">
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