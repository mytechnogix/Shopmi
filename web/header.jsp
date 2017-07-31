<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<noscript>
<meta http-equiv="refresh" content="0; url=nojs.jsp" />
</noscript>
<link href="css/autocomplete.css" rel="stylesheet" />
<link href="css/responsive.css" rel="stylesheet" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="icon" href="images/shopIcon_sm.png" type="image/png" sizes="16x16">
<meta name="google-signin-client_id" content="38073448623-gp7csemfcamsndl5l9450420ftrasdl4.apps.googleusercontent.com">
<style>
    .back-to-top {
        cursor: pointer;
        position: fixed;
        bottom: 20px;
        right: 20px;
        display:none;
    }
    #flipkart-navbar {
        background-color: #605ca8;
        color: #000;
    }
    .row1{
        padding-top: 10px;
    }
    .row2 {
        padding-bottom: 20px;
    }
    .flipkart-navbar-input {
        padding: 11px 16px;
        border-radius: 0px 0 0 0px;
        border: 0 none;
        outline: 0 none;
        font-size: 15px;
    }

    .flipkart-navbar-button {
        background-color: #ffe11b;
        border: 1px solid #ffe11b;
        border-radius: 0 2px 2px 0;
        color: #565656;
        padding: 10px 0;
        height: 43px;
        cursor: pointer;
    }

    .flipkart-mapmarker {
        background-color: tomato;
        border: 1px solid #ffe11b;
        border-radius: 2px 0px 0px 2px;
        color: #565656;
        padding: 10px 0;
        height: 43px;
        cursor: pointer;
    }
    .cart-button {
        background-color: #2469d9;
        box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .23), inset 1px 1px 0 0 hsla(0, 0%, 100%, .2);
        padding: 10px 0;
        text-align: center;
        height: 41px;
        border-radius: 2px;
        font-weight: 500;
        width: 120px;
        display: inline-block;
        color: #FFFFFF;
        text-decoration: none;
        color: inherit;
        border: none;
        outline: none;
    }

    .cart-button:hover{
        text-decoration: none;
        color: #fff;
        cursor: pointer;
    }

    .cart-svg {
        display: inline-block;
        width: 16px;
        height: 16px;
        vertical-align: middle;
        margin-right: 8px;
    }

    .item-number {
        border-radius: 3px;
        background-color: rgba(0, 0, 0, .1);
        height: 20px;
        padding: 3px 6px;
        font-weight: 500;
        display: inline-block;
        color: #fff;
        line-height: 12px;
        margin-left: 10px;
    }

    .upper-links {
        display: inline-block;
        padding: 0 11px;
        line-height: 23px;
        font-family: 'Roboto', sans-serif;
        letter-spacing: 0;
        color: inherit;
        border: none;
        outline: none;
        font-size: 12px;
    }

    .dropdown {
        position: relative;
        display: inline-block;
        margin-bottom: 0px;
    }

    .dropdown:hover {
        background-color: whitesmoke;
    }

    .dropdown:hover .links {
        color: #000;
    }

    .dropdown:hover .dropdown-menu {
        display: block;
    }

    .dropdown .dropdown-menu {
        position: absolute;
        top: 100%;
        display: none;
        background-color: #fff;
        color: #333;
        left: 0px;
        border: 0;
        border-radius: 0;
        box-shadow: 0 4px 8px -3px #555454;
        margin: 0;
        /*        padding: 0px;*/
    }

    .links {
        color: #fff;
        text-decoration: none;
    }

    .links:hover {
        color: #fff;
        text-decoration: none;
    }

    .profile-links {
        font-size: 12px;
        font-family: 'Roboto', sans-serif;
        border-bottom: 1px solid #e9e9e9;
        box-sizing: border-box;
        display: block;
        /*        line-height: 2px;*/
        /*        padding: 20px;*/
    }

    .profile-li{
        /*        padding: 12px;*/
    }
    .dropdown-menu > li > a {
        display: block;
        padding: 12px;
        clear: both;
        font-weight: 400;
        line-height: 1.42857143;
        color: #333;
        white-space: nowrap;
    }
    .largenav {
        display: none;
    }

    .smallnav{
        display: block;
    }

    .smallsearch{
        margin-left: 15px;
        margin-top: 15px;
    }

    .menu{
        cursor: pointer;
    }

    @media screen and (min-width: 768px) {
        .largenav {
            display: block;
        }
        .smallnav{
            display: none;
        }
        .smallsearch{
            margin: 0px;
        }
    }

    /*Sidenav*/
    .sidenav {
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        background-color: #0088cc;
        overflow-x: hidden;
        transition: 0.5s;
        box-shadow: 0 4px 8px -3px #555454;
        padding-top: 0px;
    }

    .sidenav a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 25px;
        color: #fff;
        display: block;
        transition: 0.3s
    }

    .sidenav .closebtn {
        position: absolute;
        top: 0;
        right: 25px;
        font-size: 36px;
        margin-left: 50px;
        color: #fff;        
    }

    @media screen and (max-height: 450px) {
        .sidenav a {font-size: 18px;}
    }

    .sidenav-heading{
        font-size: 36px;
        color: #fff;
    }
