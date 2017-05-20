<%-- 
    Document   : SetStoreLocation
    Created on : 30 Apr, 2017, 11:10:55 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            padding:20px
        }
        #map-canvas {        
            height: 400px;
            width: 600px;        
        }
        pre {
            border:1px solid #D6E0F5;
            padding:5px;
            margin:5px;
            background:#EBF0FA;
        }
        table {
            border-collapse: collapse;
        }
        td{ border: 1px solid #B0B0B0;
            padding: 5px;
            background-color: #F8F8F8 ;               
        }          
    </style>

    <script type="text/javascript">
        
        //        //  $(document).ready(function() {
        //        // this a jQuery event that is fired when document is ready. It allows us to start using useful jQuery selectors
        //        var map;
        //        var latitude;
        //        var longitude;
        //        var myLocation;
        //        var myInfoWindow;
        //        var count=0;
        //            
        //        function getLocation(){
        //            var geocoder = new google.maps.Geocoder();
        //            var address = $("#location").val();
        //            // alert(address);
        //            geocoder.geocode( { 'address': address}, function(results, status) {
        //                if (status == google.maps.GeocoderStatus.OK) {
        //                    latitude = results[0].geometry.location.lat();
        //                    longitude = results[0].geometry.location.lng();
        //                    //   alert(latitude+longitude);
        //                } 
        //            });
        //        
        //            myLocation = new google.maps.LatLng(latitude , longitude);
        //            myInfoWindow = new google.maps.InfoWindow();
        //            initialize();
        //        }
        //        // A function to create the marker and InfoWindow
        //        function createMarkerAndInfoWindow(location, name, html) {
        //            // create marker for location provided
        //            var marker = new google.maps.Marker({
        //                position : location,
        //                map: map,
        //                title: 'Drag Marker',
        //                draggable: true
        //            });
        //
        //            // Add listener on market which will show infoWindow when clicked
        //            google.maps.event.addListener(marker, "click", function() {
        //                myInfoWindow.setContent(html);
        //                myInfoWindow.open(marker.getMap(), marker);
        //            });
        //			
        //            // Add listener on 'drag end' event, add logitude and latitude to beginning of table
        //            google.maps.event.addListener(marker, 'dragend', function(evt){
        //                var lat = evt.latLng.lat().toFixed(5) ;
        //                var longi = evt.latLng.lng().toFixed(5);
        //                    
        //                $("#lat").val(lat);
        //                $("#long").val(longi);
        //            });
        //
        //            // listener on drag event
        //            google.maps.event.addListener(marker, 'dragstart', function(evt){
        //                // nothing for now
        //            });
        //            //  alert("Marker created");
        //
        //            return marker;
        //        }
        //        var cnt=0;
        //        function initialize() {
        //            //  alert("initialized");
        //            var mapOptions = {
        //                zoom : 16,
        //                center : myLocation,
        //                draggable: true,
        //                mapTypeId : google.maps.MapTypeId.ROADMAP
        //            };
        //            map = new google.maps.Map($('#map-canvas')[0], mapOptions);
        //            // add marker
        //            var marker = createMarkerAndInfoWindow(myLocation, "myMarkerName", "Drag the marker <br/> to the shop position <br/> Make sure it is correct!");
        //            marker.setMap(map);	
        //        }
        // google.maps.event.addDomListener(window, 'load', initialize);
        //});

    </script>
    <body>
        Location <input type="text" name="location" id="location" onkeyup="getLocation()" >
        <input type="button" value="Locate" onclick="getLocation()">
        <div id="map-canvas"></div>	
        <br/><br/>
        <input type="text" id="lat"><br>
        <input type="text" id="long">
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6XvLNwRfIt-b_F1X3QPta6yAK5Yh0mj4"></script>	    
    </body>
</html>
