<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageOfferBO"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%
    ArrayList<ManageOfferBO> myclass = new ArrayList<ManageOfferBO>();
    ManageDAO objDAO = new ManageDAO();
    myclass = objDAO.getAllOfferDetails();
    int cnt = 0, total = 0;
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
    pst = con.prepareStatement("update log_counters set visits=visits+1 where counterid=1");
    pst.executeUpdate();

%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Welcome to Shejari.com</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="css/carousalOffers.css">
        <link rel="stylesheet" href="css/index.css">
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <style>
            #login-after-div, #login-before-div
            {
                display: none;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed">
        <div class="wrapper">
            <jsp:include page="header.jsp"/>

            <div class="content-wrapper">
                <!-- Main content -->
                <section class="content">
                    <div class="row" style="background-color: lightgray">
                        <div class="col-sm-2 text-center">
                            <span style="background-color: black; color: white; padding: 5px">All Categories
                            </span>
                        </div>
                        <div class="col-md-10">
                            <marquee width="100%"  onMouseOver="this.stop()" onMouseOut="this.start()">
                                <%  int lCnt = 0;
                                    String[] lbl = {"label-info", "label-danger", "label-primary", "label-warning", "label-success"};
                                    pst = con.prepareStatement("select distinct category from storedetails");
                                    rs = pst.executeQuery();
                                    while (rs.next()) {

                                        if (lCnt == 4) {
                                            lCnt = 0;
                                        }
                                %>
                                <a href="#" target="_blank" style="margin-left: 3px" class="label <%=lbl[lCnt]%>"> <%=rs.getString("category")%> </a>
                                <%
                                        lCnt++;
                                    }%>
                            </marquee>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-8">
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
                                                <img src="images/advphotos/<%=rs.getString("advimg")%>" alt="" width="100%" style="height: 400px">
                                            </div>
                                            <%} else {%>
                                            <div class="item">
                                                <img src="images/advphotos/<%=rs.getString("advimg")%>" alt="" width="100%" style="height: 400px">
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

                            <div class="box box-primary" id="searchResults">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Search Results</h3>
                                    <div class="box-tools pull-right">
                                        <span class="label label-danger"><span id="showCount">0</span> Results Found</span>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <ul class="products-list product-list-in-box">
                                        <div id="showData" class="item"></div>
                                    </ul>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer text-center">
                                    <a href="javascript:void(0)" class="uppercase">View All Results</a>
                                </div>
                                <!-- /.box-footer -->
                            </div>
                        </div>
                        <!-- /.col -->

                        <div class="col-md-4">
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
                                                <img src="images/catsPopularIcon.png" alt="Category Icon">
                                            </div>
                                            <div class="product-info">
                                                <a href="#" class="product-title"><%=rs.getString("cat1")%>
                                                    <span class="label label-warning pull-right">***</span></a>
                                                <span class="product-description">
                                                    See all Shops
                                                </span>
                                            </div>
                                        </li>
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="images/catsPopularIcon.png" alt="Category Icon">
                                            </div>
                                            <div class="product-info">
                                                <a href="#" class="product-title"><%=rs.getString("cat2")%>
                                                    <span class="label label-warning pull-right">***</span></a>
                                                <span class="product-description">
                                                    See all Shops
                                                </span>
                                            </div>
                                        </li>
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="images/catsPopularIcon.png" alt="Category Icon">
                                            </div>
                                            <div class="product-info">
                                                <a href="#" class="product-title"><%=rs.getString("cat3")%>
                                                    <span class="label label-warning pull-right">***</span></a>
                                                <span class="product-description">
                                                    See all Shops
                                                </span>
                                            </div>
                                        </li>
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="images/catsPopularIcon.png" alt="Category Icon">
                                            </div>
                                            <div class="product-info">
                                                <a href="#" class="product-title"><%=rs.getString("cat4")%>
                                                    <span class="label label-warning pull-right">***</span></a>
                                                <span class="product-description">
                                                    See all Shops
                                                </span>
                                            </div>
                                        </li>
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="images/catsPopularIcon.png" alt="Category Icon">
                                            </div>
                                            <div class="product-info">
                                                <a href="#" class="product-title"><%=rs.getString("cat5")%>
                                                    <span class="label label-warning pull-right">***</span></a>
                                                <span class="product-description">
                                                    See all Shops
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
                                        <i class="fa fa-shopping-cart"></i> Offers for you!
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
                                                for (i = 0; i < myclass.size(); i++) {

                                                    if (i == 0) {
                                            %>
                                            <div class="item active">
                                                <div class="row">
                                                    <%                                                        }
                                                        if (i == 4) {
                                                    %>
                                                    <div class="item">
                                                        <div class="row">
                                                            <%                                                        }
                                                            %>
                                                            <div class="col-sm-3">
                                                                <a href="JavaScript:generateLink('<%=myclass.get(i).getOid()%>')">
                                                                    <div class="col-item" style="background-color:lightgoldenrodyellow;">
                                                                        <div class="photo">
                                                                            <img src="images/offerphotos/<%=myclass.get(i).getOfferPhoto()%>" class="img-responsive" alt="<%=myclass.get(i).getStoreName()%>" />
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
                                                                if (i == 3) {
                                                            %>
                                                        </div>
                                                    </div>
                                                    <%                                                }
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <section class="col-lg-12 connectedSortable" id="siteCounters">
                            <%
                                pst = con.prepareStatement("select * from log_counters where counterid=1");
                                rs = pst.executeQuery();
                                if(rs.next()){
                            %>
                            <div class="box" id="recentlyJoined">
                                <div class="box-body text-center">
                                    <div class="col-sm-3 col-xs-6 wow fadeInLeft" data-wow-duration="1000ms" data-wow-delay="300ms">
                                        <i class="fa fa-shopping-cart" style="font-size: 40px"></i>
                                        <h3 class="timer"><%=rs.getInt("stores")%></h3>
                                        <p>Stores Registered</p>
                                    </div>
                                    <div class="col-sm-3 col-xs-6 wow fadeInLeft" data-wow-duration="1000ms" data-wow-delay="500ms">
                                        <i class="fa fa-users" style="font-size: 40px"></i>
                                        <h3 class="timer"><%=rs.getInt("members")%></h3>                    
                                        <p>Members</p>
                                    </div> 
                                    <div class="col-sm-3 col-xs-6 wow fadeInLeft" data-wow-duration="1000ms" data-wow-delay="700ms">
                                        <i class="fa fa-tags" style="font-size: 40px"></i>
                                        <h3 class="timer"><%=rs.getInt("categories")%></h3>                    
                                        <p>Categories</p>
                                    </div> 
                                    <div class="col-sm-3 col-xs-6 wow fadeInLeft" data-wow-duration="1000ms" data-wow-delay="900ms">
                                        <i class="fa fa-desktop" style="font-size: 40px"></i>                    
                                        <h3><%=rs.getInt("visits")%></h3>
                                        <p>Visits</p>
                                    </div>   
                                </div>
                            </div
                            <%}%>
                        </section>
                    </div>
                </section>
            </div>
        </div>      
        <jsp:include page="footer.jsp"/>
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
        <script src="js/aes.js"></script>
        <script src="js/crypto-js.js"></script>
        <script src="js/custom.js"></script>
        <jsp:include page="modals.jsp"/>
        <script>
            $('#crossDiv').click(function(){
                $("#searchResults").hide();
                $("#sliderSection").show();
                $("#offerWP").show();
                $("#siteCounters").show();
                $("#query").val("");
                $("#crossDiv").hide();
            });
            $("#crossDiv").hide();
            $("#searchResults").hide();

            $("#query").keyup(function(){
                query = $("#query").val().trim();
                if(query.length>0 && query!=null && query!=" "){
                    $("#crossDiv").show();
                    $("#sliderSection").hide();
                    $("#offerWP").hide();
                    $("#siteCounters").hide();
                    $("#searchResults").show();
                    getSuggestions(query);
                }
                else
                {
                    $("#searchResults").hide();
                    $("#sliderSection").show();
                    $("#offerWP").show();
                    $("#siteCounters").show();
                    $("#crossDiv").hide();
                }
            });
            $(document).on('click','.product-info', function() {
                $parent_box = $(this).closest('.boxr');
                $parent_box.siblings().find('.bottom').slideUp();
                $parent_box.find('.bottom').slideToggle(1000, 'swing');
            });
            //ajax -get suggestions
            var xmlHttp
            var xmlHttp
            function getSuggestions(str){
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
                var url="getSuggestAjax.jsp";
                url +="?query=" +str;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            function stateChange(){
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
                    var someString = xmlHttp.responseText;
                    var count = 0;
                    var pos = someString.indexOf("<li");
                    while(pos > -1){
                        ++count;
                        pos = someString.indexOf("<li", ++pos);
                    }
                    //  alert(count);
                    document.getElementById("showCount").innerHTML=count;
                    document.getElementById("showData").innerHTML=xmlHttp.responseText
                }
            }
        </script>
        <%
            session.setAttribute("RANDKEY", objDAO.generateSecret());
        %>
        <script>
            function generateLink(str)
            {
                var salt = CryptoJS.lib.WordArray.random(128/8);
                var iv = CryptoJS.lib.WordArray.random(128/8);          
                var key128Bits100Iterations = CryptoJS.PBKDF2( '<%=session.getAttribute("RANDKEY")%>', salt, { keySize: 128/32, iterations: 100 });
                var encrypted = CryptoJS.AES.encrypt(str, key128Bits100Iterations, { iv: iv, mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7  });
                var path="offerDetails.jsp?p="+encrypted+"&s="+salt+"&i="+iv;
                //window.location.href = path;
                window.open(path, "_blank");
            }
        </script>
    </body>
</html>
