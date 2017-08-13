<%-- 
    Document   : storeDetails
    Created on : Mar 12, 2017, 9:21:24 PM
    Author     : Ankush
--%>
<%
    if (!String.valueOf(session.getAttribute("flag")).equals("1")) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BO.ManageHostelBO"%>
<%@page import="DAO.ManageDAO"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<%
    String uid = String.valueOf(session.getAttribute("uid"));
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>My Cart</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
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
            table{
                width: available;
            }
            td{
                padding: 8px;
            }
            .manageHeightMin
            {
                min-height: 300px;
                max-height: 300px;
            }
            .showWP
            {
                display: none;
            }
            .box-body
            {
                min-height: 430px;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed">
        <div class="wrapper">
            <jsp:include page="header.jsp"/>
            <br>
            <div class="content-wrapper">
                <section class="content">
                    <div class="row">
                        <div class="col-md-3">
                            <jsp:include page="uSideMenuMyProfile.jsp"/>
                        </div>
                        <div class="col-md-9">
                            <div class="box box-primary" id="mo">
                                <div class="box-header">
                                    <h3 class="box-title">My Offers </h3>
                                </div>
                                <div class="box-body pre-scrollable">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Offer Details</th>
                                                <th>Offer In</th>
                                                <th>Coupon Code</th>
                                                <th>Claimed Date</th>
                                                <th>Coupon Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String status = "", oid = "", claimeddate = "", img = "", discount = "", discounton = "", coupon = "", storeName = "";
                                                int cnt = 0, cid = 0, storeid = 0;
                                                pst = con.prepareStatement("select * from view_claimedoffers_notify where uid=? order by claimdate desc");
                                                pst.setString(1, uid);
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    cnt++;
                                                    cid = rs.getInt("cid");
                                                    storeName = rs.getString("storename");
                                                    storeid = rs.getInt("storeid");
                                                    status = rs.getString("couponstatus");
                                                    oid = rs.getString("oid");
                                                    claimeddate = rs.getString("claimdate");
                                                    img = rs.getString("offerimg");
                                                    discount = rs.getString("discount");
                                                    discounton = rs.getString("discounton");
                                                    coupon = rs.getString("coupon");
                                            %>
                                            <tr>
                                                <td><%=cid%></td>
                                                <td class="text-blue"><a href="offerDetails.jsp?id=<%=oid%>" target="_blank"><%=discount%>% Off on <%=discounton%></a></td>
                                                <td><a href="storeDetails.jsp?id=<%=storeid%>" target="_blank"><%=storeName%></a></td>
                                                <td><%=coupon%></td>
                                                <td><%=claimeddate%></td>
                                                <td><%=status%></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="box box-primary showWP" id="mf">
                                <div class="box-header">
                                    <h3 class="box-title">My Favorites</h3>
                                </div>
                                <div class="box-body pre-scrollable">
                                    <table id="example2" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr. No.</th>
                                                <th>Store Name</th>
                                                <th>You have rated</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String fav = "0", rating = "0", review = "";
                                                cnt = 0;
                                                pst = con.prepareStatement("select s.storename, r.storeid, r.rid, r.rating, r.fav, r.reviewdate from storedetails s, reviewstore r where r.storeid=s.storeid and r.uid=?");
                                                pst.setString(1, uid);
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    fav = rs.getString("fav");
                                                    rating = rs.getString("rating");
                                                    if (!fav.equals("1")) {
                                                        fav = "No";
                                                    } else {
                                                        fav = "Yes";
                                                    }
                                                    if (rating.equals("0")) {
                                                        rating = "Not Rated";
                                                    } else {
                                                        rating = rating + " Stars";
                                                    }
                                                    cnt++;
                                            %>
                                            <tr>
                                                <td><%=rs.getInt("rid")%></td>
                                                <td><a href="storeDetails.jsp?id=<%=rs.getString("storeid")%>" target="_blank"><%=rs.getString("storename")%></a></td>
                                                <td><%=rating%></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="box box-primary showWP" id="mr">
                                <div class="box-header">
                                    <h3 class="box-title">My Reviews </h3>
                                </div>
                                <div class="box-body pre-scrollable">
                                    <table id="example3" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr. No.</th>
                                                <th>Store Name</th>
                                                <th>Your review</th>
                                                <th>Reviewed Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                cnt = 0;
                                                pst = con.prepareStatement("select s.storename, r.storeid, r.review, r.reviewdate from storedetails s, reviewstore r where r.storeid=s.storeid and r.review!='NA' and r.uid=?");
                                                pst.setString(1, uid);
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    review = rs.getString("review");
                                                    if (review.equals("NA")) {
                                                        review = "Not reviewed";
                                                    }
                                                    cnt++;
                                            %>
                                            <tr>
                                                <td><%=cnt%></td>
                                                <td><a href="storeDetails.jsp?id=<%=rs.getString("storeid")%>" target="_blank"><%=rs.getString("storename")%></a></td>
                                                <td><%=review%></td>
                                                <td><%=rs.getString("reviewdate")%></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="box box-primary showWP" id="enq">
                                <div class="box-header">
                                    <h3 class="box-title"> Enquiries</h3>
                                </div>
                                <div class="box-body pre-scrollable">
                                    <table id="example4" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr. No.</th>
                                                <th>Store Name</th>
                                                <th>Enquiry Subject</th>
                                                <th>Enquiry</th>
                                                <th>Enquiry Date</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String enquiry = "";
                                                cnt = 0;
                                                pst = con.prepareStatement("select s.storename, r.storeid, r.enquiry, r.reviewsub, r.reviewdate, r.reviewstatus from storedetails s, reviewstore r where r.storeid=s.storeid and r.enquiry!='NA' and r.uid=?");
                                                pst.setString(1, uid);
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    enquiry = rs.getString("enquiry");
                                                    if (review.equals("NA")) {
                                                        review = "Not reviewed";
                                                    }
                                                    cnt++;
                                            %>
                                            <tr>
                                                <td><%=cnt%></td>
                                                <td><a href="storeDetails.jsp?id=<%=rs.getString("storeid")%>" target="_blank"><%=rs.getString("storename")%></a></td>
                                                <td><%=rs.getString("reviewsub")%></td>
                                                <td><%=enquiry%></td>
                                                <td><%=rs.getString("reviewdate")%></td>
                                                <td><%=rs.getString("reviewstatus")%></td>
                                            </tr>
                                            <%}
                                                con.close();
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="box box-primary showWP" id="md">
                                <div class="box-header">
                                    <h3 class="box-title"> Change Password</h3>
                                </div>
                                <div class="box-body pre-scrollable">
                                    <div class="col-md-10">
                                        <div class="form-group has-feedback">
                                            <input type="email" class="form-control" id="uEmail" name="email" value="<%=uid%>" readonly="readdonly">
                                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <input type="password" class="form-control" name="psw" id="uPass" placeholder="Current Password" required="required">
                                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <input type="password" class="form-control" name="npsw" id="uNPass" placeholder="New Password" required="required">
                                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                        </div>                                        
                                        <div class="form-group has-feedback">
                                            <input type="password" class="form-control" name="ncpsw" id="uCPass" placeholder=" Confirm New Password" required="required">
                                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                        </div>
                                            <button type="submit" id="subButton" class="btn btn-primary pull-left" onclick="uChangePassCheck('user')">Submit</button>
                                        <button class="btn btn-primary pull-left" style="margin-left: 5px;" onclick="history.back()">Back</button>
                                        <br><br>
                                        <div id="changeError" class="text-red"></div>
                                        <div id="changeSuccess" class="text-green"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="plugins/fastclick/fastclick.js"></script>
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="js/custom.js"></script>
        <jsp:include page="modals.jsp"/>
        <script>
            function showWebPart(str)
            {
                //alert(str);
                $('#'+str).removeClass('showWP').siblings().addClass('showWP');
                $('.'+str).parent('li').addClass('active');
                $('.'+str).parent('li').siblings().removeClass('active');
            }
            $(function () {
                $("#example1").DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                    
                });
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                });
                $('#example3').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                });
                $('#example4').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                });
            });
        </script>
    </body>
</html>
