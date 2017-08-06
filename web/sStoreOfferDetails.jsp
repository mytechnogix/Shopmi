<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Add Offers</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="shortcut icon" href="images/logo1_img.png">   
        <style>
            .tblOffer tr td
            {
                padding: 10px;
                font-size: 16px;
            }
             .tblOffer tr td:first-child
            {
                font-weight: bold;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="sHeader.jsp"/>
            <jsp:include page="sSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Manage Offers
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Offers</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Offer Details</h3>
                                    <a href="sAddStoreOffer.jsp" id="claim" class="btn-sm btn-primary pull-right">
                                        <i class="fa fa-plus"></i>  Add Offer</a>
                                </div>
                                <div class="box-body">
                                    <%
                                        String storeid = String.valueOf(session.getAttribute("sStoreid"));
                                        int cnt = 0;
                                        String img = "", oid = "";
                                        PreparedStatement pst;
                                        ResultSet rs;
                                        Connection con;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        DBConnector dbc = new DBConnector();
                                        con = DriverManager.getConnection(dbc.getConstr());
                                        pst = con.prepareStatement("select * from offers where storeid=? and offerstatus='Active' or storeid=? and offerstatus='Pending'");
                                        pst.setString(1, storeid);
                                        pst.setString(2, storeid);
                                        rs = pst.executeQuery();
                                        if (rs.next()) {
                                            oid = rs.getString("oid");
                                            img = rs.getString("offerimg");
                                            cnt++;
                                    %>
                                    <table class="tblOffer">
                                        <tr><td>Discount</td><td><%=rs.getString("discount")%>%</td></tr>
                                        <tr><td>Discount on</td><td><%=rs.getString("discounton")%></td></tr>
                                        <tr><td>Total coupons</td><td><%=rs.getString("totalcoupons")%></td></tr>
                                        <tr><td>Offer Duration</td><td><%=rs.getString("sDate")%> to <%=rs.getString("eDate")%></td></tr>
                                        <tr><td>Offer added on</td><td><%=rs.getString("timedate")%></td></tr>
                                        <tr><td>Offer status</td><td><%=rs.getString("offerstatus")%></td></tr>
                                        <tr><td>Terms and Conditions</td><td><%=rs.getString("termsandcondition")%></td></tr>
                                    </table>
                                    <%} else {%>
                                    No offer added
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <%
                            if (cnt > 0) {

                                if (img.contains("default.jpg")) {
                                    img = "shopIcon_lg.png";
                                }
                        %>
                        <div class="col-sm-4">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Offer Image</h3>
                                    <small class="pull-right"><a id="picPath" href="sAddOfferPhoto.jsp">Change Image</a></small>
                                </div>
                                <div class="box-body" style="overflow: hidden">
                                    <img src="images/offerphotos/<%=img%>" style="width: 300px">
                                </div>   
                                <div class="box-footer clearfix no-border">
                                    <span id="imgPreviewName"></span>
                                </div>
                            </div>
                        </div>
                        <%}
                            con.close();
                        %>
                    </div>
                </section>
            </div>
        </div>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="plugins/fastclick/fastclick.js"></script>
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="js/custom.js"></script>
        <script>
            var claim = <%=cnt%>;
            if(claim=="1")
            {
                $("#claim").attr("href", "sClaimCoupon.jsp?oid=<%=oid%>");
                $("#claim").text(" Claimed Coupons");
            }
        </script>
    </body>
</html>