</style>
<%
    String total = "0";
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());

    String fnm = String.valueOf(session.getAttribute("fnm"));
    String uid = String.valueOf(session.getAttribute("uid"));
    pst = con.prepareStatement("select count(*) as total from claimedoffers where uid=? and couponstatus!='Expired'");
    pst.setString(1, uid);
    rs = pst.executeQuery();
    while (rs.next()) {
        total = rs.getString("total");
    }
%>
<div class="navbar-custom-menu">
    <div class="main-header">
        <nav id="main-headers navbar navbar-static-top" style="background-color: #605ca8;">
            <div class="container">
                <div class="row row3">
                    <div class="col-sm-3">
                        <h2 style="margin:0px; color: white; font-family: forte"><a href="javascript:;" style="color: #fff"><span class="smallnav menu" onclick="openNav()"><img src="images/menu-icon.png" style="width: 40px; height: 25px;"> <img src="images/myshejariHeaderLogo.png" style="width: 32%; height: 40px"></span></a></h2>
                        <h1 style="margin:0px; color: white; font-family: forte"><a href="index.jsp" style="color: #fff"><span class="largenav" style="margin-top: 5px"><img src="images/logoFinal.png" style="width: 80px; height: 70px; padding-bottom: 5px"><img src="images/myshejariHeaderLogo.png" style="width: 60%; height: 60px"></span></a></h1>
                    </div>
                    <div class="flipkart-navbar-search smallsearch col-sm-7 col-xs-10" style="margin-top: 20px">
                        <div class="row searchMob">
                            <button class="flipkart-mapmarker col-xs-1">
                                <img src="images/storephotos/shopIcon_sm.png" width="23px" height="25px">
                            </button>
                            <input class="flipkart-navbar-input col-xs-9" type="search" placeholder="Search by Name or Category" name="autocomplete" maxlength="100" id="autocomplete">
                            <button class="flipkart-navbar-button col-xs-1" id="searchIcon" onclick="search()">
                                <svg width="15px" height="15px">
                                <path d="M11.618 9.897l4.224 4.212c.092.09.1.23.02.312l-1.464 1.46c-.08.08-.222.072-.314-.02L9.868 11.66M6.486 10.9c-2.42 0-4.38-1.955-4.38-4.367 0-2.413 1.96-4.37 4.38-4.37s4.38 1.957 4.38 4.37c0 2.412-1.96 4.368-4.38 4.368m0-10.834C2.904.066 0 2.96 0 6.533 0 10.105 2.904 13 6.486 13s6.487-2.895 6.487-6.467c0-3.572-2.905-6.467-6.487-6.467 "></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="cart largenav col-sm-2" style="margin-top: 20px">
                        <a href="javascript:checkLogin('uLogin')" class="cart-button" style="color: white">

                            <svg class="" width="16px" height="14px" style="overflow: visible;">
                            <path d="M8.037 17.546c1.487 0 2.417-.93 2.417-2.417H5.62c0 1.486.93 2.415 2.417 2.415m5.315-6.463v-2.97h-.005c-.044-3.266-1.67-5.46-4.337-5.98v-.81C9.01.622 8.436.05 7.735.05 7.033.05 6.46.624 6.46 1.325v.808c-2.667.52-4.294 2.716-4.338 5.98h-.005v2.972l-1.843 1.42v1.376h14.92v-1.375l-1.842-1.42z" fill="#fff"></path>
                            </svg>
                            My Offers
                            <span class="item-number "><%=total%></span>
                        </a>
                    </div>
                </div>
                <div class="row row1" style="padding-top: 0px;">
                    <ul class="largenav pull-right">
                        <li class="upper-links dropdown" style="color: white">
                            <a class="links login-after-div" href="javascript:;">                       
                                <i class="fa fa-user"></i>  
                                <%=fnm%></a>
                            <ul class="dropdown-menu">
                                <li class="profile-li"><a class="profile-links" href="myProfile.jsp">My Profile</a></li>
                                <li class="profile-li"><a class="profile-links" href="logout.jsp">Logout</a></li>
                            </ul>
                        </li>
                        <li class="upper-links"><a class="links login-before-div" href="javascript:;" data-toggle="modal" data-target="#loginModal">Login</a></li>
                        <li class="upper-links"><a class="links" href="registerBusiness.jsp">Register your business</a></li>
                        <li class="upper-links"><a class="links" href="businessLogin.jsp">Business Login</a>
                        </li>
                        <li class="upper-links"><a class="links" href="contactus.jsp" target="_blank">Contact Us</a></li>
                    </ul>
                </div>
            </div>
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                <a href="#" style="margin-top: 10px;"> </a>
                <a href="mycart.jsp" class="login-after-div" id="userNameMob"><i class="fa fa-user"></i> <%=fnm%></a>
                <a href="index.jsp" ><i class="fa fa-home"></i> Home</a>
                <a href="javascript:checkLogin('uLogin')" class="login-before-div"><i class="glyphicon glyphicon-gift"></i> Login</a>
                <a href="registerBusiness.jsp" class="login-before-div"><i class="glyphicon glyphicon-gift"></i> Add Business</a>
                <a href="businessLogin.jsp" class="login-before-div"><i class="fa fa-sign-in"></i> Business Login</a>
                <a href="javascript:checkLogin('uLogin')"><i class="glyphicon glyphicon-gift"></i> My Profile</a>
                <a href="contactus.jsp" target="_blank"a><i class="fa fa-envelope-o"></i> Contact Us</a>
                <a href="faq.jsp"><i class="glyphicon glyphicon-question-sign"></i> FAQ</a>
                <a href="logout.jsp" class="login-after-div" id="userLogoutMob"><i class="fa fa-sign-out"></i> Logout</a>
            </div>
        </nav>
    </div>
