<%-- 
    Document   : storeDetails
    Created on : Mar 12, 2017, 9:21:24 PM
    Author     : Ankush
--%>
<%
    String storeid = request.getParameter("id");
    String uid = String.valueOf(session.getAttribute("uid"));
    ManageStoreBO objBO = new ManageStoreBO();
    ManageDAO objDAO = new ManageDAO();

    objBO.setStoreId(storeid);
    objDAO.getAllStoreDetails(objBO);

    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
    pst = con.prepareStatement("insert into log_popular(storeid, uid, storename, category, city, storearea) values(?,?,?,?,?,?)");
    pst.setString(1, storeid);
    pst.setString(2, uid);
    pst.setString(3, objBO.getStoreName());
    pst.setString(4, objBO.getStoreCat());
    pst.setString(5, objBO.getCity());
    pst.setString(6, objBO.getStoreArea());
    pst.executeUpdate();

    pst = con.prepareStatement("update storedetails set visitcount=visitcount+1 where storeid=?");
    pst.setString(1, storeid);
    pst.executeUpdate();
%>
<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageStoreBO"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=objBO.getStoreName()%></title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/storeDetails.css">
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed" onload="initMap()">
        <div class="wrapper">
            <jsp:include page="headerStoreDetails.jsp"/>

            <div class="content-wrapper">
                <section class="content">
                    <div class="row">
                        <div class="col-md-8">
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
                        <div class="col-md-4">
                            <div class="box">
                                <div class="box-body">
                                    <a class="btn btn-app">
                                        <i class="fa fa-envelope-o"></i> Enquire
                                    </a>
                                    <a class="btn btn-app">
                                        <i class="fa fa-shopping-cart"></i> Offers
                                    </a>
                                    <a class="btn btn-app">
                                        <i class="fa fa-star-o"></i> Rate it
                                    </a>
                                    <a class="btn btn-app">
                                        <i class="fa fa-heart-o"></i> Add to favorite
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="nav-tabs-custom" id="sliderSection">
                                <div class="tab-content no-padding">
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                        </ol>
                                        <div class="carousel-inner" role="listbox">
                                            <div class="item active" >
                                                <img src="images/storephotos/<%=objBO.getStorePhotoLg()%>" alt="Store Photos" width="100%" style="height: 400px">
                                            </div>
                                        </div>
                                    </div>  
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <i class="ion ion-clipboard"></i>
                                    <h3 class="box-title">Full Details</h3>
                                </div>
                                <div class="box-body">
                                    <table>
                                        <tr><td>Full Address </td><td> <%=objBO.getAddress()%></td></tr>
                                        <tr><td>Locality </td><td> <%=objBO.getStoreArea()%></td></tr>
                                        <tr><td>Contact</td><td> <%=objBO.getContact()%></td></tr>
                                        <tr><td>Services</td><td> <%=objBO.getServices()%></td></tr>
                                        <tr><td>Working Hours</td><td> <%=objBO.getWorkingHours()%></td></tr>
                                        <tr><td>Closed On</td><td> <%=objBO.getClosedOn()%></td></tr>
                                        <tr><td>Service Area</td><td> <%=objBO.getServiceArea()%></td></tr>
                                        <tr><td>Website URL</td><td> <%=objBO.getUrl()%></td></tr>
                                        <tr><td></td><td></td></tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Main row -->
                    <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-8 connectedSortable">
                            <div class="box box-danger" id="recentlyJoined">
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
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#settings" data-toggle="tab">Write a Review</a></li>
                                    <li><a href="#activity" data-toggle="tab">Activity</a></li>
                                    <li><a href="#timeline" data-toggle="tab">Timeline</a></li>
                                </ul>
                                <div class="tab-content"  style="max-height: 500px; overflow: hidden;">
                                    <div class="active tab-pane" id="settings">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputName" class="col-sm-2 control-label">Name</label>

                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="inputName" placeholder="Name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputName" class="col-sm-2 control-label">Name</label>

                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="inputName" placeholder="Name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputExperience" class="col-sm-2 control-label">Experience</label>

                                                <div class="col-sm-10">
                                                    <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <button type="submit" class="btn btn-danger">Submit</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane" id="activity">
                                        <!-- Post -->
                                        <div class="post">
                                            <div class="user-block">
                                                <img class="img-circle img-bordered-sm" src="dist/img/user1-128x128.jpg" alt="user image">
                                                <span class="username">
                                                    <a href="#">Jonathan Burke Jr.</a>
                                                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                                                </span>
                                                <span class="description">Shared publicly - 7:30 PM today</span>
                                            </div>
                                            <!-- /.user-block -->
                                            <p>
                                                Lorem ipsum represents a long-held tradition for designers,
                                                typographers and the like. Some people hate it and argue for
                                                its demise, but others ignore the hate as they create awesome
                                                tools to help create filler text for everyone from bacon lovers
                                                to Charlie Sheen fans.
                                            </p>
                                            <ul class="list-inline">
                                                <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>
                                                <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>
                                                </li>
                                                <li class="pull-right">
                                                    <a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments
                                                        (5)</a></li>
                                            </ul>

                                            <input class="form-control input-sm" type="text" placeholder="Type a comment">
                                        </div>
                                        <!-- /.post -->

                                        <!-- Post -->
                                        <div class="post clearfix">
                                            <div class="user-block">
                                                <img class="img-circle img-bordered-sm" src="dist/img/user7-128x128.jpg" alt="User Image">
                                                <span class="username">
                                                    <a href="#">Sarah Ross</a>
                                                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                                                </span>
                                                <span class="description">Sent you a message - 3 days ago</span>
                                            </div>
                                            <!-- /.user-block -->
                                            <p>
                                                Lorem ipsum represents a long-held tradition for designers,
                                                typographers and the like. Some people hate it and argue for
                                                its demise, but others ignore the hate as they create awesome
                                                tools to help create filler text for everyone from bacon lovers
                                                to Charlie Sheen fans.
                                            </p>

                                            <form class="form-horizontal">
                                                <div class="form-group margin-bottom-none">
                                                    <div class="col-sm-9">
                                                        <input class="form-control input-sm" placeholder="Response">
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <button type="submit" class="btn btn-danger pull-right btn-block btn-sm">Send</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="tab-pane  pre-scrollable" id="timeline">
                                        <!-- The timeline -->
                                        <ul class="timeline timeline-inverse">
                                            <!-- timeline time label -->
                                            <li class="time-label">
                                                <span class="bg-red">
                                                    10 Feb. 2014
                                                </span>
                                            </li>
                                            <!-- /.timeline-label -->
                                            <!-- timeline item -->
                                            <li>
                                                <i class="fa fa-envelope bg-blue"></i>

                                                <div class="timeline-item">
                                                    <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                                                    <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                                                    <div class="timeline-body">
                                                        Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                                                        weebly ning heekya handango imeem plugg dopplr jibjab, movity
                                                        jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                                                        quora plaxo ideeli hulu weebly balihoo...
                                                    </div>
                                                    <div class="timeline-footer">
                                                        <a class="btn btn-primary btn-xs">Read more</a>
                                                        <a class="btn btn-danger btn-xs">Delete</a>
                                                    </div>
                                                </div>
                                            </li>
                                            <!-- END timeline item -->
                                            <!-- timeline item -->
                                            <li>
                                                <i class="fa fa-user bg-aqua"></i>

                                                <div class="timeline-item">
                                                    <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                                                    <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request
                                                    </h3>
                                                </div>
                                            </li>
                                            <!-- END timeline item -->
                                            <!-- timeline item -->
                                            <li>
                                                <i class="fa fa-comments bg-yellow"></i>

                                                <div class="timeline-item">
                                                    <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

                                                    <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                                                    <div class="timeline-body">
                                                        Take me to your leader!
                                                        Switzerland is small and neutral!
                                                        We are more like Germany, ambitious and misunderstood!
                                                    </div>
                                                    <div class="timeline-footer">
                                                        <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                                                    </div>
                                                </div>
                                            </li>
                                            <!-- END timeline item -->
                                            <!-- timeline time label -->
                                            <li class="time-label">
                                                <span class="bg-green">
                                                    3 Jan. 2014
                                                </span>
                                            </li>
                                            <!-- /.timeline-label -->
                                            <!-- timeline item -->
                                            <li>
                                                <i class="fa fa-camera bg-purple"></i>

                                                <div class="timeline-item">
                                                    <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

                                                    <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                                                    <div class="timeline-body">
                                                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                                                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                                                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                                                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                                                    </div>
                                                </div>
                                            </li>
                                            <!-- END timeline item -->
                                            <li>
                                                <i class="fa fa-clock-o bg-gray"></i>
                                            </li>
                                        </ul>
                                    </div>

                                </div>
                            </div>

                        </section>
                        <section class="col-lg-4 connectedSortable">
                            <div class="box box-solid" id="directionPanel">
                                <div class="box-header">
                                    <i class="fa fa-map-marker"></i>
                                    <h3 class="box-title">Direction to Store</h3>
                                </div>
                                <div class="box-body border-radius-none"id="right-panel">
                                </div>
                            </div>
                            <div class="box box-widget widget-user">
                                <div class="widget-user-header bg-aqua-active text-center">
                                    <h3 class="widget-user-username"><%=objBO.getStoreName()%></h3>
                                </div>
                                <div class="widget-user-image">
                                    <img class="img-circle" src="images/storephotos/<%=objBO.getStorePhoto()%>" alt="User Avatar">
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
                                                <h5 class="description-header">13,000</h5>
                                                <span class="description-text">Rated</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="description-block">
                                                <h5 class="description-header">3901185</h5>
                                                <span class="description-text">Comments</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box box-primary">
                                <div class="box-header">
                                    <i class="fa fa-search"></i>
                                    <h3 class="box-title">Similar Searches</h3>
                                </div>
                                <div class="box-body">
                                    <ul class="todo-list">
                                        <%
                                            pst = con.prepareStatement("select storename, storeid from storedetails where storeid!=? and category=? order by storename limit 10");
                                            pst.setString(1, storeid);
                                            pst.setString(2, objBO.getStoreCat());

                                            rs = pst.executeQuery();
                                            while (rs.next()) {
                                        %>
                                        <li>
                                            <a href="storeDetails.jsp?id=<%=rs.getInt("storeid")%>">
                                                <span class="handle">
                                                    <i class="fa fa-map-marker"></i>
                                                </span>
                                                <span class="text"><%=rs.getString("storename")%></span>
                                                <div class="tools">
                                                    <i class="fa fa-external-link"></i>
                                                </div>
                                            </a>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </section>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
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
            
        $("#directionPanel").hide();
        $('#btnGetDirection').click(function() {
            origin = $("#origin").val().trim();
            if(origin.length>0 && origin!=null && origin!=" "){
                $("#directionPanel").show();
            }
            else{
                $("#directionPanel").hide();
                alert("Enter your location");
            }
        });
    </script>
    <%
        String coords = objBO.getMapLocation();
        String[] str = coords.split(",");
        String la = str[0], ln = str[1];
    %>
    <script>
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
            origin = document.getElementById("origin").value;
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
                    directionsDisplay.setDirections(response);
                } else {
                    window.alert('Directions request failed due to ' + status);
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
