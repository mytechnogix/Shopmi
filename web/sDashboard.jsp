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
        <title><%=session.getAttribute("sStoreName")%> - Shop Home</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
        <style>
            table
            {
                font-size: 16px;
            }
            table tr td
            {
                padding: 5px;

            }
            table tr td:first-child
            {
                font-weight: bold;
            }
        </style>
    </head>
    <%
        String visits = "", rating = "", reviews = "", enq = "", storeid = "";
        int cnt = 0;
        PreparedStatement pst;
        ResultSet rs;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        storeid = String.valueOf(session.getAttribute("sStoreid"));
    %>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="sHeader.jsp"/>
            <jsp:include page="sSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Dashboard
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    </ol>
                </section>
                <%
                    String img = "";
                    pst = con.prepareStatement("select * from storedetails where storeid=? and storestatus='Active' or storeid=? and storestatus='Data Changed' or storeid=? and busadd='Active'");
                    pst.setString(1, storeid);
                    pst.setString(2, storeid);
                    pst.setString(3, storeid);
                    rs = pst.executeQuery();
                    if (rs.next()) {
                        visits = rs.getString("visitcount");
                        rating = rs.getString("rating");
                        reviews = rs.getString("reviewcount");
                        enq = rs.getString("enquirycount");
                        img = rs.getString("photo");
                        rating = String.format("%.1f", Double.parseDouble(rating));
                        if (img.contains("default.jpg")) {
                            img = "shopIcon_lg.png";
                        }
                %>      
                <section class="content">
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3 id="vcount"><%=visits%></h3>
                                    <p>Visits</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-desktop"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3 id="memberCount"><%=enq%></h3>
                                    <p>Inquiries</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-envelope-o"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3 id="catCount"><%=rating%></h3>
                                    <p>Rating</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-star-o"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3 id="visitsCount"><%=reviews%></h3>
                                    <p>Reviews</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-comments-o"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Shop Details</h3>
                                    &nbsp;&nbsp;&nbsp;
                                    <small><a href="sUpdateStoreDetails.jsp">Edit Details</a></small>
                                </div>
                                <div class="box-body">
                                    <table>
                                        <tr><td>Store ID </td><td>MSSHOP<%=storeid%></td></tr>
                                        <tr><td>Store Name </td><td><%=rs.getString("storename")%></td></tr>
                                        <tr><td>Store Category</td><td><%=rs.getString("category")%></td></tr>
                                        <tr><td>Store Area</td><td><%=rs.getString("storearea")%></td></tr>
                                        <tr><td>Store Services</td><td><%=rs.getString("services")%></td></tr>
                                        <tr><td>Service Area</td><td><%=rs.getString("servicearea")%></td></tr>
                                        <tr><td>Store Timings</td><td><%=rs.getString("workinghours")%></td></tr>
                                        <tr><td>Store Closed On</td><td><%=rs.getString("closedon")%></td></tr>
                                        <tr><td>Contact No.</td><td><%=rs.getString("contact")%></td></tr>
                                        <tr><td>Phone No.</td><td><%=rs.getString("phone")%></td></tr>
                                        <tr><td>Website</td><td><%=rs.getString("websiteurl")%></td></tr>
                                        <tr><td>Email Address</td><td><%=rs.getString("email")%></td></tr>
                                        <tr><td>Subscription Type</td><td><%=rs.getString("subtype")%></td></tr>
                                        <tr><td>Address</td><td><%=rs.getString("fulladdress")%></td></tr>
                                        <tr><td>Shop Status</td><td><%=rs.getString("storestatus")%></td></tr>
                                    </table>
                                </div>
                                <div class="box-footer">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">
                                        Store Photos &nbsp;&nbsp;
                                        <small><a href="sUpdatePhotosDetails.jsp">Change Photos</a></small>
                                    </h3>
                                </div>
                                <div class="box-body">
                                    <div class="nav-tabs-custom" id="sliderSection">
                                        <div class="tab-content no-padding">
                                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                                <ol class="carousel-indicators">
                                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                    <%
                                                        if (img.contains("default.jpg")) {
                                                    %>
                                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                                    <%}
                                                        if (img.contains("default.jpg")) {
                                                    %>
                                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                                    <%}%>
                                                </ol>
                                                <div class="carousel-inner" role="listbox" id="carousalDiv" style="height: 200px">
                                                    <div class="item active" >
                                                        <img src="images/storephotos/<%=img%>" alt="Store Photos 1" width="100%" style="height: 200px" class="serviceMobImg">
                                                    </div>
                                                    <%
                                                        if (img.contains("default.jpg")) {
                                                    %>
                                                    <div class="item" >
                                                        <img src="images/storephotos/<%=img%>" alt="Store Photos 2" width="100%" style="height: 200px" class="serviceMobImg">
                                                    </div>
                                                    <%}
                                                        if (img.contains("default.jpg")) {
                                                    %>
                                                    <div class="item" >
                                                        <img src="images/storephotos/<%=img%>" alt="Store Photos 3" width="100%" style="height: 400px" class="serviceMobImg"> 
                                                    </div>
                                                    <%}%>
                                                </div>
                                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title">
                                    Added Offer
                                </h3>
                            </div>
                            <div class="box-body">
                                <%
                                    pst = con.prepareStatement("select * from offers where storeid=? and offerstatus='Active'");
                                    pst.setString(1, storeid);
                                    rs = pst.executeQuery();
                                    if (rs.next()) {
                                %>
                                <%=rs.getString("discount")%>% off on <%=rs.getString("discounton")%>
                                <br><br>
                                Total Coupons : <%=rs.getString("totalcoupons")%>
                                <br>
                                <br>
                                Offer Duration : <%=rs.getString("sDate")%> to <%=rs.getString("eDate")%>
                                <br>
                                <br>  
                                <%
                                } else {
                                %>
                                No offers added
                                <%}%>
                            </div>
                        </div>
                    </div>
            </div>
        </section>
        <%
            }
            con.close();
        %>
    </div>
    <jsp:include page="aFooterFiles.jsp"/>
</div>
</body>
</html>
