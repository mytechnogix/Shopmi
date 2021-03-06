<%-- 
    Document   : storeDetails
    Created on : Mar 12, 2017, 9:21:24 PM
    Author     : Ankush
--%>
<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageStoreBO"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<%
    String gurkha = request.getParameter("id");
    String uid = String.valueOf(session.getAttribute("uid"));
    ManageStoreBO objBO = new ManageStoreBO();
    ManageDAO objDAO = new ManageDAO();
    
    objBO.setGurkha(gurkha);
    objDAO.getAllStoreDetails(objBO);
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

    String rating = String.format("%.1f", Double.parseDouble(objBO.getRating()));

    pst = con.prepareStatement("insert into log_popular(storeid, uid, storename, category, city, storearea) values(?,?,?,?,?,?)");
    pst.setString(1, objBO.getStoreId());
    pst.setString(2, uid);
    pst.setString(3, objBO.getStoreName());
    pst.setString(4, objBO.getStoreCat());
    pst.setString(5, objBO.getCity());
    pst.setString(6, objBO.getStoreArea());
    pst.executeUpdate();

    pst = con.prepareStatement("update storedetails set visitcount=visitcount+1 where storeid=?");
    pst.setString(1, objBO.getStoreId());
    pst.executeUpdate();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=objBO.getStoreName()%>, <%=objBO.getAddress()%></title>
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
            <span id="tooltipMap" style="float: right; padding: 20px;" data-toggle="tooltip" data-placement="bottom" title="Scroll down to see Map">
            </span>
            <input type="hidden" id="uid" value="<%=uid%>">
            <div class="content-wrapper">
                <section class="content-header" id="serviceTitle" style="background-color: #fff; padding-bottom: 3px">
                    <h1> <i class="fa fa-shopping-cart"></i> Shop Details</h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                        <li class="active">Shop Details</li>
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
                                                <img class="img-circle" src="images/storephotos/<%=objBO.getStorePhoto()%>" alt="Shop Logo">
                                            </div>
                                            <h3 class="widget-user-username"><b><%=objBO.getStoreName()%></b></h3>
                                            <h5 class="widget-user-desc"><%=objBO.getStoreCat()%></h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <input type="hidden" id="type" value="store">
                                    <input type="hidden" id="id" value="<%=objBO.getStoreId()%>">
                                    <div class="box box-primary">
                                        <div class="box-body text-center">
                                            <a class="btn btn-app bg-aqua" href="JavaScript:checkLogin('enq')">
                                                <i class="fa fa-envelope-o" id="enquiredStore"></i> Enquire
                                            </a>
                                            <a class="btn btn-app bg-aqua" href="JavaScript:redirectToOffer()">
                                                <i class="fa fa-shopping-cart"></i> Offers
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
                                                        if (!objBO.getStorePhoto2().contains("shopIcon")) {
                                                    %>
                                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                                    <%}
                                                        if (!objBO.getStorePhoto3().contains("shopIcon")) {
                                                    %>
                                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                                    <%}%>
                                                </ol>
                                                <div class="carousel-inner" role="listbox" id="carousalDiv" style="height: 400px">
                                                    <div class="item active" >
                                                        <img src="images/storephotos/<%=objBO.getStorePhotoLg()%>" alt="Store Photos 1" width="100%" style="height: 400px" class="serviceMobImg">
                                                    </div>
                                                    <%
                                                        if (!objBO.getStorePhoto2().contains("shopIcon")) {
                                                    %>
                                                    <div class="item" >
                                                        <img src="images/storephotos/<%=objBO.getStorePhoto2()%>" alt="Store Photos 2" width="100%" style="height: 400px" class="serviceMobImg">
                                                    </div>
                                                    <%}
                                                        if (!objBO.getStorePhoto3().contains("shopIcon")) {
                                                    %>
                                                    <div class="item" >
                                                        <img src="images/storephotos/<%=objBO.getStorePhoto3()%>" alt="Store Photos 3" width="100%" style="height: 400px" class="serviceMobImg"> 
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
                                <div class="col-md-5">
                                    <div class="box box-primary" style="min-height: 400px">
                                        <div class="box-header with-border">
                                            <i class="ion ion-clipboard"></i>
                                            <h3 class="box-title">Full Details</h3>
                                        </div>
                                        <div class="box-body">
                                            <table style="font-size: 16px;" id="separatorInTable">
                                                <tr><td>Full Address </td><td> <%=objBO.getAddress()%></td></tr>
                                                <tr><td>Locality </td><td> <%=objBO.getStoreArea()%></td></tr>
                                                <tr><td>Contact</td><td> 
                                                        <a href="tel:<%=objBO.getContact()%>" style="color: #000"><%=objBO.getContact()%></a>
                                                        <%if (!objBO.getPhone().equals("Not Available")) {%>
                                                        , <a href="tel:<%=objBO.getPhone()%>" style="color: #000"><%=objBO.getPhone()%></a><%}%>
                                                    </td></tr>
                                                <tr><td>Services</td><td> <%=objBO.getServices()%></td></tr>
                                                <tr><td>Working Hours</td><td> <%=objBO.getWorkingHours()%></td></tr>
                                                <tr><td>Closed On</td><td> <%=objBO.getClosedOn()%></td></tr>
                                                <tr><td>Service Area</td><td> <%=objBO.getServiceArea()%></td></tr>
                                                <tr><td>Email Address</td><td> <%=objBO.getEmail()%></td></tr>
                                                <tr><td>Website URL</td><td>
                                                        <%if (!objBO.getUrl().equals("Not Available")) {%><a href="<%=objBO.getUrl()%>" target="_blank"><%=objBO.getUrl()%></a><%} else {
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
                                                <input type="text" class="form-control" id="origin" placeholder="Enter your current location" required>
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
                                        pst = con.prepareStatement("select review from reviewstore where storeid=? and uid=?");
                                        pst.setString(1, objBO.getStoreId());
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
                                                    <i class="fa fa-comments-o"></i> Shop Reviews</a></li>
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
                                                    pst = con.prepareStatement("select * from view_reviewstore where storeid=? order by reviewdate desc");
                                                    pst.setString(1, objBO.getStoreId());
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
                                                <br>
                                                <span style="text-align: center"><a href="#settings" data-toggle="tab" style="font-size: 16px">Be the first to post a review for this shop, click here</a></span>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="box box-solid" id="directionPanel" style="max-height: 400px; min-height: 427px;">
                                        <div class="box-header">
                                            <i class="fa fa-road"></i>
                                            <h3 class="box-title">Direction to Shop</h3>
                                        </div>
                                        <div class="box-body border-radius-none"id="right-panel">
                                        </div>
                                    </div>
                                    <div class="box box-widget widget-user">
                                        <div class="widget-user-header bg-aqua-active text-center">
                                            <h3 class="widget-user-username">Shop Insights</h3>
                                        </div>
                                        <div class="widget-user-image">
                                            <img class="img-circle" src="images/storephotos/<%=objBO.getStorePhoto()%>" alt="Shop Logo">
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
                                                        <h5 class="description-header"><%=rating%></h5>
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
                                                    pst = con.prepareStatement("select storename, gurkha from storedetails where storeid!=? and category=? order by storename limit 10");
                                                    pst.setString(1, objBO.getStoreId());
                                                    pst.setString(2, objBO.getStoreCat());
                                                    rs = pst.executeQuery();
                                                    while (rs.next()) {
                                                        similarCount++;
                                                %>
                                                <li>
                                                    <a href="storeDetails.jsp?id=<%=rs.getString("gurkha")%>">
                                                        <span class="handle">
                                                            <i class="fa fa-map-marker"></i>
                                                        </span>
                                                        <span class="text"><%=rs.getString("storename")%></span>
                                                        <div class="tools">
                                                            <i class="fa fa-external-link"></i>
                                                        </div>
                                                    </a>
                                                </li>
                                                <%}
                                                    con.close();
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
    <script src="dist/js/pages/dashboard.js"></script>
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
        //        alert(userId);
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
</body>
</html>
