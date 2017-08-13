<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%
    String query = request.getParameter("search");
    if (query == null || query == "") {
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
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-104138274-1', 'auto');
            ga('send', 'pageview');

        </script>
        <style>
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

            .option-input:checked { background: #40e0d0; border: none; }

            .option-input:checked::before {
                width: 20px;
                height: 20px;
                content: '\2713';
            }
            .option-input.radio { border-radius: 50%; }

            .option-input.radio::after { border-radius: 50%; border: none}
            .radioLabel1
            {
                font-size: 18px;
                float: right;
                clear: none;
            }
            .radioLabel2
            {
                font-size: 18px;
                float: right;
                clear: none;
                display: block;
                padding: 2px 5px 5px 10px;
            }
            #filterWP td
            {
                float: left;
                padding-left: 10px;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed" onload="getSuggestionsAjax('<%=query%>')">
        <div class="wrapper">
            <jsp:include page="header.jsp"/>
            <br>
            <div class="content-wrapper">
                <section class="content"  id="marqueePad" style="padding: 5px">
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
                        <div class="col-md-3 hidden-xs">
                            <div class="box box-primary" id="similarResultsWP">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><i class="fa fa-search"></i> Popular Stores</h3>
                                </div>
                                <div class="box-body">
                                    <ul class="todo-list">
                                        <%
                                            pst = con.prepareStatement("select storename, gurkha from storedetails order by visitcount desc limit 10;");
                                            rs = pst.executeQuery();
                                            while (rs.next()) {
                                        %>
                                        <li>
                                            <a href="storeDetails.jsp?id=<%=rs.getString("gurkha")%>">
                                                <span class="handle">
                                                    <i class="fa fa-map-marker"></i>
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
                            <div class="row hidden-xs hidden-md hidden-sm" id="filterWP">
                                <div class=" box box-primary text-center" style="padding: 0px">
                                    <div class="box-body text-center">
                                        <span class="col-sm-3 label label-info" style="font-size: 15px">Sort By</span>
                                        <span class="col-sm-3">
                                            <input type="radio" class="flat-red option-input radio" value="visitcount" name="filterChk" id="chkPopular" checked>
                                            <span class="radioLabel1"> Popularity</span>
                                        </span>
                                        <span class="col-sm-3">
                                            <input type="radio" class="flat-red option-input radio" value="rating" name="filterChk" id="chkRating">
                                            <span class="radioLabel1"> Shop Rating</span>
                                        </span>
                                        <span class="col-sm-3">
                                            <input type="radio" class="flat-red option-input radio" value="storename" name="filterChk" id="chkReview">
                                            <span class="radioLabel1"> Reviews</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row hidden-lg hidden-md" id="filterWP">
                                <div class="box box-primary" style="padding: 0px">
                                    <div class="box-header">
                                        <i class="fa fa-sort"></i> Sort by
                                    </div>
                                    <div class="box-body">
                                        <table>
                                            <tr>
                                                <td> <input type="radio" class="flat-red option-input radio" value="visitcount" name="filterChk" id="chkPopular" checked="true">
                                                    <span class="radioLabel2"> Popularity</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="radio" class="flat-red option-input radio" value="rating" name="filterChk" id="chkRating">
                                                    <span class="radioLabel2"> Shop Rating</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="radio" class="flat-red option-input radio" value="storename" name="filterChk" id="chkReview">
                                                    <span class="radioLabel2"> Reviews</span>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="box box-primary" id="searchResults">
                                    <div class="box-body" id="showData"  style="min-height: 480px; font-size: 15px">
                                    </div>
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
                                                        pst = con.prepareStatement("select count(category) as total from storedetails where category=? and storestatus='Active'");
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
                                                        pst = con.prepareStatement("select count(category) as total from storedetails where category=? and  storestatus='Active'");
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
                                                        pst = con.prepareStatement("select count(category) as total from storedetails where category=? and  storestatus='Active'");
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
                                                        pst = con.prepareStatement("select count(category) as total from storedetails where category=? and  storestatus='Active'");
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
                                                        pst = con.prepareStatement("select count(category) as total from storedetails where category=? and  storestatus='Active'");
                                                        pst.setString(1, rs.getString("cat5"));
                                                        rs1 = pst.executeQuery();
                                                        if (rs1.next()) {
                                                    %>
                                                    See all <%=rs1.getInt("total")%> Shops
                                                    <%}
                                                        con.close();
                                                    %>
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
        <script src="js/custom.js"></script>
        <script src="https://apis.google.com/js/platform.js"></script>
        <script src="https://apis.google.com/js/platform.js?onload=onLoadGoogleCallback" async defer></script>
        <jsp:include page="modals.jsp"/>
        <script>
            $('input[name=filterChk]').change(function(){
                getSuggestionsAjax(); 
            });
            $("#autocomplete").val("<%=query%>");
            
            $("#autocomplete").on("focus", function(){
                //alert("");
                $('html, body').animate({ scrollTop: 0 }, 'slow', function () {
                });
            });
        </script>
    </body>
</html>
