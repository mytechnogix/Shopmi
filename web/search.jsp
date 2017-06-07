<%@page import="java.util.ArrayList"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%
    String query = request.getParameter("search");
    if (query == null) {
        response.sendRedirect("index.jsp");
    }
    PreparedStatement pst;
    Connection con;
    ResultSet rs, rs1;
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Search Shops</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"/>
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css"/>
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css"/>
        <link rel="stylesheet" href="css/carousalOffers.css"/>
        <link rel="stylesheet" href="css/index.css"/>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <style>
            @media (max-width:767px) {
                .fixed .content-wrapper,.fixed .right-side {
                    padding-top: 50px;
                }
            }
            #login-after-div, #login-before-div
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
                font-size: 20px;
                top: -3px;
                position: relative
            }
            @-webkit-keyframes 
            click-wave { 0% {
                         width: 40px;
                         height: 40px;
                         opacity: 0.35;
                         position: relative;
            }
            100% {
                width: 200px;
                height: 200px;
                margin-left: -80px;
                margin-top: -80px;
                opacity: 0.0;
            }
            }

            @-moz-keyframes 
            click-wave { 0% {
                         width: 40px;
                         height: 40px;
                         opacity: 0.35;
                         position: relative;
            }
            100% {
                width: 200px;
                height: 200px;
                margin-left: -80px;
                margin-top: -80px;
                opacity: 0.0;
            }
            }

            @-o-keyframes 
            click-wave { 0% {
                         width: 40px;
                         height: 40px;
                         opacity: 0.35;
                         position: relative;
            }
            100% {
                width: 200px;
                height: 200px;
                margin-left: -80px;
                margin-top: -80px;
                opacity: 0.0;
            }
            }

            @keyframes 
            click-wave { 0% {
                         width: 40px;
                         height: 40px;
                         opacity: 0.35;
                         position: relative;
            }
            100% {
                width: 200px;
                height: 200px;
                margin-left: -80px;
                margin-top: -80px;
                opacity: 0.0;
            }
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed" onload="getSuggestions('<%=query%>')">
        <div class="wrapper">
            <jsp:include page="header.jsp"/>
            <div class="content-wrapper">
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
                                <a href="search.jsp?search=<%=rs.getString("category")%>" style="margin-left: 3px" class="label <%=lbl[lCnt]%>"> <%=rs.getString("category")%> </a>
                                <%
                                        lCnt++;
                                    }%>
                            </marquee>
                        </div>
                    </div>
                    <br>
                    <div class="row" id="filterWP">
                        <div class="col-lg-12 box text-center" style="padding: 0px">
                            <div class="box-body text-center">
                                <span class="col-lg-3 label label-info" style="font-size: 16px">Filter By</span>
                                <span class="col-lg-3">
                                    <input type="radio" class="flat-red option-input radio" value="visitcount" name="filterChk" id="chkPopular" checked>
                                    <span class="radioLabel1"> Popularity</span>
                                </span>
                                <span class="col-lg-3">
                                    <input type="radio" class="flat-red option-input radio" value="rating" name="filterChk" id="chkRating">
                                    <span class="radioLabel1"> Shop Rating</span>
                                </span>
                                <span class="col-lg-3">
                                    <input type="radio" class="flat-red option-input radio" value="storename" name="filterChk" id="chkReview">
                                    <span class="radioLabel1"> Reviews</span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="box box-primary" id="similarResultsWP">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><i class="fa fa-search"></i> Popular Stores</h3>
                                </div>
                                <div class="box-body">
                                    <ul class="todo-list">
                                        <%
                                            pst = con.prepareStatement("select storename, count(*) as frequency from log_popular group by category order by count(*) desc limit 10;");
                                            rs = pst.executeQuery();
                                            while (rs.next()) {
                                        %>
                                        <li>
                                            <a href="search.jsp?search=<%=rs.getString("storename")%>">
                                                <span class="handle">
                                                    <i class="fa fa-tag"></i>
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
                        </div>
                        <div class="col-lg-6">
                            <div class="box box-primary" id="searchResults">
                                <div class="box-body" id="showData"  style="min-height: 480px;">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
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
                                                <img src="images/catsPopularIcon.png" alt="Category Icon">
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
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/pages/dashboard.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="js/jquery.newsTicker.min.js"></script> 
        <script src="js/aes.js"></script>
        <script src="js/crypto-js.js"></script>
        <script src="js/custom.js"></script>
        <jsp:include page="modals.jsp"/>
        <script>

            $("#crossDiv").show();
            $("#searchQuery").val("<%=query%>");
            $('#crossDiv').click(function(){
                $("#searchQuery").val("");
                $("#crossDiv").hide();
                $("#resFor").text("");
                $("#showData").text("Search results will be shown here");
                $("#showCount").text("0");
            });

            $("#searchQuery").keyup(function(){
                $("#crossDiv").show();
                query = $("#searchQuery").val().trim();
                $("#resFor").text(query);
                if(query.length>0 && query!=null && query!=" "){
                    getSuggestions();
                }
                else
                {
                    $("#crossDiv").hide();
                    $("#resFor").text("");
                    $("#showData").text("Search results will be shown here");
                    $("#showCount").text("0");
                }
            });
        </script>
    </body>
</html>
