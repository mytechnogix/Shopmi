<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection" %>
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
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
%>
<!--<header class="main-header">
    <nav class="navbar navbar-static-top">
        <div class="container" style="width: 95%">
            <div class="navbar-header">
                <a href="index.jsp" class="navbar-brand"><b><img src="images/shejari.com.png" class="img-circle" style="width: 30px; height: 28px">  Shejari</b>.com</a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <i class="fa fa-search"></i>
                </button>
            </div>
            <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <div class="form-group" style="margin-top:  8px">
                            <select class="form-control  btn-warning" id="sel1">
<%
    pst = con.prepareStatement("select distinct city from storedetails order by city");
    rs = pst.executeQuery();
    while (rs.next()) {
%>
<option><%=rs.getString("city")%></option>
<%}%>
</select>
</div>
</li>
</ul>
<form class="navbar-form navbar-left" role="search">
<div class="form-group">    
<div class="input-group">
<input type="text" class="form-control" id="searchQuery" maxlength="60" placeholder="Search by Store Name or Category" >
<div class="input-group-addon" id="crossDiv" style="cursor: pointer; display: none">
<span id="searchclear" class="glyphicon glyphicon-remove-circle"></span>
</div>
</div>
</div>
</form>
<span class="dropdown">
<a href="#" class="sidebar-toggle dropdown-toggle" data-toggle="dropdown" role="button">
<span class="sr-only">Toggle navigation</span>
</a>
<ul class="dropdown-menu" style="padding: 10px; width: 300px">

<li><input type="radio" name="radioService" checked=" checked"> Services and Shops</li>
<li><input type="radio" name="radioService"> Services and Shops</li>
<li><input type="radio" name="radioService"> Services and Shops</li>
<li><input type="radio" name="radioService"> Services and Shops</li>

</ul>
</span>
</div>
<%
    String fnm = String.valueOf(session.getAttribute("fnm"));
    String uid = String.valueOf(session.getAttribute("uid"));

%>
<div class="navbar-custom-menu pull-right">
    <ul class="nav navbar-nav">
<%
    pst = con.prepareStatement("select count(*) as total from view_claimedoffers_notify where uid=? and couponstatus!='Expired'");
    pst.setString(1, uid);
    rs = pst.executeQuery();
    if (rs.next()) {
        total = rs.getInt("total");
    }
    if (total > 0) {
%>
<li class="hidden-xs">
    <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
            <li class="dropdown messages-menu">

                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-bell-o"></i>
                    <span class="label label-success"><%=total%></span>
                </a>
                <ul class="dropdown-menu">
                    <li class="header">Your claimed coupons</li>
                    <li>
                        <ul class="menu">
<%
    String claimDate = "", remTime = "";
    Date dt = Calendar.getInstance().getTime();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
    pst = con.prepareStatement("select * from view_claimedoffers_notify where uid=? and couponstatus='Unused' or uid=? and couponstatus='Expired' order by claimdate desc");
    pst.setString(1, uid);
    pst.setString(2, uid);
    rs = pst.executeQuery();

    while (rs.next()) {
        claimDate = rs.getString("claimdate");
        String ft = formatter.format(dt);
        Date claim = formatter.parse(claimDate);
        Date today = formatter.parse(ft);
        long duration = today.getTime() - claim.getTime();

        long diffInHours = TimeUnit.MILLISECONDS.toHours(duration);
        diffInHours = 48 - diffInHours;
        if (diffInHours <= 48 && !(diffInHours < 0)) {
            remTime = diffInHours + "h Left";
        } else {
            remTime = "Expired";
        }
%>
<li>
    <a href="myOffers.jsp">
        <div class="pull-left">
            <img src="images/offerphotos/<%=rs.getString("offerimg")%>" class="img-circle" alt="User Image">
        </div>
        <h4>
<%=rs.getString("storename")%>
<small><i class="fa fa-clock-o"></i> <%=remTime%></small>
</h4>
<p><%=rs.getString("discount")%>% Off on <%=rs.getString("discounton")%></p>
</a>
</li>
<%}%>
</ul>
</li>
<li class="footer"><a href="#">See All Coupons</a></li>
</ul>
</li>
</ul>
</div>
</li>
<%}%>

<li class="dropdown user user-menu" id="login-after-div">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <span id="user_name"><%=fnm%></span>
    </a>
    <ul class="dropdown-menu">
        <li class="user-header">
            <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            <p>
