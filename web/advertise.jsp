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
    String storeName = "", discount = "", discountOn = "", img = "", tc = "", mapLocation = "", storeId = "";
    String storeArea = "", city = "", advTitle = "", advDesc = "";

    int aid = 0;
    ManageDAO objDAO = new ManageDAO();
    try {
        aid = Integer.parseInt(request.getParameter("aid"));
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from view_advertise where aid=? and advstatus='Active'");
        pst.setInt(1, aid);
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
        }
    } catch (Exception ex) {
        out.print(ex);
    }
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
        <style>
            #map {
                height: 350px;
                width: 100%;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed"  onload="initMap()">
        <jsp:include page="header.jsp"/>
        <div class="wrapper">
            <div class="content-wrapper">
                <section class="content">
                    <div class="row">
                        <div class="col-lg-12">
                            <input type="hidden" id="oid" value="<%=aid%>">
                            <input type="hidden" id="sid" value="<%=storeId%>">
                            <img src="images/advphotos/<%=img%>" class="advMobImg" alt="" width="100%" style="height: 450px">
                        </div>
                    </div><br>
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-7">
                                    <div class="box box-primary" style="padding: 10px">
                                        <h3><span class="text-red"><%=advTitle%></span></h3>
                                        <h4 class="text-blue"><a href="storeDetails.jsp?id=<%=storeId%>">  <%=storeName%>, <%=storeArea%>, <%=city%></a></h4>
                                        <br>
                                    </div>
                                </div>
                                <div class="col-lg-5">
                                    <div class="box box-primary">
                                        <div class="box-header">
                                            <h3 class="box-title">Description</h3>
                                        </div>
                                        <div class="box-body">
                                            <span style="text-align: justify"><%=advDesc%></span>
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
                                            <span style="text-align: justify"><%=tc%></span>
                                        </div>
                                    </div>
                                </div>   
                            </div>
                        </div>
                        <div class="col-lg-2 hidden-xs">
                            <img src="images/ads.PNG">
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
        <!--         getOffer success modal-->
        <div id="couponModal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content" style="border: solid blue">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">
                            <b><i class="fa fa-check"></i> 
                                Congratulations!
                            </b>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row text-center">
                            <div class="col-md-2">
                                <img id="modalImg" src="images/shejari.com.png" style="width: 150px; height: 100px">
                            </div>
                            <div class="col-md-8">
                                <div class="row">
                                    <span id="modalCouponCode" style="font-size: 28px; border: dashed brown; padding: 4px;"></span>
                                    <br><br>
                                    <span id="modalDiscount" style="color: red; font-size: 20px; font-weight: bold"><%=discount%>% Off</span>
                                    On <span id="modalDiscountOn"  style="color: green; font-size: 20px"><%=discountOn%></span>
                                    <br>
                                    In <span id="modalStoreName" style="color: black;font-size: 20px"><%=storeName%></span>
                                    <br><span id="modalStoreArea" style="color: black;font-size: 14px"><%=storeArea%>, <%=city%></span>
                                </div>
                            </div>
                        </div>
                        <div class="row text-center">
                            <hr>
                            <div class="col-xs-12">
                                <span>Note: Take this coupon to the shop to avail discount</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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

    </body>
</html>