<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<%
    String oid = request.getParameter("oid");
    if (oid == "" || oid == null) {
        response.sendRedirect("sDashboard.jsp");
    }
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Claim Coupon</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="shortcut icon" href="images/logo1_img.png">        
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="sHeader.jsp"/>
            <jsp:include page="sSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Claim Coupon
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-dashboard"></i> Manage Offers</a></li>
                        <li class="active">Claim Coupon</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12" id="offerDetails">
                            <div class="box box-primary">
                                <div class="box-body pre-scrollable">
                                    <table id="example1" class="table table-bordered table-striped ">
                                        <thead>
                                            <tr>
                                                <th>Sr. No.</th>
                                                <th>User ID</th>
                                                <th>Coupon code</th>
                                                <th>Coupon status</th>
                                                <th>Apply date</th>
                                                <th>Claim Date</th>
                                                <th>Use Coupon</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String uid = "", coupon = "", applyDate = "", couponStatus = "", claimDate = "";
                                                int cnt = 0;
                                                String storeid = String.valueOf(session.getAttribute("sStoreid"));
                                                PreparedStatement pst;
                                                ResultSet rs;
                                                Connection con;
                                                Class.forName("com.mysql.jdbc.Driver");
                                                DBConnector dbc = new DBConnector();
                                                con = DriverManager.getConnection(dbc.getConstr());
                                                pst = con.prepareStatement("select * from claimedoffers where storeid=? and oid=?");
                                                pst.setString(1, storeid);
                                                pst.setString(2, oid);
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    cnt++;
                                                    coupon = rs.getString("coupon");
                                                    uid = rs.getString("uid");
                                                    applyDate = rs.getString("claimdate");
                                                    claimDate = rs.getString("redeemdate");
                                                    couponStatus = rs.getString("couponstatus");
                                            %>
                                            <tr>
                                                <td><%=cnt%></td>
                                                <td><%=uid%></td>
                                                <td><%=coupon%></td>
                                                <td><%=couponStatus%></a></td>
                                                <td><%=applyDate%></td>
                                                <td><%=claimDate%></td>
                                                <td><a href="#" class="btn-sm btn-primary">Apply</a></td>
                                            </tr>
                                            <%}
                                                con.close();
                                            %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Sr. No.</th>
                                                <th>User ID</th>
                                                <th>Coupon code</th>
                                                <th>Coupon status</th>
                                                <th>Apply date</th>
                                                <th>Claim Date</th>
                                                <th>Use Coupon</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="plugins/fastclick/fastclick.js"></script>
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="js/custom.js"></script>
        <script>
            $(function () {
                $("#example1").DataTable();
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                });
            });
        </script>
    </body>
</html>