<%=fnm%>
</p>
</li>
<li class="user-footer">
<div class="pull-left">
<a href="#" class="btn btn-default btn-flat">Profile</a>
</div>
<div class="pull-right">
<a href="JavaScript:loginCheck1('0')" class="btn btn-default btn-flat">Sign out</a>
</div>
</li>
</ul>
</li>
<li class="dropdown notifications-menu" id="login-before-div">
<a href="javascript:;" data-toggle="modal" data-target="#loginModal"> Login</a>
</li>   
<li class="dropdown tasks-menu">
<a href="#" class="dropdown-toggle hidden-xs" data-toggle="dropdown">
Contact Us
</a>
</li>
</ul>
</div>
</div>
</nav>
</header>-->
<div class="main-header">
    <nav id="main-headers navbar navbar-static-top" style="background-color: #605ca8;">
        <div class="container">
            <div class="row row3">
                <div class="col-sm-3">
                    <h2 style="margin:0px; color: white; font-family: forte"><a href="javascript:;" style="color: #fff"><span class="smallnav menu" onclick="openNav()">☰ MyShejari</span></a></h2>
                    <h1 style="margin:0px; color: white; font-family: forte"><a href="index.jsp" style="color: #fff"><span class="largenav" style="margin-top: 10px"><img src="images/logoFinal.png" style="width: 70px; height: 70px">MyShejari</span></a></h1>
                </div>
                <div class="flipkart-navbar-search smallsearch col-sm-7 col-xs-10" style="margin-top: 20px">
                    <div class="row">
                        <button class="flipkart-mapmarker col-xs-1">
                            <img src="images/storephotos/shopIcon_sm.png" width="23px" height="25px">
                        </button>
                        <input class="flipkart-navbar-input col-xs-9" type="search" placeholder="Search by Name or Category" name="searchQuery" id="searchQuery">
                        <button class="flipkart-navbar-button col-xs-1" id="searchIcon">
                            <svg width="15px" height="15px">
                            <path d="M11.618 9.897l4.224 4.212c.092.09.1.23.02.312l-1.464 1.46c-.08.08-.222.072-.314-.02L9.868 11.66M6.486 10.9c-2.42 0-4.38-1.955-4.38-4.367 0-2.413 1.96-4.37 4.38-4.37s4.38 1.957 4.38 4.37c0 2.412-1.96 4.368-4.38 4.368m0-10.834C2.904.066 0 2.96 0 6.533 0 10.105 2.904 13 6.486 13s6.487-2.895 6.487-6.467c0-3.572-2.905-6.467-6.487-6.467 "></path>
                            </svg>
                        </button>
                        <button class="flipkart-navbar-button col-xs-1" id="crossIcon" style="display: none">
                            <i class="fa fa-close"></i>
                        </button>
                    </div>
                </div>
                <div class="cart largenav col-sm-2" style="margin-top: 20px">
                    <a href="javascript:checkLogin('uLogin')" class="cart-button" style="color: white">
                        <svg class="" width="16px" height="14px" style="overflow: visible;">
                        <path d="M8.037 17.546c1.487 0 2.417-.93 2.417-2.417H5.62c0 1.486.93 2.415 2.417 2.415m5.315-6.463v-2.97h-.005c-.044-3.266-1.67-5.46-4.337-5.98v-.81C9.01.622 8.436.05 7.735.05 7.033.05 6.46.624 6.46 1.325v.808c-2.667.52-4.294 2.716-4.338 5.98h-.005v2.972l-1.843 1.42v1.376h14.92v-1.375l-1.842-1.42z" fill="#fff"></path>
                        </svg>
                        <!--                        <svg class="cart-svg " width="16 " height="16 " viewBox="0 0 16 16 ">
                                                <path d="M15.32 2.405H4.887C3 2.405 2.46.805 2.46.805L2.257.21C2.208.085 2.083 0 1.946 0H.336C.1 0-.064.24.024.46l.644 1.945L3.11 9.767c.047.137.175.23.32.23h8.418l-.493 1.958H3.768l.002.003c-.017 0-.033-.003-.05-.003-1.06 0-1.92.86-1.92 1.92s.86 1.92 1.92 1.92c.99 0 1.805-.75 1.91-1.712l5.55.076c.12.922.91 1.636 1.867 1.636 1.04 0 1.885-.844 1.885-1.885 0-.866-.584-1.593-1.38-1.814l2.423-8.832c.12-.433-.206-.86-.655-.86 " fill="#fff "></path>
                                                </svg> -->
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
            <a href="#"></a>
            <a href="#"></a>
            <a href="#">Link</a>
            <a href="#">Link</a>
        </div>
    </nav>
</div>
<br><br><br>
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