<%-- 
    Document   : storeDetails
    Created on : Mar 12, 2017, 9:21:24 PM
    Author     : Ankush
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BO.ManageHostelBO"%>
<%@page import="DAO.ManageDAO"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="com.quickc.pack.PostedOn"%>
<%
    String gurkha = request.getParameter("id");
    String uid = String.valueOf(session.getAttribute("uid"));
    ManageHostelBO objBO = new ManageHostelBO();
    ManageDAO objDAO = new ManageDAO();

    objBO.setGurkha(gurkha);
    objDAO.getAllHostelDetails(objBO);

    if (!objBO.isAddFlag()) {
%>
<jsp:forward page="index.jsp"/>
<%    }
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
//    pst = con.prepareStatement("insert into log_popular(storeid, uid, storename, category, city, storearea) values(?,?,?,?,?,?)");
//    pst.setString(1, storeid);
//    pst.setString(2, uid);
//    pst.setString(3, objBO.getStoreName());
//    pst.setString(4, objBO.getStoreCat());
//    pst.setString(5, objBO.getCity());
//    pst.setString(6, objBO.getStoreArea());
//    pst.executeUpdate();

    pst = con.prepareStatement("update hostel set visitcount=visitcount+1 where hostid=?");
    pst.setString(1, objBO.getHostId());
    pst.executeUpdate();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=objBO.getHostName()%>, <%=objBO.getAddress()%></title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/storeDetails.css">
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
            .availAmenity
            {
                margin-top: 10px;
                margin-bottom: 10px;
                padding-bottom: 5px;
                color: black;
                font-weight: bold;
            }
            .availAmenity img
            {
                opacity: 1;
                margin-right: 10px;
            }
            .checkbox
            {
                padding-bottom: 10px;
                color: lightgray;
            }
            .checkbox img
            {
                opacity: 0.3;
                margin-right: 10px;
            }
            .booked
            {
                background-color: red;
                color: white;
            }
            table{
                width: 100%;
            }
            td{
                padding: 8px;
            }
            .manageHeightMin
            {
                max-height: 250px;
            }
            .changeColor
            {
                color: red;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed" onload="initMap()">
        <div class="wrapper">
            <jsp:include page="header.jsp"/>
            <span id="tooltipMap" style="float: right; padding: 30px;" data-toggle="tooltip" data-placement="bottom" title="Scroll down to see Map">
            </span>
            <div class="content-wrapper">
                <section class="content-header" id="serviceTitle" style="background-color: #fff; padding-bottom: 3px;">
                    <h1><i class="fa fa-building" style="padding-top: 5px"></i> Property Details </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                        <li class="active">Property Details</li>
                    </ol>
                </section> 
                <section class="content">
                    <div class="row">
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-md-7">
                                    <div class="box box-widget widget-user-2">
                                        <div class="widget-user-header bg-aqua">
                                            <div class="widget-user-image">
                                                <img class="img-circle" src="images/hostelphotos/<%=objBO.getPhoto()%>" alt="Hall Logo">
                                            </div>
                                            <h3 class="widget-user-username"><b><%=objBO.getHostName()%></b></h3>
                                            <h5 class="widget-user-desc"><%=objBO.getAddress()%>, <%=objBO.getCity()%></h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <input type="hidden" id="type" value="hostel">
                                    <input type="hidden" id="id" value="<%=objBO.getHostId()%>">
                                    <div class="box box-primary">
                                        <div class="box-body text-center">
                                            <a class="btn btn-app bg-aqua" href="javascript:;">
                                                <span style="font-weight: bold; font-size: 18px">₹ <%=objBO.getRent()%></span><br> Rent
                                            </a>
                                            <a class="btn btn-app bg-aqua" href="javascript:;">
                                                <span style="font-weight: bold; font-size: 18px">₹ <%=objBO.getDeposit()%></span><br> Deposit
                                            </a>
                                            <a class="btn btn-app bg-aqua" href="JavaScript:;">
                                                <span style="font-weight: bold; font-size: 18px"><%=objBO.getHostAreaSqft()%> sqft</span><br> Buildup
                                            </a>
                                            <a class="btn btn-app bg-aqua" href="JavaScript:checkLogin('fav')">
                                                <i class="fa fa-heart-o" id="addFav"></i> 
                                                <span id="txtFav"> Add to favorite</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <div class="nav-tabs-custom" id="sliderSection">
                                        <div class="tab-content no-padding">
                                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                                <ol class="carousel-indicators">
                                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                    <%
                                                        if (!objBO.getPhoto2().contains("shopIcon")) {
                                                    %>
                                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                                    <%}
                                                        if (!objBO.getPhoto3().contains("shopIcon")) {
                                                    %>
                                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                                    <%}%>
                                                </ol>
                                                <div class="carousel-inner" role="listbox" id="carousalDiv" style="height: 400px">
                                                    <div class="item active" >
                                                        <img src="images/hostelphotos/<%=objBO.getPhotoLg()%>" alt="Property Photo 1" width="100%" style="height: 400px" class="serviceMobImg">
                                                    </div>
                                                    <%
                                                        if (!objBO.getPhoto2().contains("shopIcon")) {
                                                    %>
                                                    <div class="item" >
                                                        <img src="images/hostelphotos/<%=objBO.getPhoto2()%>" alt="Property Photo 2" width="100%" style="height: 400px" class="serviceMobImg">
                                                    </div>
                                                    <%}
                                                        if (!objBO.getPhoto3().contains("shopIcon")) {
                                                    %>
                                                    <div class="item" >
                                                        <img src="images/hostelphotos/<%=objBO.getPhoto3()%>" alt="Property Photo 3" width="100%" style="height: 400px" class="serviceMobImg"> 
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
                                <input type="hidden" id="sid" value="<%=objBO.getHostId()%>">
                                <div class="col-md-5">
                                    <div class="box box-primary" style="min-height: 400px">
                                        <div class="box-body">
                                            <div class="col-md-6" style="font-size: 15px; font-weight: bold; border: 1px">
                                                <ul class="products-list product-list-in-box">
                                                    <li class="item" title="Bedrooms"> 
                                                        <div class="product-img">
                                                            <img src="images/amenities/bedrooms.png" style="width: 30px; height: 30px">
                                                        </div>
                                                        <div class="product-info">
                                                            <%=objBO.getBedrooms()%> Bedrooms
                                                            <span class="product-description" >
                                                                No. of Bedrooms  
                                                            </span>
                                                        </div>
                                                    </li>
                                                    <li class="item" title="Possession"> 
                                                        <div class="product-img">
                                                            <img src="images/amenities/possession.png" style="width: 30px; height: 30px">
                                                        </div>
                                                        <div class="product-info">
                                                            <%=objBO.getPossession()%>
                                                            <span class="product-description">
                                                                Possession
                                                            </span>
                                                        </div>
                                                    </li>
                                                    <li class="item" title="Furnished"> 
                                                        <div class="product-img">
                                                            <img src="images/amenities/furnished.png" style="width: 30px; height: 30px">
                                                        </div>
                                                        <div class="product-info">
                                                            <%=objBO.getFurnished()%>
                                                            <span class="product-description">
                                                                Furnished
                                                            </span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6" style="font-size: 15px; font-weight: bold; border: 1px">
                                                <ul class="products-list product-list-in-box">
                                                    <li class="item" title="Posted On"> 
                                                        <div class="product-img">
                                                            <img src="images/amenities/beds.png" style="width: 30px; height: 30px">
                                                        </div>
                                                        <div class="product-info">
                                                            <%=objBO.getBeds()%> Beds
                                                            <span class="product-description" >
                                                                No. of Beds
                                                            </span>
                                                        </div>
                                                    </li>
                                                    <li class="item" title="Preferred Tenants"> 
                                                        <div class="product-img">
                                                            <img src="images/amenities/tenants.png" style="width: 30px; height: 30px">
                                                        </div>
                                                        <div class="product-info">
                                                            <%=objBO.getForWhom()%>
                                                            <span class="product-description" >
                                                                Preferred Tenants
                                                            </span>
                                                        </div>
                                                    </li>
                                                    <li class="item" title="Posted On"> 
                                                        <div class="product-img">
                                                            <img src="images/amenities/postedon.png" style="width: 30px; height: 30px">
                                                        </div>
                                                        <div class="product-info">
                                                            <%
                                                                Date date1 = new Date();
                                                                Date date2 = null;
                                                                pst = con.prepareStatement("SELECT regDate from hostel where hostid=?;");
                                                                pst.setString(1, objBO.getHostId());
                                                                rs = pst.executeQuery();
                                                                if (rs.next()) {
                                                                    Timestamp t = rs.getTimestamp("regDate");
                                                                    long milliseconds = t.getTime() + (t.getNanos() / 1000000);
                                                                    date2 = new java.util.Date(milliseconds);
                                                                }
                                                                PostedOn objPO = new PostedOn();
                                                                String res = objPO.PostedOnDates(date1, date2);
                                                            %>
                                                            <%=res%>
                                                            <span class="product-description" >
                                                                Posted On
                                                            </span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <button class="btn-lg btn-danger" onclick="checkLogin('hostel')" style="width: 100%">Get Owner Details</button>
                                            <br><br>
                                            <span class="center">
                                                Report : 
                                                <a href="#" style="margin-left: 10px">Rented Out</a>
                                                <a href="#" style="margin-left: 20px">Wrong Information</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="box box-primary">
                                        <div class="box-header with-border box-title">
                                            <h3 class="box-title">Amenities</h3>
                                        </div>
                                        <div class="box-body" style="font-size: 18px">
                                            <div class="col-lg-3">
                                                <div class="checkbox" id="lift">
                                                    <img src="images/amenities/lift.png" style="width: 20px; height: 20px"> Lift
                                                </div>
                                                <div class="checkbox" id="ac">
                                                    <img src="images/amenities/ac.png" style="width: 20px; height: 20px"> Air Conditioner
                                                </div>
                                                <div class="checkbox" id="swim">
                                                    <img src="images/amenities/swim.png" style="width: 20px; height: 20px"> Swimming Pool
                                                </div>
                                                <div class="checkbox" id="harvest">
                                                    <img src="images/amenities/harvest.png" style="width: 20px; height: 20px"> Rain Water Harvesting
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="checkbox" id="servantroom">
                                                    <img src="images/amenities/servantroom.png" style="width: 20px; height: 20px"> Servant Room
                                                </div>
                                                <div class="checkbox" id="gas">
                                                    <img src="images/amenities/gas.png" style="width: 20px; height: 20px"> Gas Pipeline
                                                </div>
                                                <div class="checkbox" id="gym">
                                                    <img src="images/amenities/gym.png" style="width: 20px; height: 20px"> Gym
                                                </div>
                                                <div class="checkbox" id="power">
                                                    <img src="images/amenities/powerbackup.png" style="width: 20px; height: 20px"> Power Backup
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="checkbox" id="firesafe">
                                                    <img src="images/amenities/firesafety.png" style="width: 20px; height: 20px"> Fire Safety
                                                </div>
                                                <div class="checkbox" id="club">
                                                    <img src="images/amenities/club.png" style="width: 20px; height: 20px"> Club House
                                                </div>
                                                <div class="checkbox" id="play">
                                                    <img src="images/amenities/play.png" style="width: 20px; height: 20px"> Children's Play Area 
                                                </div>
                                                <div class="checkbox" id="security">
                                                    <img src="images/amenities/security.png" style="width: 20px; height: 20px"> Security
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="checkbox" id="park">
                                                    <img src="images/amenities/park.png" style="width: 20px; height: 20px"> Park
                                                </div>
                                                <div class="checkbox" id="housekeeping">
                                                    <img src="images/amenities/housekeeping.png" style="width: 20px; height: 20px"> House Keeping
                                                </div>
                                                <div class="checkbox" id="internet">
                                                    <img src="images/amenities/internet.png" style="width: 20px; height: 20px"> Internet Services
                                                </div>
                                                <div class="checkbox" id="parking">
                                                    <img src="images/amenities/parking.png" style="width: 20px; height: 20px"> Parking
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <div class="box box-primary" id="recentlyJoined">
                                        <div class="box-header with-border box-title">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="origin" placeholder="Enter your current location">
                                                <span class="input-group-btn">
                                                    <button type="button" onclick="initMap()" id="btnGetDirection" class="btn btn-info btn-flat">Get Direction</button>
                                                </span>
                                            </div>
                                            <span class="label label-danger" id="lblDistance"></span>
                                        </div>
                                        <div class="box-body no-padding" id="map">
                                        </div>
                                    </div>
                                    <%
                                        String review = "";
                                        pst = con.prepareStatement("select review from reviewhost where hostid=? and uid=?");
                                        pst.setString(1, objBO.getHostId());
                                        pst.setString(2, uid);
                                        rs = pst.executeQuery();
                                        while (rs.next()) {
                                            review = rs.getString("review");
                                        }
                                    %>
                                    <div class="nav-tabs-custom">
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a href="#settings" data-toggle="tab"><i class="fa fa-edit"></i> Write a Review</a></li>
                                            <li><a href="#activity" data-toggle="tab"><i class="fa fa-comments-o"></i> Property Reviews</a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="active tab-pane" id="settings" style="min-height: 300px">
                                                <div id="settingsTabRev">
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <div class="col-sm-12">
                                                                <textarea class="form-control" cols="70" rows="10" id="txtAreaReview" placeholder="Write a review about this store"><%if (!review.equals("NA")) {%><%=review%><%}%></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <div class="col-sm-10">
                                                                <button type="button" onclick="submitReview()" id="btnPostReview" class="btn btn-danger" disabled>Post</button>
                                                                <br>  
                                                                <span id="loginFirstMsg" style="font-size: 12px">Login first to post a review</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="successReviewMsg" class="text-center" style="font-size: 16px"> <br>
                                                    <span>Post submitted successfully <br> Thank you.</span>
                                                    <br><br>
                                                </div>
                                                <div id="editReviewMsg" class="text-center" style="font-size: 16px"> <br>
                                                    <span>You have already posted a review. <br> Do you want to edit it. 
                                                        <a href="javascript:RepostReview()"> Click here</a></span>
                                                    <br><br>
                                                </div>
                                            </div>
                                            <div class="tab-pane pre-scrollable" style="min-height: 300px" id="activity">
                                                <%
                                                    int reviewCount = 0;
                                                    pst = con.prepareStatement("select * from view_reviewhost where hostid=? order by reviewdate desc");
                                                    pst.setString(1, objBO.getHostId());
                                                    rs = pst.executeQuery();
                                                    while (rs.next()) {
                                                        if (!(rs.getString("review")).equals("NA")) {
                                                            reviewCount++;
                                                %>
                                                <div class="post">
                                                    <div class="user-block">
                                                        <img class="img-circle img-bordered-sm" src="images/hostelphotos/shopIcon_sm.png" alt="Hostel Photo">
                                                        <span class="username">
                                                            <a href="javascript:;"><%=rs.getString("fnm")%> <%=rs.getString("lnm")%></a>
                                                        </span>
                                                        <span class="description"><%=rs.getString("reviewdate")%></span>
                                                    </div>
                                                    <span style="margin-left: 9%">
                                                        <%=rs.getString("review")%>
                                                    </span>
                                                </div>
                                                <%}
                                                    }
                                                    if (reviewCount == 0) {
                                                %>
                                                <span style="text-align: center"><a href="#settings" data-toggle="tab" style="font-size: 16px">Be the first to post a review, click here</a></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="box box-solid" id="directionPanel" style="max-height: 400px; min-height: 427px;">
                                        <div class="box-header">
                                            <i class="fa fa-map-marker"></i>
                                            <h3 class="box-title">Direction to Store</h3>
                                        </div>
                                        <div class="box-body border-radius-none"id="right-panel">
                                        </div>
                                    </div>
                                    <div class="box box-solid">
                                        <div class="box-header">
                                            <i class="ion ion-clipboard"></i>
                                            <h3 class="box-title">Description</h3>
                                        </div>
                                        <div class="box-body border-radius-none" style="padding-bottom: 20px; min-height: 200px; text-align: justify; font-size: 15px">
                                            <%=objBO.getDescription()%>
                                        </div>
                                    </div>
                                    <div class="box box-widget widget-user">
                                        <div class="widget-user-header bg-aqua-active text-center">
                                            <h4>Property Insights</h4>
                                        </div>
                                        <div class="widget-user-image">
                                            <img class="img-circle" src="images/hostelphotos/<%=objBO.getPhoto()%>" alt="Hostel Photo">
                                        </div>
                                        <div class="box-footer">
                                            <div class="row">
                                                <div class="col-sm-4 border-right">
                                                    <div class="description-block">
                                                        <h5 class="description-header"><%=objBO.getVisitCount()%></h5>
                                                        <span class="description-text">Visits</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4 border-right">
                                                    <div class="description-block">
                                                        <h5 class="description-header"><%=objBO.getRating()%></h5>
                                                        <span class="description-text">Contacted</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="description-block">
                                                        <h5 class="description-header"><%=objBO.getReviewCount()%></h5>
                                                        <span class="description-text">Reviews</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box box-primary " id="similarSearches">
                                        <div class="box-header">
                                            <i class="fa fa-search"></i>
                                            <h3 class="box-title">Similar Searches</h3>
                                        </div>
                                        <div class="box-body manageHeightMin pre-scrollable">
                                            <ul class="todo-list">
                                                <%
                                                    int similarCount = 0;
                                                    pst = con.prepareStatement("select hostname, gurkha from hostel where hostid!=? order by hostname limit 10");
                                                    pst.setString(1, objBO.getHostId());
                                                    rs = pst.executeQuery();
                                                    while (rs.next()) {
                                                        similarCount++;
                                                %>
                                                <li>
                                                    <a href="hostDetails.jsp?id=<%=rs.getString("gurkha")%>">
                                                        <span class="handle">
                                                            <i class="fa fa-map-marker"></i>
                                                        </span>
                                                        <span class="text"><%=rs.getString("hostname")%></span>
                                                        <div class="tools">
                                                            <i class="fa fa-external-link"></i>
                                                        </div>
                                                    </a>
                                                </li>
                                                <%}
                                                    if (similarCount == 0) {
                                                %>
                                                <span style="font-size: 16px">No similar searches found</span>
                                                <%}%>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 hidden-xs">
                            <img src="images/ad_myshejari.jpg"><br><br>
                            <img src="images/ad_myshejari.jpg">
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <div id="contactHostelModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <b><i class="fa fa-phone"></i> 
                            Contact Details
                        </b>
                    </h4>
                </div>
                <div class="modal-body text-center">
                    <div class="row">
                        <div class="col-md-4">
                            <img id="modalImg" src="images/hostelphotos/<%=objBO.getPhoto()%>" style="width: 150px; height: 100px">
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                                <span style="font-size: 28px;"> <%=objBO.getHostName()%></span>
                                <br><br>
                                <span style="font-size: 20px; font-weight: bold">
                                    Contact No. : <a href="tel:<%=objBO.getContact()%>"><%=objBO.getContact()%></a>
                                </span>
                                <br><br>
                                <span style="font-size: 20px;font-weight: bold">
                                    Email Address : <a href="mailto:<%=objBO.getEmail()%>"><%=objBO.getEmail()%></a>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row text-center">
                        <hr>
                        <div class="col-xs-12">
                            <span>Thank you for visiting</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="plugins/fastclick/fastclick.js"></script>
    <script src="dist/js/app.min.js"></script>
    <script src="dist/js/pages/dashboard.js"></script>
    <script src="dist/js/demo.js"></script>
    <script src="js/jquery.newsTicker.min.js"></script> 
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6XvLNwRfIt-b_F1X3QPta6yAK5Yh0mj4"></script>
    <script src="js/custom.js"></script>
    <jsp:include page="modals.jsp"/>

    <script>
        var amenities="<%=objBO.getAmenities()%>";
        //  alert(amenities);
        var strarray = amenities.split(',');
        //alert(strarray[1]);
        if(strarray[0]=="1")
        {
            $("#lift").removeClass("checkbox");
            $("#lift").addClass("availAmenity");
        }
        if(strarray[1]=="1")
        {
            $("#ac").removeClass("checkbox");
            $("#ac").addClass("availAmenity");
        }
        if(strarray[2]=="1")
        {
            $("#swim").removeClass("checkbox");
            $("#swim").addClass("availAmenity");
        }
        if(strarray[3]=="1")
        {
            $("#harvest").removeClass("checkbox");
            $("#harvest").addClass("availAmenity");
        }
        if(strarray[4]=="1")
        {
            $("#servantroom").removeClass("checkbox");
            $("#servantroom").addClass("availAmenity");
        }
        if(strarray[5]=="1")
        {
            $("#gas").removeClass("checkbox");
            $("#gas").addClass("availAmenity");
        }
        if(strarray[6]=="1")
        {
            $("#gym").removeClass("checkbox");
            $("#gym").addClass("availAmenity");
        }
        if(strarray[7]=="1")
        {
            $("#power").removeClass("checkbox");
            $("#power").addClass("availAmenity");
        }
        if(strarray[8]=="1")
        {
            $("#firesafe").removeClass("checkbox");
            $("#firesafe").addClass("availAmenity");
        }
        if(strarray[9]=="1")
        {
            $("#club").removeClass("checkbox");
            $("#club").addClass("availAmenity");
        }
        if(strarray[10]=="1")
        {
            $("#play").removeClass("checkbox");
            $("#play").addClass("availAmenity");
        }
        if(strarray[11]=="1")
        {
            $("#security").removeClass("checkbox");
            $("#security").addClass("availAmenity");
        }
        if(strarray[12]=="1")
        {            
            $("#park").removeClass("checkbox");
            $("#park").addClass("availAmenity");
        }
        if(strarray[13]=="1")
        {
            $("#housekeeping").removeClass("checkbox");
            $("#housekeeping").addClass("availAmenity");
        }
        if(strarray[14]=="1")
        {
            $("#internet").removeClass("checkbox");
            $("#internet").addClass("availAmenity");
        }
        if(strarray[15]=="1")
        {
            $("#parking").removeClass("checkbox");
            $("#parking").addClass("availAmenity");
        }
    </script>
    <%
        String coords = objBO.getMaplocation();
        String[] str = coords.split(",");
        String la = str[0], ln = str[1];
    %>
    <script>
        function RepostReview()
        {
            $("#editReviewMsg").hide();
            $("#settingsTabRev").show();
            $("#successReviewMsg").hide();
        }
        var userId="<%=uid%>";
        //alert(userId);
        if(userId!="null")
        {
            $("#btnPostReview").removeAttr("disabled");
            $("#txtAreaReview").removeAttr("disabled");
            $("#loginFirstMsg").hide();
            $("#successReviewMsg").hide();
            $("#editReviewMsg").hide();
            getUserRatedCount();
            checkIconColor();
        }
        else
        {
            $("#btnPostReview").attr("disabled","disabled");
            $("#txtAreaReview").attr("disabled","disabled");
            $("#loginFirstMsg").show();
            $("#editReviewMsg").hide();
            $("#successReviewMsg").hide();
        }
        $("#directionPanel").hide();
        $('#btnGetDirection').click(function() {
            origin = $("#origin").val().trim();
            if(!origin.length>0){
                $("#directionPanel").hide();
                $("#origin").focus();
            }
        });
        
        var la=<%=la%>;
        var ln=<%=ln%>;
        var destination;
        var origin;
        var dist = document.getElementById("lblDistance");
        dist.innerHTML="";
            
        function initMap() {
            //   alert();
            var store = {lat: la, lng: ln};
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 18,
                center: store
            });
            var marker = new google.maps.Marker({
                position: store,
                map: map
            }); 
            getReverseGeocode(la, ln);
            origin = $("#origin").val().trim();
            if(origin!=""){
                if (origin.indexOf("amravati")==-1) {
                    origin+=" amravati";
                    //alert(origin);
                }
            }
            if(origin!="" && origin.length!=0){
                var directionsDisplay = new google.maps.DirectionsRenderer;
                var directionsService = new google.maps.DirectionsService;
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 18,
                    center: {lat: 20.937172, lng: 77.779448}
                });
                directionsDisplay.setMap(map);
                document.getElementById('right-panel').innerHTML="";
                directionsDisplay.setPanel(document.getElementById('right-panel'));
                calculateAndDisplayRoute(directionsService, directionsDisplay);
            }
        }
        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
            var start = origin;
            var end = destination;
            directionsService.route({
                origin: start,
                destination: end,
                travelMode: 'DRIVING'
            }, function(response, status) {
                if (status === 'OK') {
                    $("#directionPanel").show();
                    $("#similarSearches").hide();
                    directionsDisplay.setDirections(response);
                    
                } else {
                    $("#lblDistance").hide();
                    $("#directionPanel").hide();
                    window.alert('No such location found');
                    //initMap();
                }
            });
            //
            var start = origin,
            end = destination,
            svc = new google.maps.DistanceMatrixService();

            svc.getDistanceMatrix(
            {
                origins: [start],
                destinations: [end],
                travelMode: google.maps.TravelMode.DRIVING,
                avoidHighways: false,
                avoidTolls: false
            }, 
            callback
        );

            function callback(response, status) {
                if(status=="OK") {
                    dist.innerHTML = response.rows[0].elements[0].distance.text+" away from your location";
                } else {
                    alert("Error: " + status);
                }
            }
        }
        function getReverseGeocode(lat, lng) {
            //                alert(lat+", "+lng);
            var latlng = new google.maps.LatLng(lat, lng);
            //              alert(latlng);
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({'location': latlng}, function(results, status) {
                if (status === 'OK') {
                    if (results[1]) {
                        destination = results[1].formatted_address;
                        //                        alert(address);
                    } else {
                        window.alert('No results found');
                    }
                } else {
                    window.alert('Geocoder failed due to: ' + status);
                }
            });
        }
    </script>
    <%
        con.close();
    %>
</body>
</html>