</div>
<br><br>
<script type="text/javascript" src="js/jquery.autocomplete.js"></script>
<script src="https://apis.google.com/js/platform.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=onLoadGoogleCallback" async defer></script>
<script>
    var previousScroll = 0;
    $(window).scroll(function(event){
        var scroll = $(this).scrollTop();
        if (scroll > previousScroll){
            jQuery('.row1').fadeOut();  
        } else {
            jQuery('.row1').fadeIn();
        }
        previousScroll = scroll;
    });
    $(document).ready(function(){
        $(window).scroll(function () {
            if ($(this).scrollTop() > 50) {
                $('#back-to-top').fadeIn();
            } else {
                $('#back-to-top').fadeOut();
            }
        });
        // scroll body to 0px on click
        $('#back-to-top').click(function () {
            $('#back-to-top').tooltip('hide');
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
        
        $('#back-to-top').tooltip('show');

    });
    function openNav() {
        document.getElementById("mySidenav").style.width = "70%";
        document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.body.style.backgroundColor = "rgba(0,0,0,0)";
    }
</script>
<script type="text/javascript">
    var query;
    var id;
    var type;
    $("#autocomplete").autocomplete({
        //lookup: countries,
        appendTo : ".smallsearch",
        serviceUrl:'Auto', //tell the script where to send requests
        width: 450, //set width
        delay: 500,
        //callback just to show it's working
        onSelect: function (suggestion) {
            //$('#selection').html('You selected: ' + suggestion.value + ', ' + suggestion.data);
            query = suggestion.value;
            var strarray = suggestion.data.split(',');
            id=strarray[0].trim();
            type=strarray[1].trim();
            if(type=="store")
                window.location="storeDetails.jsp?id="+id;
            else if(type=="hall")
                window.location="hallDetails.jsp?id="+id;
            else if(type=="hostel")
                window.location="hostDetails.jsp?id="+id;
            else if(type=="mes")
                window.location="mesDetails.jsp?id="+id;
                
        },
        showNoSuggestionNotice: true
        //noSuggestionNotice: 'Sorry, no matching results
    });
            
    function search()
    {
        var q=$("#autocomplete").val();
        q = q.trim();
        //alert(q);
        if(q==undefined || q==null || q==""){
            return;
        }
        window.location="search.jsp?search="+q;
    }
    
    var gFnm, gLnm, gImg, gEmail;
    function onLoadGoogleCallback(){
        gapi.load('auth2', function() {
            auth2 = gapi.auth2.init({
                client_id: '38073448623-gp7csemfcamsndl5l9450420ftrasdl4.apps.googleusercontent.com',
                cookiepolicy: 'single_host_origin',
                scope: 'profile'
            });

            auth2.attachClickHandler(element, {},
            function(googleUser) {
                $('#loginModal').modal('hide');
                //document.getElementById('data').innerHTML='Signed in: ' + googleUser.getBasicProfile().getName();
                var profile = googleUser.getBasicProfile();
                gFnm=profile.getGivenName();
                gLnm=profile.getFamilyName();
                gImg=profile.getImageUrl();
                gEmail=profile.getEmail();
                
                isExistingUser(gEmail);
                // $('#loginSuccess').modal('show');
                //googleCheck(profile.getGivenName(),profile.getFamilyName(),profile.getImageUrl(),profile.getEmail());
            }, function(error) {
                alert('Sign-in error', error);
            }
        );
        });

        element = document.getElementById('googleSignIn');
    }
    var xmlHttp
    function isExistingUser(str){
        if (typeof XMLHttpRequest != "undefined"){
            xmlHttp= new XMLHttpRequest();
        }
        else if (window.ActiveXObject){
            xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlHttp==null){
            alert("Browser does not support XMLHTTP Request")
            return;
        }
        var url="isExistingUser.jsp?email="+str;
        xmlHttp.onreadystatechange = isExistingUserOutput;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }
    function isExistingUserOutput(){
        if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
            alert(xmlHttp.responseText);
            if(xmlHttp.responseText=="0")
            {
                $('#loginSuccess').modal('show');
            }
            if(xmlHttp.responseText=="1")
            {
                $('#loginSuccess').modal('hide');
                window.location.reload();
            }
        }
    }
    var xmlHttp
    function googleCheck(){
        var gPass=$("#passGoogle").val().trim();
        if(gPass.length<5 || gPass>10)
        {
            $("#password-error-google").text("Password length should be between 5 to 10");
            return;
        }
        if (typeof XMLHttpRequest != "undefined"){
            xmlHttp= new XMLHttpRequest();
        }
        else if (window.ActiveXObject){
            xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlHttp==null){
            alert("Browser does not support XMLHTTP Request")
            return;
        }
        alert(gFnm+gLnm+gEmail+gPass+gImg);
        var url="loginCheckSocial.jsp?fnm="+gFnm+"&lnm="+gLnm+"&img="+gImg+"&email="+gEmail+"&pass="+gPass;
        xmlHttp.onreadystatechange = googleCheckOutput;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }
    function googleCheckOutput(){
        if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
            $('#loginSuccess').modal('hide');
            alert(xmlHttp.responseText);
            if(xmlHttp.responseText=="0")
            {
                alert("Failed");
                return;
            }
            if(xmlHttp.responseText=="1")
            {
                window.location.reload();
            }
        }
    }
    function GetXmlHttpObject()
    {
        if (window.XMLHttpRequest)
        {
            return new XMLHttpRequest();
        }
        if (window.ActiveXObject)
        {
            return new ActiveXObject("Microsoft.XMLHTTP");
        }
        return null;
    }
</script>