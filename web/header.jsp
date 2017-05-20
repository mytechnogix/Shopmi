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
<%
    int cnt = 0, total = 0;
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
%>
<header class="main-header">
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
                            <input type="search" class="form-control" id="query" placeholder="Search by Store Name or Category" style="width: 500px">
                            <div class="input-group-addon" id="crossDiv" style="cursor: pointer; display: none">
                                <span id="searchclear" class="glyphicon glyphicon-remove-circle"></span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <%
                String fnm = String.valueOf(session.getAttribute("fnm"));
                String uid = String.valueOf(session.getAttribute("uid"));

            %>
            <div class="navbar-custom-menu pull-right">
                <ul class="nav navbar-nav">
                    <%
                        pst = con.prepareStatement("select count(*) as total from view_claimedoffers_notify where uid=? and couponstatus='Unused' or uid=? and couponstatus='Expired'");
                        pst.setString(1, uid);
                        pst.setString(2, uid);
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
                        <!--                        <a href="#" class="dropdown-toggle" data-toggle="modal" data-target="#myModal">
                                                    Login
                                                </a>-->
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
</header>
