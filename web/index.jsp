<%@page import="BO.ManageStoreBO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageOfferBO"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%
    ArrayList<ManageOfferBO> myclass = new ArrayList<ManageOfferBO>();
    ArrayList<ManageStoreBO> recentStores = new ArrayList<ManageStoreBO>();

    ManageDAO objDAO = new ManageDAO();

    myclass = objDAO.getAllOfferDetails();
    recentStores = objDAO.getRecentStores();

    int cnt = 0, total = 0;
    PreparedStatement pst;
    Connection con;
    ResultSet rs, rs1;
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
    pst = con.prepareStatement("update log_counters set visits=visits+1 where counterid=1");
    pst.executeUpdate();
%>
<html lang="en-US">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="38073448623-gp7csemfcamsndl5l9450420ftrasdl4.apps.googleusercontent.com">
        <title>MyShejari.com - Amravati's local business search tool</title>
        <meta name="Description" content="MyShejari.com is a secure ,fast and dedicated local business search tool for Amravati, Maharashtra. Find shops,restaurants,party halls,hostels,mess,caterers,tutors,flower decorators,real estate, event managers, saloons, beauty parlours  or any business in Amravati with map locations. Download MyShejari app now. Post your ad for online marketing.">
        <meta name="Author" content="Technogix Group">
        <link rel="Canonical" href="https://www.myshejari.com/index.jsp">
        <meta name="Robots" content="index, follow">
        <meta name="keywords" content="Amravati's  Local Search tool, Search Engine for Amravati,Amravati Local Website,Amravati Business search engine,,Hotels,Restaurant,events,Discounts in Amravati, local classifieds,Online Marketing for Amravati,Online Marketing in Amravati,Website creation in amravati, software projects,web application experts in amravati, buy software projects,event management in amravati,event managers in amravati,start a business in amravati,software consultancy in amravati,internship in amravati " />

        <meta property="og:type" content="website">
        <meta property="og:title" content="MyShejari.com - Amravati's best local business search too ">
        <meta property="og:description" content="MyShejari.com is a secure ,fast and dedicated local business search tool for Amravati, Maharashtra. Find shops,restaurants,party halls,hostels,mess,caterers,tutors,flower decorators,real estate, event managers, saloons, beauty parlours  or any business in Amravati with map locations. Download MyShejari app now. Post your ad for online marketing.">
        <meta property="og:url" content="https://www.myshejari.com">
        <meta property="og:image" content="https://www.myshejari.com/images/logoFinal.png">
        <meta property="fb:app_id" content="1582343271797514">

        <meta name="twitter:card" content="summary">
        <meta name="twitter:title" content="MyShejari.com - Amravati's best local business search tool">
        <meta name="twitter:description" content="MyShejari.com is a secure ,fast and dedicated local business search tool for Amravati, Maharashtra. Find shops,restaurants,party halls,hostels,mess,caterers,tutors,flower decorators,real estate, event managers, saloons, beauty parlours  or any business in Amravati with map locations. Download MyShejari app now. Post your ad for online marketing.">
        <meta name="twitter:image" content="https://www.myshejari.com/images/logoFinal.png">
        <meta name="twitter:image:alt" content="MyShejari Logo">

        <link rel="publisher" href="https://plus.google.com/107618781316510236523">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"/>
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css"/>
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css"/>
        <link rel="stylesheet" href="css/carousalOffers.css"/>
        <link rel="stylesheet" href="css/index.css"/>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <link rel="icon" href="images/logoFinal.png" type="image/png">
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-104138274-1', 'auto');
            ga('send', 'pageview');

        </script>
        <script>
            jQuery(window).load(function(){
                jQuery(".hameid-loader-overlay").fadeOut(500);
            });
        </script>
        <style>
            .hameid-loader-overlay {
                width: 100%;
                height: 100%;
                background: url('images/loadingFinal.gif') center no-repeat #FFF;
                z-index: 99999;
                position: fixed;
            }

            #example1
            {
                font-size: 15px;
            }
            #login-after-div, #login-before-div, #searchResults, #similarResultsWP, #filterWP
            {
                display: none;
            }
            .option-input {
                display: inline-block;
                -webkit-appearance: none;
                -moz-appearance: none;
                -ms-appearance: none;
                -o-appearance: none;
                width: 20px;
                height: 20px;
                -webkit-transition: all 0.15s ease-out 0;
                -moz-transition: all 0.15s ease-out 0;
                transition: all 0.15s ease-out 0;
                background: #cbd1d8;
                border: none;
                color: #fff;
                cursor: pointer;
                text-align: center;
            }

            .option-input:hover { background: #9faab7; }

            .option-input:checked { background: #40e0d0; }

            .option-input:checked::before {
                width: 20px;
                height: 20px;
                content: '\2713';
                display: block;
            }

            .option-input:checked::after {
                -webkit-animation: click-wave 0.65s;
                -moz-animation: click-wave 0.65s;
                animation: click-wave 0.65s;
                background: #40e0d0;
                content: '';
                top: -30px;
                display: block;
            }

            .option-input.radio { border-radius: 50%; }

            .option-input.radio::after { border-radius: 50%; }
            .radioLabel1
            {
                font-size: 14px;
                top: -3px;
                position: relative
            }
            #tawkchat-minified-container
            {
                background-color: #72afd2!important;
            }
        </style>
        <script type="text/javascript">
            var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
            (function(){
                var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
                s1.async=true;
                s1.src='https://embed.tawk.to/595d183850fd5105d0c841ac/default';
                s1.charset='UTF-8';
                s1.setAttribute('crossorigin','*');
                s0.parentNode.insertBefore(s1,s0);
            })();
        </script>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed">
        <div class="hameid-loader-overlay"></div>
        <div class="wrapper">
            <jsp:include page="header.jsp"/>
            <br>
            <div class="content-wrapper">
                <section class="content" id="marqueePad" style="padding: 5px">
                    <div class="row" style="background-color: lightgray; height: 20px" id="marqeePad1">
                        <div class="col-sm-2 text-center">
                            <span style="background-color: black; color: white; padding: 5px">All Categories
                            </span>
                        </div>
                        <div class="col-md-10">
                            <marquee width="100%" onMouseOver="this.stop()" onMouseOut="this.start()">
                                <%  int lCnt = 0;
                                    String[] lbl = {"label-info", "label-primary", "label-warning", "label-success"};
                                    pst = con.prepareStatement("select distinct category from storedetails");
                                    rs = pst.executeQuery();
                                    while (rs.next()) {

                                        if (lCnt == 4) {
                                            lCnt = 0;
                                        }
                                %>
                                <a href="search.jsp?search=<%=rs.getString("category")%>" style="margin-left: 3px; font-size: 14px;" class="label <%=lbl[lCnt]%>"> <%=rs.getString("category")%> </a>
                                <%
                                        lCnt++;
                                    }%>
                            </marquee>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-9">
                            <div class="nav-tabs-custom" id="sliderSection">
                                <div class="tab-content no-padding">
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        <!-- Indicators -->
                                        <ol class="carousel-indicators">
                                            <%
                                                pst = con.prepareStatement("select count(aid) as totalAdv from advertise where advstatus='Active'");
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    total = rs.getInt("totalAdv");
                                                }
                                                for (int i = 0; i < total; i++) {
                                                    if (i == 0) {
                                            %>
                                            <li data-target="#myCarousel" data-slide-to="<%=cnt%>" class="active"></li>
                                            <%} else {%>
                                            <li data-target="#myCarousel" data-slide-to="<%=cnt%>"></li>
                                            <%
                                                    }
                                                    cnt++;
                                                }%>
                                        </ol>
                                        <div class="carousel-inner" role="listbox">
                                            <%
                                                cnt = 0;
                                                pst = con.prepareStatement("select advimg, aid from advertise where advstatus='Active'");
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    if (cnt == 0) {
                                            %>
                                            <div class="item active" >
                                                <a href="advertise.jsp?aid=<%=rs.getString("aid")%>" target="_blank">
                                                    <img src="images/advphotos/<%=rs.getString("advimg")%>" alt="" width="100%" class="advMobImg" style="height: 420px">
                                                </a>
                                            </div>
                                            <%} else {%>
                                            <div class="item">
                                                <a href="advertise.jsp?aid=<%=rs.getString("aid")%>" target="_blank">
                                                    <img src="images/advphotos/<%=rs.getString("advimg")%>" alt="" width="100%" class="advMobImg" style="height: 420px">
                                                </a>
                                            </div>
                                            <%}
                                                    cnt++;
                                                }%>
                                        </div>
                                        <!-- Left and right controls -->
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
                        <div class="col-lg-3">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <i class="fa fa-tags"></i>
                                    <h3 class="box-title">Popular Categories</h3>
                                </div>
                                <div class="box-body">
                                    <ul class="products-list product-list-in-box">
                                        <%
                                            pst = con.prepareStatement("select * from popularcats where catid=1");
                                            rs = pst.executeQuery();
                                            if (rs.next()) {
                                        %>
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="images/catsPopularIcon.png" alt="Shop Icon">
                                            </div>
                                            <div class="product-info">
                                                <a href="JavaScript:setSearchCat('<%=rs.getString("cat1")%>')" class="product-title"><%=rs.getString("cat1")%>
                                                </a>
                                                <span class="product-description">
                                                    <%
                                                        pst = con.prepareStatement("select count(category) as total from storedetails where category=?");
                                                        pst.setString(1, rs.getString("cat1"));
                                                        rs1 = pst.executeQuery();
                                                        if (rs1.next()) {
                                                    %>
                                                    See all <%=rs1.getInt("total")%> Shops
                                                    <%}%>
                                                </span>
                                            </div>
                                        </li>
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="images/catsPopularIcon.png" alt="Shop Icon">
                                            </div>
                                            <div class="product-info">
                                                <a href="JavaScript:setSearchCat('<%=rs.getString("cat2")%>')" class="product-title"><%=rs.getString("cat2")%>
                                                </a>
                                                <span class="product-description">
                                                    <%
                                                        pst = con.prepareStatement("select count(category) as total from storedetails where category=?");
                                                        pst.setString(1, rs.getString("cat2"));
                                                        rs1 = pst.executeQuery();
                                                        if (rs1.next()) {
                                                    %>
                                                    See all <%=rs1.getInt("total")%> Shops
                                                    <%}%>
                                                </span>
                                            </div>
                                        </li>
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="images/catsPopularIcon.png" alt="Category Icon">
                                            </div>
                                            <div class="product-info">
                                                <a href="JavaScript:setSearchCat('<%=rs.getString("cat3")%>')" class="product-title"><%=rs.getString("cat3")%>
                                                </a>
                                                <span class="product-description">
                                                    <%
                                                        pst = con.prepareStatement("select count(category) as total from storedetails where category=?");
                                                        pst.setString(1, rs.getString("cat3"));
                                                        rs1 = pst.executeQuery();
                                                        if (rs1.next()) {
                                                    %>
                                                    See all <%=rs1.getInt("total")%> Shops
                                                    <%}%>
                                                </span>
                                            </div>
                                        </li>
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="images/catsPopularIcon.png" alt="Category Icon">
                                            </div>
                                            <div class="product-info">
                                                <a href="JavaScript:setSearchCat('<%=rs.getString("cat4")%>')" class="product-title"><%=rs.getString("cat4")%>
                                                </a>
                                                <span class="product-description">
                                                    <%
                                                        pst = con.prepareStatement("select count(category) as total from storedetails where category=?");
                                                        pst.setString(1, rs.getString("cat4"));
                                                        rs1 = pst.executeQuery();
                                                        if (rs1.next()) {
                                                    %>
                                                    See all <%=rs1.getInt("total")%> Shops
                                                    <%}%>
                                                </span>
                                            </div>
                                        </li>
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="images/catsPopularIcon.png" alt="Category Icon">
                                            </div>
                                            <div class="product-info">
                                                <a href="JavaScript:setSearchCat('<%=rs.getString("cat5")%>')" class="product-title"><%=rs.getString("cat5")%>
                                                </a>
                                                <span class="product-description">
                                                    <%
                                                        pst = con.prepareStatement("select count(category) as total from storedetails where category=?");
                                                        pst.setString(1, rs.getString("cat5"));
                                                        rs1 = pst.executeQuery();
                                                        if (rs1.next()) {
                                                    %>
                                                    See all <%=rs1.getInt("total")%> Shops
                                                    <%}%>
                                                </span>
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12" id="offerWP">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">
                                        <img src="images/offerIcon.png" style="width: 25px"> Offers for you!
                                    </h3>
                                    <div class="controls pull-right">
                                        <a class="left fa fa-chevron-left btn btn-success" href="#carousel-example"
                                           data-slide="prev"></a><a class="right fa fa-chevron-right btn btn-success" href="#carousel-example"
                                           data-slide="next"></a>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div id="carousel-example" class="carousel slide" data-ride="carousel">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner">
                                            <%
                                                int i = 0;
                                                int remSize = (myclass.size() % 4);
                                                if (remSize != 0) {
                                                    remSize = 4 - remSize;
                                                }
                                                for (i = 0; i < myclass.size(); i++) {

                                                    if (i == 0) {
                                            %>
                                            <div class="item active">
                                                <div class="row">
                                                    <%                                                        }
                                                        if (i == 4 || i == 8 || i == 12 || i == 16) {
                                                    %>
                                                    <div class="item">
                                                        <div class="row">
                                                            <%                                                        }
                                                            %>
                                                            <div class="col-sm-3">
                                                                <a href="offerDetails.jsp?id=<%=myclass.get(i).getOid()%>">
                                                                    <div class="col-item" style="background-color:lightgoldenrodyellow;">
                                                                        <div class="photo">
                                                                            <img src="images/offerphotos/<%=myclass.get(i).getOfferPhoto()%>" class="img-responsive" alt="<%=myclass.get(i).getStoreName()%>"/>
                                                                        </div>
                                                                        <div class="info">
                                                                            <div class="row">
                                                                                <div class="price col-md-6">
                                                                                    <h5><%=myclass.get(i).getDiscountOn()%></h5>
                                                                                    <h5 class="price-text-color">
                                                                                        <%=myclass.get(i).getStoreName()%>
                                                                                    </h5>
                                                                                </div>
                                                                                <div class="rating hidden-sm col-md-6 text-red">
                                                                                    Flat <%=myclass.get(i).getDiscount()%>% Off
                                                                                </div>
                                                                            </div>
                                                                            <div class="clearfix">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <%
                                                                if (i == myclass.size() - 1) {
                                                                    for (int j = 0; j < remSize; j++) {
                                                            %>
                                                            <div class="col-sm-3">
                                                                <a href="offerDetails.jsp?id=0">
                                                                    <div class="col-item" style="background-color:lightgoldenrodyellow;">
                                                                        <div class="photo">
                                                                            <img src="images/offerphotos/shopIcon_lg.png" class="img-responsive" alt="temp"/>
                                                                        </div>
                                                                        <div class="info">
                                                                            <div class="row">
                                                                                <div class="price col-md-6">
                                                                                    <h5>Offer On</h5>
                                                                                    <h5 class="price-text-color">
                                                                                        Storename
                                                                                    </h5>
                                                                                </div>
                                                                                <div class="rating hidden-sm col-md-6 text-red">
                                                                                    Flat 0% Off
                                                                                </div>
                                                                            </div>
                                                                            <div class="clearfix">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <%                                                                }
                                                                }
                                                                if (i == 3 || i == 7 || i == 11 || i == 15 || i == 19) {
                                                            %>
                                                        </div>
                                                    </div>
                                                    <%                                                            }
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="box box-primary">
                                        <div class="box-header">
                                            <h3 class="box-title">
                                                <img src="images/partyHallIcon.png" style="width: 25px">  मंगल कार्यालय
                                            </h3>
                                        </div>
                                        <div class="box-body">
                                            <ul class="products-list product-list-in-box">
                                                <%
                                                    pst = con.prepareStatement("select hallid, hallname, hallnamehindi, hall_area, photo, city from halls where status='Active' order by visitcount desc limit 4;");
                                                    rs = pst.executeQuery();
                                                    while (rs.next()) {
                                                        String img = rs.getString("photo");
                                                        if (img.equals("default.jpg")) {
                                                            img = "shopIcon_sm.png";
                                                        }
                                                %>
                                                <li class="item">
                                                    <a href="hallDetails.jsp?id=<%=rs.getString("hallid")%>" target="_blank">
                                                        <div class="product-img">
                                                            <img src="images/hallphotos/<%=img%>" alt="Hall Icon">
                                                        </div>
                                                        <div class="product-info">
                                                            <%=rs.getString("hallnamehindi")%>
                                                            <span class="product-description"><%=rs.getString("hall_area")%>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
                                                <%}%>
                                                <li class="text-center"><a href="#">See More</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="box box-primary">
                                        <div class="box-header">
                                            <h3 class="box-title">
                                                <img src="images/restoIcon.png" style="width: 25px"> मेस 
                                            </h3>
                                        </div>
                                        <div class="box-body">
                                            <ul class="products-list product-list-in-box">
                                                <%
                                                    String photo = "";
                                                    pst = con.prepareStatement("select mesid, mesname, mesnamehindi, mesarea, photo, city from mes where messtatus='Active' order by visitcount desc limit 4;");
                                                    rs = pst.executeQuery();
                                                    while (rs.next()) {
                                                        photo = rs.getString("photo");
                                                        if (photo.contains("default")) {
                                                            photo = "shopIcon_sm.png";
                                                        }
                                                %>
                                                <li class="item">
                                                    <a href="mesDetails.jsp?id=<%=rs.getString("mesid")%>" target="_blank">
                                                        <div class="product-img">
                                                            <img src="images/mesphotos/<%=photo%>" alt="Mes Icon">
                                                        </div>
                                                        <div class="product-info">
                                                            <%=rs.getString("mesnamehindi")%>
                                                            <span class="product-description"><%=rs.getString("mesarea")%>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
                                                <%}%>
                                                <li class="text-center"><a href="#">See More</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="box box-primary">
                                        <div class="box-header">
                                            <h3 class="box-title">
                                                <i class="fa fa-building"></i>  हॉस्टेल 
                                            </h3>
                                        </div>

                                        <div class="box-body">
                                            <ul class="products-list product-list-in-box">
                                                <%
                                                    photo = "";
                                                    pst = con.prepareStatement("select hostid, hostname, hostnamehindi, hostarea, photo, city from hostel where hoststatus='Active' order by visitcount desc limit 4;");
                                                    rs = pst.executeQuery();
                                                    while (rs.next()) {
                                                        photo = rs.getString("photo");
                                                        if (photo.equalsIgnoreCase("default.jpg")) {
                                                            photo = "shopIcon_sm.png";
                                                        }
                                                %>
                                                <li class="item">
                                                    <a href="hostDetails.jsp?id=<%=rs.getString("hostid")%>" target="_blank">
                                                        <div class="product-img">
                                                            <img src="images/hostelphotos/<%=photo%>" alt="Hostel Icon">
                                                        </div>
                                                        <div class="product-info">
                                                            <%=rs.getString("hostnamehindi")%>
                                                            <span class="product-description"><%=rs.getString("hostarea")%>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
                                                <%}%>
                                                <li class="text-center"><a href="#">See More</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="box box-primary">
                                        <div class="box-header">
                                            <h3 class="box-title">
                                                <img src="images/technogixIcon.png" style="width: 24px">  TechnoGix Corner 
                                            </h3>
                                        </div>
                                        <div class="box-body">
                                            <ul class="products-list product-list-in-box">
                                                <li class="item">
                                                    <a href="tProjGuidance.jsp" target="_blank">
                                                        <div class="product-img">
                                                            <img src="images/technogix_guidance.png" alt="Technogix Guidance">
                                                        </div>
                                                        <div class="product-info" style="font-size: 16px;">
                                                            Project Guidance
                                                            <span class="product-description" style="font-size: 14px">Get project guidance on call
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="item">
                                                    <a href="tTechSeminar.jsp" target="_blank">
                                                        <div class="product-img">
                                                            <img src="images/technogix_seminar.png" alt="Technogix Seminar">
                                                        </div>
                                                        <div class="product-info" style="font-size: 16px;">
                                                            Technical Seminars
                                                            <span class="product-description" style="font-size: 14px;">Connect us to have technical seminar
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="item">
                                                    <a href="tIdeaIncubator.jsp" target="_blank">
                                                        <div class="product-img">
                                                            <img src="images/technogix_idea.png" alt="Technogix Idea">
                                                        </div>
                                                        <div class="product-info" style="font-size: 16px;">
                                                            Idea Incubator
                                                            <span class="product-description" style="font-size: 14px;">Discuss your project idea with us
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="item">
                                                    <a href="javascript:;" data-toggle="modal" data-target="#careerModal">
                                                        <div class="product-img">
                                                            <img src="images/technogix_career.png" alt="Technogix Career">
                                                        </div>
                                                        <div class="product-info" style="font-size: 16px;">
                                                            Careers
                                                            <span class="product-description" style="font-size: 14px;">Set your career with TechnoGix
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row hidden-xs">
                                <div class="col-md-12">
                                    <a href="storeDetails.jsp?id=44" target="_blank"><img src="images/ad_hashtag.jpg" style="width: 100%"></a>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="box box-primary">
                                        <div class="box-header">    
                                            <h3 class="box-title">
                                                <i class="fa fa-shopping-cart"></i> Recently Added Shops
                                            </h3>
                                        </div>
                                        <div class="box-body">
                                            <%
                                                i = 0;
                                                for (i = 0; i < recentStores.size(); i++) {
                                                    if (i == 0 || i == 4 || i == 8 || i == 12) {
                                            %>
                                            <div class="col-lg-3">
                                                <ul class="products-list product-list-in-box">
                                                    <%}%>
                                                    <li class="item">
                                                        <div class="product-img">
                                                            <img src="images/storephotos/<%=recentStores.get(i).getStorePhoto()%>" alt="Shop Icon">
                                                        </div>
                                                        <div class="product-info">
                                                            <a href="storeDetails.jsp?id=<%=recentStores.get(i).getStoreId()%>" target="_blank" class="product-title">
                                                                <%=recentStores.get(i).getStoreName()%>
                                                            </a>
                                                            <span class="product-description">
                                                                <%=recentStores.get(i).getStoreArea()%>, <%=recentStores.get(i).getCity()%>
                                                            </span>
                                                        </div>
                                                    </li>
                                                    <%
                                                        if (i == 3 || i == 7 || i == 11 || i == 15 || i == recentStores.size() - 1) {
                                                    %>
                                                </ul>
                                            </div>
                                            <%}
                                                }%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <section class="col-lg-12 connectedSortable" id="siteCounters">
                                    <%
                                        pst = con.prepareStatement("select * from log_counters where counterid=1");
                                        rs = pst.executeQuery();
                                        if (rs.next()) {
                                    %>
                                    <div class="box box-primary" id="recentlyJoined">
                                        <div class="box-body text-center">
                                            <div class="col-sm-3 col-xs-6 wow fadeInLeft" data-wow-duration="1000ms" data-wow-delay="300ms">
                                                <i class="fa fa-shopping-cart" style="font-size: 40px"></i>
                                                <h3 class="timer"><%=rs.getInt("stores")%></h3>
                                                <p>Stores Registered</p>
                                            </div>
                                            <div class="col-sm-3 col-xs-6 wow fadeInLeft" data-wow-duration="1000ms" data-wow-delay="900ms">
                                                <i class="fa fa-desktop" style="font-size: 40px"></i>                    
                                                <h3><%=rs.getInt("visits")%></h3>
                                                <p>Visits</p>
                                            </div>   
                                            <div class="col-sm-3 col-xs-6 wow fadeInLeft" data-wow-duration="1000ms" data-wow-delay="700ms">
                                                <i class="fa fa-tags" style="font-size: 40px"></i>
                                                <h3 class="timer"><%=rs.getInt("categories")%></h3>                    
                                                <p>Categories</p>
                                            </div> 
                                            <div class="col-sm-3 col-xs-6 wow fadeInLeft" data-wow-duration="1000ms" data-wow-delay="500ms">
                                                <i class="fa fa-users" style="font-size: 40px"></i>
                                                <h3 class="timer"><%=rs.getInt("members")%></h3>                    
                                                <p>Members</p>
                                            </div> 

                                        </div>
                                    </div>
                                    <%}
                                        con.close();
                                    %>
                                </section>
                            </div>
                            </section>
                        </div>
                    </div>      
                    <jsp:include page="footer.jsp"/>
                    <script src="bootstrap/js/bootstrap.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
                    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
                    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
                    <script src="plugins/fastclick/fastclick.js"></script>
                    <script src="js/seachResults.js"></script>
                    <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
                    <script src="dist/js/app.min.js"></script>
                    <script src="dist/js/pages/dashboard.js"></script>
                    <script src="dist/js/demo.js"></script>
                    <script src="js/jquery.newsTicker.min.js"></script> 
                    <jsp:include page="modals.jsp"/>
                    <script src="js/custom.js"></script>
                    <script>
                        $("#autocomplete").on("focus", function(){
                            $('html, body').animate({
                                scrollTop: 0
                            }, 'slow', function () {
                            });
                        });
                        $('input[type="radio"].flat-red').on("change",function(){
                            getSuggestions();
                        });
                    </script>
                    </body>
                    </html>