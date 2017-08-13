<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Manage Advertise</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
        <style>
            .tblOffer tr td
            {
                padding: 10px;
                font-size: 16px;
            }
            .tblOffer tr td:first-child
            {
                font-weight: bold;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="sHeader.jsp"/>
            <jsp:include page="sSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Manage Advertise
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active"> Manage Advertise</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Advertise Details</h3>
                                    <a href="sAddAdvertise.jsp" id="claim" class="btn-sm btn-primary pull-right">
                                        <i class="fa fa-plus"></i>  Add Advertise</a>
                                </div>
                                <div class="box-body">
                                    <%
                                        String storeid = String.valueOf(session.getAttribute("sStoreid"));
                                        int cnt = 0;
                                        String subtype = "";
                                        String img = "", aid = "", advStatus = "";
                                        PreparedStatement pst;
                                        ResultSet rs;
                                        Connection con;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        DBConnector dbc = new DBConnector();
                                        con = DriverManager.getConnection(dbc.getConstr());
                                        pst = con.prepareStatement("select * from advertise where storeid=? and advstatus='Active' or storeid=? and advstatus='Pending'");
                                        pst.setString(1, storeid);
                                        pst.setString(2, storeid);
                                        rs = pst.executeQuery();
                                        if (rs.next()) {
                                            subtype = rs.getString("subtype");
                                            aid = rs.getString("aid");
                                            img = rs.getString("advimg");
                                            advStatus = rs.getString("advstatus");
                                            cnt++;
                                    %>
                                    <table class="tblOffer">
                                        <tr><td>Advertise Title</td><td><%=rs.getString("advtitle")%></td></tr>
                                        <tr><td>Advertise Description</td><td><%=rs.getString("advdesc")%></td></tr>
                                        <tr><td>Terms and Conditions</td><td><%=rs.getString("advtc")%></td></tr>
                                        <tr><td>Advertise Duration</td><td><%=rs.getString("sDate")%> to <%=rs.getString("eDate")%></td></tr>
                                        <tr><td>Advertise added on</td><td><%=rs.getString("timedate")%></td></tr>
                                        <tr><td>Advertise status</td><td><%=rs.getString("advstatus")%></td></tr>
                                        <tr><td>Advertise subscription type</td><td><%=rs.getString("subtype")%></td></tr>
                                    </table>
                                    <%} else {%>
                                    No advertise added
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <%
                            if (cnt > 0) {
                                if (img.equals("default.jpg")) {
                                    img = "shopIcon_lg.png";
                                }
                        %>
                        <div class="col-md-6">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Advertise Image</h3>
                                    <%
                                        if (subtype.equals("MSADW1") || subtype.equals("MSADW2")) {
                                    %>
                                    <small class="pull-right"><a id="picPath" href="sAddAdvPhoto.jsp">Change Image</a></small>
                                    <%}%>
                                </div>
                                <div class="box-body" style="overflow: hidden">
                                    <img src="images/advphotos/<%=img%>" style="width: 500px; height: 270px">
                                </div>   
                                <div class="box-footer clearfix no-border">
                                    <%if (!advStatus.equals("Active")) {%>
                                    <span style="color: green; font-weight: bold"> Note : Team MyShejari.com will connect you soon</span>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <%}
                            con.close();
                        %>
                    </div>
                </section>
            </div>
            <jsp:include page="aFooterFiles.jsp"/>
        </div>
        <script>
            var claim = <%=cnt%>;
            if(claim=="1")
            {
                $("#claim").hide();
            }
        </script>
    </body>
</html>
