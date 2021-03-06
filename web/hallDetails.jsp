<%-- 
    Document   : storeDetails
    Created on : Mar 12, 2017, 9:21:24 PM
    Author     : Ankush
--%>
<%@page import="BO.ManageHallBO"%>
<%@page import="DAO.ManageDAO"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<%
    String gurkha = request.getParameter("id");
    String uid = String.valueOf(session.getAttribute("uid"));
    ManageHallBO objBO = new ManageHallBO();
    ManageDAO objDAO = new ManageDAO();

    objBO.setGurkha(gurkha);
    objDAO.getAllHallDetails(objBO);

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

    pst = con.prepareStatement("update halls set visitcount=visitcount+1 where hallid=?");
    pst.setString(1, objBO.getHallId());
    pst.executeUpdate();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=objBO.getHallName()%>, <%=objBO.getAddress()%></title>
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
            .manageHeightMax
            {
                min-height: 550px;
            }
            .manageHeightMin
            {
                min-height: 200px;
                max-height: 200px;
            }
            .changeColor
            {
                color: red;
            }
            table{
                width: 100%;
            }
            td{
                padding-top: 8px;
            }
            #map {
                height: 350px;
                width: 100%;
            }
            #right-panel {
                font-family: 'Roboto','sans-serif';
                line-height: 15px;
                padding-left: 10px;
            }

            #right-panel select, #right-panel input {
                font-size: 15px;
            }

            #right-panel select {
                width: 100%;
            }

            #right-panel i {
                font-size: 10px;
            }
            #right-panel {
                height: 370px;
                width: 100%;
                overflow: auto;
            }
            div.stars {
                text-align: center;
                display: inline-block;
            }

            input.star { display: none; }

            label.star {
                float: right;
                padding: 10px;
                font-size: 20px;
                color: #444;
                transition: all .2s;
            }

            input.star:checked ~ label.star:before {
                content: '\f005';
                color: #FD4;
                transition: all .25s;
            }

            input.star-5:checked ~ label.star:before {
                color: #FE7;
                text-shadow: 0 0 20px #952;
            }

            input.star-1:checked ~ label.star:before { color: #F62; }

            label.star:hover { transform: rotate(-15deg) scale(1.3); }

            label.star:before {
                content: '\f006';
                font-family: FontAwesome;
            }
            #separatorInTable tr
            {
                border-bottom: 1px solid;
                border-color: #E1E1E1;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed" onload="initMap()">
        <div class="wrapper">
            <jsp:include page="header.jsp"/>
            <span id="tooltipMap" style="float: right; padding: 30px;" data-toggle="tooltip" data-placement="bottom" title="Scroll down to see Map">
            </span>
            <div class="content-wrapper">
                <section class="content-header" id="serviceTitle" style="background-color: #fff; padding-bottom: 3px">
                    <h1><img src="images/partyHallIcon.png" style="width: 30px"> Party Hall Details</h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                        <li class="active">Party Hall Details</li>
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
                                                <img class="img-circle" src="images/hallphotos/<%=objBO.getPhoto()%>" alt="Hall Logo">
                                            </div>
                                            <h3 class="widget-user-username"><b><%=objBO.getHallName()%></b></h3>
                                            <h5 class="widget-user-desc"><%=objBO.getHallArea()%></h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <input type="hidden" id="type" value="hall">
                                    <input type="hidden" id="id" value="<%=objBO.getHallId()%>">
                                    <div class="box box-primary">
                                        <div class="box-body text-center">
                                            <a class="btn btn-app bg-aqua" href="javascript:;" data-toggle="modal" data-target="#bookCalendarModal">
                                                <i class="fa fa-calendar-o"></i> Check Dates
                                            </a>
                                            <a class="btn btn-app bg-aqua" href="JavaScript:checkLogin('enq')">
                                                <i class="fa fa-envelope-o" id="enquiredHall"></i> Enquire
                                            </a>
                                            <a class="btn btn-app bg-aqua" href="JavaScript:checkLogin('rate')">
                                                <i class="fa fa-star-o" id="rated"></i> Rate it
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
                                                        <img src="images/hallphotos/<%=objBO.getPhotoLg()%>" alt="Party Hall Photo 1" width="100%" style="height: 400px" class="serviceMobImg">
                                                    </div>
                                                    <%
                                                        if (!objBO.getPhoto2().contains("shopIcon")) {
                                                    %>
                                                    <div class="item" >
                                                        <img src="images/hallphotos/<%=objBO.getPhoto2()%>" alt="Party Hall Photo 2" width="100%" style="height: 400px" class="serviceMobImg">
                                                    </div>
                                                    <%}
                                                        if (!objBO.getPhoto3().contains("shopIcon")) {
                                                    %>
                                                    <div class="item" >
                                                        <img src="images/hallphotos/<%=objBO.getPhoto3()%>" alt="Party Hall Photo 3" width="100%" style="height: 400px" class="serviceMobImg"> 
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
                                <input type="hidden" id="sid" value="<%=objBO.getHallId()%>">
                                <div class="col-md-5">
                                    <div class="box box-primary" style="min-height: 400px">
                                        <div class="box-header with-border">
                                            <i class="ion ion-clipboard"></i>
                                            <h3 class="box-title">Full Details</h3>
                                        </div>
                                        <div class="box-body">
                                            <table style="font-size: 15px" id="separatorInTable">
                                                <tr><td style="font-weight: bold; width: 30%">Full Address </td><td> <%=objBO.getAddress()%></td></tr>
                                                <tr><td style="font-weight: bold; width: 30%">Locality </td><td> <%=objBO.getHallArea()%></td></tr>
                                                <tr><td style="font-weight: bold; width: 30%">Contact</td><td> 
                                                        <a href="tel:<%=objBO.getContact()%>" style="color: #000"><%=objBO.getContact()%></a>
                                                        <%if (!objBO.getPhone().equals("Not Available")) {%>,  
                                                        <a href="tel:<%=objBO.getPhone()%>" style="color: #000"><%=objBO.getPhone()%></a><%}%>
                                                    </td></tr>
                                                <tr><td style="font-weight: bold; width: 30%">Services</td><td> <%=objBO.getHallServices()%></td></tr>
                                                <tr><td style="font-weight: bold; width: 30%">Area (in Sq.Ft.)</td><td> <%=objBO.getHallAreaSqft()%></td></tr>
                                                <tr><td style="font-weight: bold; width: 30%">Email Address</td><td> <%=objBO.getEmail()%></td></tr>
                                                <tr><td style="font-weight: bold; width: 30%">Website URL</td><td> 
                                                        <%if (!objBO.getUrl().equals("Not Available")) {%>
                                                        <a href="<%=objBO.getUrl()%>" target="_blank"><%=objBO.getUrl()%></a><%} else {
                                                        %>
                                                        Not Available
                                                        <%}%>
                                                    </td></tr>
                                            </table>
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
                                        pst = con.prepareStatement("select review from reviewhall where hallid=? and uid=?");
                                        pst.setString(1, objBO.getHallId());
                                        pst.setString(2, uid);
                                        rs = pst.executeQuery();
                                        while (rs.next()) {
                                            review = rs.getString("review");
                                        }
                                    %>
                                    <div class="nav-tabs-custom">
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a href="#settings" data-toggle="tab">
                                                    <i class="fa fa-edit"></i> Write a Review</a></li>
                                            <li><a href="#activity" data-toggle="tab">
                                                    <i class="fa fa-comments-o"></i> Hall Reviews</a></li>
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
                                                    pst = con.prepareStatement("select * from view_reviewhall where hallid=? order by reviewdate desc");
                                                    pst.setString(1, objBO.getHallId());
                                                    rs = pst.executeQuery();
                                                    while (rs.next()) {
                                                        if (!(rs.getString("review")).equals("NA")) {
                                                            reviewCount++;
                                                %>
                                                <div class="post">
                                                    <div class="user-block">
                                                        <img class="img-circle img-bordered-sm" src="images/storephotos/shopIcon_sm.png" alt="user image">
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
                                    <div class="box box-widget widget-user">
                                        <div class="widget-user-header bg-aqua-active text-center">
                                            <h3 class="widget-user-username"><%=objBO.getHallName()%></h3>
                                        </div>
                                        <div class="widget-user-image">
                                            <img class="img-circle" src="images/hallphotos/<%=objBO.getPhoto()%>" alt="Hall Photo">
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
                                                        <span class="description-text">Rating</span>
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
                                    <div class="box box-primary manageHeightMax" id="similarSearches">
                                        <div class="box-header">
                                            <i class="fa fa-search"></i>
                                            <h3 class="box-title">Similar Searches</h3>
                                        </div>
                                        <div class="box-body">
                                            <ul class="todo-list">
                                                <%
                                                    int similarCount = 0;
                                                    pst = con.prepareStatement("select hallname, gurkha, hallid from halls where hallid!=? order by hallname limit 10");
                                                    pst.setString(1, objBO.getHallId());
                                                    rs = pst.executeQuery();
                                                    while (rs.next()) {
                                                        similarCount++;

                                                %>
                                                <li>
                                                    <a href="hallDetails.jsp?id=<%=rs.getString("gurkha")%>">
                                                        <span class="handle">
                                                            <i class="fa fa-map-marker"></i>
                                                        </span>
                                                        <span class="text"><%=rs.getString("hallname")%></span>
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
    <jsp:include page="footer.jsp"/>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="plugins/fastclick/fastclick.js"></script>
    <script src="dist/js/app.min.js"></script>
    <script src="dist/js/demo.js"></script>
    <script src="js/jquery.newsTicker.min.js"></script> 
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6XvLNwRfIt-b_F1X3QPta6yAK5Yh0mj4"></script>
    <script src="js/custom.js"></script>
    <jsp:include page="modals.jsp"/>
    <%
        String coords = objBO.getMapLocation();
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
        getCalendarMonth();
        //render calendar in modal
        var xmlhttp;
        function getCalendarMonth()
        {
            var month=document.getElementById("month").value;
            var year=document.getElementById("year").value;
            var hallid = <%=objBO.getHallId()%>;
            xmlhttp=GetXmlHttpObject();
            if (xmlhttp==null)
            {
                alert ("Your browser does not support Ajax HTTP");
                return;
            }
            var url="hGetCalendarMonth.jsp";
            url=url+"?hallid="+hallid+"&month="+month+"&year="+year;
            xmlhttp.onreadystatechange=getCalendarMonthOutput;
            xmlhttp.open("GET",url,true);
            xmlhttp.send(null);
        }
        function getCalendarMonthOutput()
        {
            if (xmlhttp.readyState==4)
            {
                //alert(xmlhttp.responseText);
                var res = xmlhttp.responseText;
                res=res.trim();
                if(res.startsWith("<table")){
                    document.getElementById("showCalendar").innerHTML=xmlhttp.responseText;
                }
                else{
                    alert("Failed to load selected month");
                }
            }
        }
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
                    $("#similarSearches").removeClass("manageHeightMax")
                    $("#similarSearches").addClass("manageHeightMin pre-scrollable")
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
    <%  con.close();%>
</body>
</html>
