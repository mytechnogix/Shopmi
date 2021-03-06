<%-- 
    Document   : offerDetails
    Created on : Mar 12, 2017, 9:21:24 PM
    Author     : Ankush
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageAdvBO"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    String storeName = "", img = "", tc = "", mapLocation = "", storeId = "";
    String storeArea = "", city = "", advTitle = "", advDesc = "", gurkha = "";

    try {
        gurkha = request.getParameter("aid");
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from view_advertise where gurkha=? and advstatus='Active'");
        pst.setString(1, gurkha);
        rs = pst.executeQuery();
        if (rs.next()) {
            storeName = rs.getString("storename");
            storeId = rs.getString("storeid");
            advTitle = rs.getString("advtitle");
            advDesc = rs.getString("advdesc");
            tc = rs.getString("advtc");
            img = rs.getString("advimg");
            mapLocation = rs.getString("maplocation");
            city = rs.getString("city");
            storeArea = rs.getString("storearea");
        } else {
%><jsp:forward page="index.jsp"/><%        }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=advTitle%> in <%=storeName%>, <%=storeArea%>, <%=city%></title>
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
            #map {
                height: 350px;
                width: 100%;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed"  onload="initMap()">
        <jsp:include page="header.jsp"/>
        <br>
        <div class="wrapper">
            <div class="content-wrapper">
                <section class="content">
                    <div class="row">
                        <div class="col-lg-12">
                            <input type="hidden" id="oid" value="<%=gurkha%>">
                            <input type="hidden" id="sid" value="<%=storeId%>">
                            <img src="images/advphotos/<%=img%>" class="advMobImg" alt="" width="100%" style="height: 450px">
                        </div>
                    </div><br>
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-7">
                                    <div class="box box-primary" style="padding: 10px">
                                        <%
                                            String sGurkha = "#";
                                            pst = con.prepareStatement("select gurkha from storedetails where storeid=? and storestatus='Active'");
                                            pst.setString(1, storeId);
                                            rs = pst.executeQuery();
                                            if (rs.next()) {
                                                sGurkha = rs.getString("gurkha");
                                            }
                                        %>
                                        <a href="storeDetails.jsp?id=<%=sGurkha%>"> 
                                            <h3><span class="text-red"><%=advTitle%></span></h3>
                                            <h4 class="text-blue"> <%=storeName%>, <%=storeArea%>, <%=city%></a></h4>
                                        <br>
                                    </div>
                                </div>
                                <div class="col-lg-5">
                                    <div class="box box-primary">
                                        <div class="box-header">
                                            <h3 class="box-title">Description</h3>
                                        </div>
                                        <div class="box-body">
                                            <span style="text-align: justify; font-size: 16px"><%=advDesc%></span>
                                        </div>
                                    </div>
                                </div>   
                            </div>
                            <div class="row">
                                <div class="col-lg-7">
                                    <div class="box box-primary">
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
                                </div>
                                <div class="col-lg-5">
                                    <div class="box box-primary" style="min-height: 410px">
                                        <div class="box-header">
                                            <h3 class="box-title">Terms and Conditions</h3>
                                        </div>
                                        <div class="box-body">
                                            <span style="text-align: justify; font-size: 16px"><%=tc%></span>
                                        </div>
                                    </div>
                                </div>   
                            </div>
                        </div>
                        <div class="col-lg-2 hidden-xs">
                            <img src="images/ad_myshejari.jpg">
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <jsp:include page="modals.jsp"/>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="plugins/fastclick/fastclick.js"></script>
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/pages/dashboard.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="js/jquery.newsTicker.min.js"></script> 
        <script src="js/custom.js"></script> 
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6XvLNwRfIt-b_F1X3QPta6yAK5Yh0mj4"></script>
        <link href="css/autocomplete.css" rel="stylesheet" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
        <script>
            //  $("#directionPanel").hide();
            $('#btnGetDirection').click(function() {
                origin = $("#origin").val().trim();
                if(origin.length>0 && origin!=null && origin!=" "){
                    //    $("#directionPanel").show();
                }
                else{
                    //  $("#directionPanel").hide();
                    alert("Enter your location");
                }
            });
        </script>
        <%//        String coords = objBO.getMapLocation();
            String[] str = mapLocation.split(",");
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
                    //document.getElementById('right-panel').innerHTML="";
                    // directionsDisplay.setPanel(document.getElementById('temp'));
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
        <%
                con.close();
            } catch (Exception ex) {
                out.print(ex);
            }%>
    </body>
</html>
