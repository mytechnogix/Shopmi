<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Add Marriage Halls</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6XvLNwRfIt-b_F1X3QPta6yAK5Yh0mj4"></script>	    
        <script>
            //  $(document).ready(function() {
            // this a jQuery event that is fired when document is ready. It allows us to start using useful jQuery selectors
            var map;
            var latitude;
            var longitude;
            var myLocation;
            var myInfoWindow;
            
            function getStoreLocation(){
                var geocoder = new google.maps.Geocoder();
                var address = $("#txtLocation").val();
                // alert(address);
                address=address.trim();
                if(address!="" && address!=null){
                    geocoder.geocode( {
                        'address': address
                    }, function(results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            latitude = results[0].geometry.location.lat();
                            longitude = results[0].geometry.location.lng();
                            // alert(latitude+longitude);
                        } 
                    });
        
                    myLocation = new google.maps.LatLng(latitude , longitude);
                    myInfoWindow = new google.maps.InfoWindow();
                    initializeLocator();
                }
                else
                {
                    return false;
                }
            }
            // A function to create the marker and InfoWindow
            function createMarkerAndInfoWindow1(location, name, html) {
                // create marker for location provided
                var marker = new google.maps.Marker({
                    position : location,
                    map: map,
                    title: 'Drag Marker',
                    draggable: true
                });

                // Add listener on market which will show infoWindow when clicked
                google.maps.event.addListener(marker, "click", function() {
                    myInfoWindow.setContent(html);
                    myInfoWindow.open(marker.getMap(), marker);
                });
			
                // Add listener on 'drag end' event, add logitude and latitude to beginning of table
                google.maps.event.addListener(marker, 'dragend', function(evt){
                    var lat = evt.latLng.lat().toFixed(5) ;
                    var longi = evt.latLng.lng().toFixed(5);
                    
                    $("#txtLat").val(lat);
                    $("#txtLong").val(longi);
                });

                // listener on drag event
                google.maps.event.addListener(marker, 'dragstart', function(evt){
                    // nothing for now
                });
                //  alert("Marker created");

                return marker;
            }
            var cnt=0;
            function initializeLocator() {
                //  alert("initialized");
                var mapOptions = {
                    zoom : 16,
                    center : myLocation,
                    draggable: true,
                    mapTypeId : google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map($('#map-canvas1')[0], mapOptions);
                // add marker
                var marker = createMarkerAndInfoWindow1(myLocation, "myMarkerName", "Drag the marker <br/> to the shop position <br/> Make sure it is correct!");
                marker.setMap(map);	
            }

        </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="aHeader.jsp"/>
            <jsp:include page="aSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Add Marriage Halls
                        <small>( Step 1 of 3 )</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Store</li>
                        <li class="active">Add Marriage Halls</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <form role="form" action="aAddStoreLocationCheck.jsp" onsubmit="return validateAddStore();">
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Search Store Location</label>
                                                    <div class="input-group margin">
                                                        <input type="text" id="txtLocation" onkeyup="getStoreLocation()" class="form-control" placeholder="Enter store area and city to locate" >
                                                        <span class="input-group-btn">
                                                            <div class="btn btn-info" onclick="getStoreLocation()">Locate on Map</div>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div id="map-canvas1" style="width: 100%;height: 400px"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Latitude</label>
                                                    <input type="text" id="txtLat" name="txtLat" class="form-control" placeholder="Auto filled">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Longitude</label>
                                                    <input type="text" id="txtLong" name="txtLong" class="form-control" placeholder="Auto filled">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Next</button>
                                        <input type="reset" value="Reset" class="btn btn-primary">
                                        <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div> 
                </section>
            </div>
            <jsp:include page="aSideMenuRight.jsp"/>
            <jsp:include page="aFooterFiles.jsp"/>
            <script>
                $('#bothdates').daterangepicker();
            </script>
        </div>
    </body>
</html>
