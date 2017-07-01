<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/autocomplete.css" rel="stylesheet" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<style>
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
    int cnt = 0, total = 0;
//            PreparedStatement pst;
//            Connection con;
//            ResultSet rs;
//            Class.forName("com.mysql.jdbc.Driver");
//            DBConnector dbc = new DBConnector();
//            con = DriverManager.getConnection(dbc.getConstr());

    String fnm = String.valueOf(session.getAttribute("fnm"));
    String uid = String.valueOf(session.getAttribute("uid"));

%>
<div class="navbar-custom-menu">
    <div class="main-header">
        <nav id="main-headers navbar navbar-static-top" style="background-color: #605ca8;">
            <div class="container">
                <div class="row row3">
                    <div class="col-sm-3">
                        <h2 style="margin:0px; color: white; font-family: forte"><a href="javascript:;" style="color: #fff"><span class="smallnav menu" onclick="openNav()">☰ MyShejari</span></a></h2>
                        <h1 style="margin:0px; color: white; font-family: forte"><a href="index.jsp" style="color: #fff"><span class="largenav" style="margin-top: 10px"><img src="images/logoFinal.png" style="width: 90px; height: 70px">MyShejari</span></a></h1>
                    </div>
                    <div class="flipkart-navbar-search smallsearch col-sm-7 col-xs-10" style="margin-top: 20px">
                        <div class="row">
                            <button class="flipkart-mapmarker col-xs-1">
                                <img src="images/storephotos/shopIcon_sm.png" width="23px" height="25px">
                            </button>
                            <input class="flipkart-navbar-input col-xs-9" type="search" placeholder="Search by Name or Category" name="autocomplete" id="autocomplete">
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
                            My Cart
                            <span class="item-number "><%=total%></span>
                        </a>
                    </div>
                </div>
                <div class="row row1" style="padding-top: 0px;">
                    <ul class="largenav pull-right">
                        <li class="upper-links dropdown" style="color: white">
                            <a class="links" id="login-after-div" href="javascript:;">                       
                                <i class="fa fa-user"></i>  
                                <%=fnm%></a>
                            <ul class="dropdown-menu">
                                <li class="profile-li"><a class="profile-links" href="myProfile.jsp">My Profile</a></li>
                                <li class="profile-li"><a class="profile-links" href="settings.jsp">Settings</a></li>
                                <li class="profile-li"><a class="profile-links" href="logout.jsp">Logout</a></li>
                            </ul>
                        </li>
                        <li class="upper-links"><a class="links" id="login-before-div" href="javascript:;" data-toggle="modal" data-target="#loginModal">Login</a></li>
                        <li class="upper-links"><a class="links" href="#">Start a business</a></li>
                        <li class="upper-links"><a class="links" href="javascript:;" data-toggle="modal" data-target="#contactModal">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div id="mySidenav" class="sidenav">
                <div class="container" style="background-color: #2874f0; padding-top: 10px;">
                    <span class="sidenav-heading"><a href="index.jsp"><i class="fa fa-user"></i> Ankush</a></span>
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                </div>
                <div class="container" style="background-color: #2874f0; padding-top: 10px;">
                    <span class="sidenav-heading"><a href="index.jsp"><i class="fa fa-user"></i> Ankush</a></span>
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                </div>
                <a href="#">Link</a>
                <a href="#">Link</a>
                <a href="#">Link</a>
                <a href="#">Link</a>
            </div>
        </nav>
    </div>
    <br><br><br>
    <script type="text/javascript" src="js/jquery.autocomplete.js"></script>
    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "70%";
            // document.getElementById("flipkart-navbar").style.width = "50%";
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
    </script>