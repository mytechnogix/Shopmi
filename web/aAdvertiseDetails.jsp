<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <%
        int storeId = Integer.parseInt(request.getParameter("sid"));
        int aid = Integer.parseInt(request.getParameter("aid"));
        String img = "";
        PreparedStatement pst;
        ResultSet rs, rs1;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from view_advertise where storeid=? and aid=?");
        pst.setInt(1, storeId);
        pst.setInt(2, aid);
        rs = pst.executeQuery();
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Advertise Details</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="aHeader.jsp"/>
            <jsp:include page="aSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Advertise Details
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-dashboard"></i> Manage Advertises</a></li>
                        <li class="active">Advertise Details</li>
                    </ol>
                </section>
                <%
                    if (rs.next()) {
                        img = rs.getString("advimg");
                        if (img.equals("default.jpg")) {
                            img = "shopIcon_lg.png";
                        }
                %>
                <section class="content">
                    <div class="row imgUpload" >
                        <div class="col-md-6">
                            <div class="box box-primary">
                                <form role="form" action="aAddAdvertiseCheck.jsp" method="post">
                                    <input type="hidden" name="type" value="update">
                                    <input type="hidden" name="aid" value="<%=aid%>">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Select Store</label>
                                            <select class="form-control" name="advStoreId" id="advStoreId" required>
                                                <%
                                                    pst = con.prepareStatement("select storename from storedetails where storestatus='Active'");
                                                    rs1 = pst.executeQuery();
                                                    while (rs1.next()) {
                                                        if ((rs.getString("storename")).equals(rs1.getString("storename"))) {
                                                %>
                                                <option value='<%=rs1.getString("storename")%>' selected><%=rs1.getString("storename")%></option>
                                                <%} else {
                                                %>
                                                <option value='<%=rs1.getString("storename")%>'><%=rs1.getString("storename")%></option>
                                                <%}
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <label>Advertise Duration</label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="text" id="bothdates" name="bothdates" class="form-control" value="<%=rs.getString("sDate")%> - <%=rs.getString("eDate")%>" required>
                                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                                            </div>
                                        </div>
                                        <label>Advertise Title</label>
                                        <div class="form-group date">
                                            <input type="text" class="form-control" name="advTitle" id="advTitle" value="<%=rs.getString("advtitle")%>" required>
                                        </div>
                                        <label>Advertise Description</label>
                                        <div class="form-group date">
                                            <input type="text" class="form-control" name="advDesc" id="advDesc" value="<%=rs.getString("advdesc")%>" required>
                                        </div>
                                        <label>Terms and Conditions</label>
                                        <div class="form-group date">
                                            <textarea class="form-control" id="advTC" name="advTC" rows="4" cols="100" required><%=rs.getString("advtc")%></textarea>
                                        </div>
                                        <label>Subscription Type</label>
                                        <div class="form-group date">
                                            <select class="form-control" name="advSubtype" id="advSubtype" required>
                                                <option value='<%=rs.getString("subtype")%>' selected><%=rs.getString("subtype")%></option>
                                                <option value="MSADM6">For 6 Months - 5 Rs/Day (MSADM6)</option>
                                                <option value="MSADM3">For 3 Months - 7 Rs/Day (MSADM3)</option>
                                                <option value="MSADM1">For 1 Month - 10 Rs/Day (MSADM1)</option>
                                                <option value="MSADW2">For 2 Weeks - 12 Rs/Day (MSADW2 - Ad banner creation not included)</option>
                                                <option value="MSADW1">For 1 Week - 14 Rs/Day (MSADW1 - Ad banner creation not included)</option>
                                            </select>
                                        </div>
                                        <label>Note: 
                                            <%
                                                if (rs.getString("subtype").equals("MSADW1") || rs.getString("subtype").equals("MSADW2")) {
                                            %>
                                            <span style="color: red">Ad Banner Creation Not Included</span>
                                            <%} else {%>
                                            <span style="color: green; font-weight: bold">Ad Banner Creation Included</span>
                                            <%}%>
                                        </label>
                                    </div>
                                    <div class="box-footer">
                                        <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                        <div id="btnEdit" class="btn btn-primary">Edit</div>
                                        <button type="submit" id="btnUpdate" class="btn btn-primary">Update</button>
                                        <input type="reset" id="btnReset" value="Reset" class="btn btn-primary">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-6    ">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Image Preview</h3>
                                    <small class="pull-right"><a href="aAddAdvPhoto.jsp?aid=<%=aid%>">Change Photo</a></small>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-4 setImage">
                                            <img src="images/advphotos/<%=img%>" style="width: 500px; height: 270px"/>
                                        </div>
                                    </div>
                                </div>   
                            </div>
                        </div>
                    </div> 
                </section>
                <%}%>
            </div>
            <jsp:include page="aSideMenuRight.jsp"/>
            <jsp:include page="aFooterFiles.jsp"/>
            <script>
                // $('#bothdates').daterangepicker();
                
                $("#btnUpdate").hide();
                $("#bothdates").attr("disabled","disabled");
                $("#advStoreId").attr("disabled","disabled");
                $("#advTitle").attr("disabled","disabled");
                $("#advDesc").attr("disabled","disabled");
                $("#advTC").attr("disabled","disabled");
                $("#advSubtype").attr("disabled","disabled");
                
                $("#btnEdit").click(function(){
                    $("#btnUpdate").show();
                    $("#btnEdit").hide();
                    $("#bothdates").removeAttr("disabled");
                    $("#advStoreId").removeAttr("disabled");
                    $("#advTitle").removeAttr("disabled");
                    $("#advDesc").removeAttr("disabled");
                    $("#advTC").removeAttr("disabled");
                    $("#advSubtype").removeAttr("disabled");
                    $('#bothdates').daterangepicker();
                });
                $("#btnReset").click(function(){
                    $("#btnUpdate").hide();
                    $("#btnEdit").show();
                    $("#bothdates").attr("disabled","disabled");
                    $("#advStoreId").attr("disabled","disabled");
                    $("#advTitle").attr("disabled","disabled");
                    $("#advDesc").attr("disabled","disabled");
                    $("#advTC").attr("disabled","disabled");
                    $("#advSubtype").attr("disabled","disabled");
                });
            </script>
        </div>
        <%  con.close();%>
    </body>
</html>
