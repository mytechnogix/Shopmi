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
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="css/carousalOffers.css">
        <link rel="stylesheet" href="css/index.css">
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script>
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
        <style>
            #login-after-div, #login-before-div
            {
                display: none;
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
                    <div class="row">
                        <div class="col-md-2">
                            <div class="box box-primary" id="similarResultsWP">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Similar Searches</h3>
                                </div>
                                <div class="box-body">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="box box-primary" id="searchResults">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Showing <span id="showCount">0</span>
                                        shop(s) related to <span id="resFor" style="color: green; font-weight: bold"><%=query%></span>
                                    </h3>
                                </div>
                                <div class="box-body">
                                    <ul class="products-list product-list-in-box">
                                        <div id="showData" class="item"></div>
                                    </ul>
                                </div>
                                <div class="box-footer text-center">
                                    <a href="javascript:void(0)" class="uppercase">Load More Shops</a>
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
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/pages/dashboard.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="js/jquery.newsTicker.min.js"></script> 
        <script src="js/aes.js"></script>
        <script src="js/crypto-js.js"></script>
        <script src="js/custom.js"></script>
        <jsp:include page="modals.jsp"/>
        <script>
            $(document).on('click','.product-info', function() {
                $parent_box = $(this).closest('.boxr');
                $parent_box.siblings().find('.bottom').slideUp();
                $parent_box.find('.bottom').slideToggle(1000, 'swing');
            });
            $("#crossDiv").show();
            $("#query").val("<%=query%>");
            $('#crossDiv').click(function(){
                $("#query").val("");
                $("#crossDiv").hide();
                $("#resFor").text("");
                $("#showData").text("");
                $("#showCount").text("0");
            });

            $("#query").keyup(function(){
                $("#crossDiv").show();
                query = $("#query").val().trim();
                $("#resFor").text(query);
                if(query.length>0 && query!=null && query!=" "){
                    getSuggestions(query);
                }
                else
                {
                    $("#crossDiv").hide();
                    $("#resFor").text("");
                    $("#showData").text("");
                    $("#showCount").text("0");
                }
            });
        </script>
    </body>
</html>
