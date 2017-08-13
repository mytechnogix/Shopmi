<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <%
        int hallid = Integer.parseInt(request.getParameter("hid"));
        PreparedStatement pst;
        ResultSet rs, rs1;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from halls where hallid=?");
        pst.setInt(1, hallid);
        rs = pst.executeQuery();
        if (rs.next()) {
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=rs.getString("hallname")%></title>
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
                        <%=rs.getString("hallname")%>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i> Manage Services</a></li>
                        <li class="active">Hall Details</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-12">
                            <div class="box box-primary">

                                <form role="form" action="aAddHallDetailsCheck.jsp" method="post">
                                    <input type="hidden" name="opType" value="update"/>
                                    <input type="hidden" name="hallid" value="<%=hallid%>"/>
                                    <div class="box-header">
                                        <div style="float: right">
                                            <i class="fa fa-image"></i><a href="aUpdatePhotosDetails.jsp?type=hall&sid=<%=hallid%>">  Update Photos</a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <i class="fa fa-map-marker"></i><a href="aUpdateLocation.jsp?type=hall&id=<%=hallid%>">  Update Location</a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <i class="fa fa-edit"></i><a href="aUpdateMetadata.jsp?type=hall&id=<%=hallid%>">  Update Metadata</a>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Select City</label>
                                                    <select class="form-control" id="txtHallCity" name="txtHallCity" required>
                                                        <%
                                                            pst = con.prepareStatement("select distinct city from halls");
                                                            rs1 = pst.executeQuery();
                                                            while (rs1.next()) {
                                                                if (rs.getString("city").equals(rs1.getString("city"))) {
                                                        %>
                                                        <option value='<%=rs1.getString("city")%>' selected><%=rs1.getString("city")%></option>
                                                        <%} else {
                                                        %>
                                                        <option value='<%=rs1.getString("city")%>'><%=rs1.getString("city")%></option>
                                                        <%}
                                                            }%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>हॉल नाम</label>
                                                    <input type="text" id="txtHallNameHindi" name="txtHallNameHindi" class="form-control" value="<%=rs.getString("hallnamehindi")%>" placeholder="हॉल का नाम दर्ज करें" required>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Hall Name</label>
                                                    <input type="text" id="txtHallName" name="txtHallName" class="form-control" value="<%=rs.getString("hallname")%>" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Select Existing Area</label>
                                                    <select class="form-control" id="ddlHallArea" name="ddlHallArea" required>
                                                        <%
                                                            pst = con.prepareStatement("select distinct hall_area from halls");
                                                            rs1 = pst.executeQuery();
                                                            while (rs1.next()) {
                                                                if (rs.getString("hall_area").equals(rs1.getString("hall_area"))) {
                                                        %>
                                                        <option value='<%=rs1.getString("hall_area")%>' selected><%=rs1.getString("hall_area")%></option>
                                                        <%} else {
                                                        %>
                                                        <option value='<%=rs1.getString("hall_area")%>'><%=rs1.getString("hall_area")%></option>
                                                        <%}
                                                            }
                                                        %>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Add New Area</label>
                                                    <input type="text" id="txtHallArea" name="txtHallArea" class="form-control" placeholder="Enter New Area" required>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Hall Services</label>
                                                    <input type="text" id="txtHallServices" name="txtHallServices" class="form-control" value="<%=rs.getString("services")%>" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-3" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Hall Area in Square Feet</label>
                                                    <input type="text" id="txtHallAreaSqft" name="txtHallAreaSqft" class="form-control" value="<%=rs.getString("areasqft")%>" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Website URL</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtHallURL" name="txtHallURL" value="<%=rs.getString("websiteurl")%>">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-link"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Email Address</label>
                                                    <div class="input-group">
                                                        <input type="email" class="form-control" id="txtHallEmail" name="txtHallEmail" value="<%=rs.getString("email")%>" required >
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-envelope"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Contact Number 1</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtHallContact" name="txtHallContact" value="<%=rs.getString("contact")%>" required>
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Contact Number 2</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtHallContact2" name="txtHallPhone" value="<%=rs.getString("phone")%>">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Subscription Type</label>
                                                    <select class="form-control" id="ddlHallSubs" name="ddlHallSubs" required>
                                                        <option value='<%=rs.getString("substype")%>' selected><%=rs.getString("substype")%></option>
                                                        <option value="MSPM3">For 90 Days @1.66 Rs/Day - MSPM3</option>
                                                        <option value="MSPM6">For 180 Days @1.38 Rs/Day - MSPM6</option>
                                                        <option value="MSPY1">For 365 Days @0.95 Rs/Day - MSPY1</option>
                                                        <option value="carousal">Included in carousal</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtHallPass" name="txtHallPass" value="<%=rs.getString("pass")%>">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Full Address</label>
                                                    <div class="form-group date">
                                                        <textarea class="form-control" id="txtHallFullAddress" name="txtHallFullAddress" rows="2" cols="100" required><%=rs.getString("fulladdress")%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                        <div id="btnEdit" class="btn btn-primary">Edit</div>
                                        <button type="submit" id="btnUpdate" class="btn btn-primary">Update</button>
                                        <input type="reset" id="btnReset" value="Reset" class="btn btn-primary">
                                    </div>
                                </form> 
                                <%}%>
                            </div>
                        </div>
                    </div> 
                </section>
            </div>
            <jsp:include page="aSideMenuRight.jsp"/>
            <jsp:include page="aFooterFiles.jsp"/>
            <%
                con.close();
            %>
            <script>
                $('#bothdates').daterangepicker();
                $('#timezone1').click(function(){
                    $('#lblAM').text($('#lblAM').text() == 'PM' ? 'AM' : 'PM');
                    $('#txtAM').val($('#lblAM').text());
                });
                $('#timezone2').click(function(){
                    $('#lblPM').text($('#lblPM').text() == 'PM' ? 'AM' : 'PM');
                    $('#txtPM').val($('#lblPM').text());
                });
                $("#btnUpdate").hide();
                $("#txtHallCity").attr("disabled", "disabled");
                $("#txtHallName").attr("disabled", "disabled");
                $("#txtHallNameHindi").attr("disabled", "disabled");
                $("#ddlHallArea").attr("disabled", "disabled");
                $("#ddlHallCat").attr("disabled", "disabled");
                $("#txtHallServices").attr("disabled", "disabled");
                $("#txtHallAreaSqft").attr("disabled", "disabled");
                $("#txtHallOpenAt").attr("disabled", "disabled");
                $("#txtHallCloseAt").attr("disabled", "disabled");
                $("#ddlHallClosedOn").attr("disabled", "disabled");
                $("#txtHallContact").attr("disabled", "disabled");
                $("#txtHallContact2").attr("disabled", "disabled");
                $("#txtHallURL").attr("disabled", "disabled");
                $("#txtHallEmail").attr("disabled", "disabled");
                $("#ddlHallSubs").attr("disabled", "disabled");
                $("#txtHallFullAddress").attr("disabled", "disabled");
                $("#txtHallArea").attr("disabled", "disabled");
                $("#txtHallPass").attr("disabled", "disabled");
                
                $("#btnEdit").click(function(){
                    $("#btnUpdate").show();
                    $("#btnEdit").hide();
                    $("#txtHallCity").removeAttr("disabled");
                    $("#txtHallName").removeAttr("disabled");
                    $("#txtHallNameHindi").removeAttr("disabled");
                    $("#ddlHallArea").removeAttr("disabled");
                    $("#ddlHallCat").removeAttr("disabled");
                    $("#txtHallServices").removeAttr("disabled");
                    $("#txtHallAreaSqft").removeAttr("disabled");
                    $("#txtHallOpenAt").removeAttr("disabled");
                    $("#txtHallCloseAt").removeAttr("disabled");
                    $("#ddlHallClosedOn").removeAttr("disabled");
                    $("#txtHallContact").removeAttr("disabled");
                    $("#txtHallContact2").removeAttr("disabled");
                    $("#txtHallURL").removeAttr("disabled");
                    $("#txtHallEmail").removeAttr("disabled");
                    $("#ddlHallSubs").removeAttr("disabled");
                    $("#txtHallFullAddress").removeAttr("disabled");
                    $("#txtHallPass").removeAttr("disabled");
                });
                $("#btnReset").click(function(){
                    $("#btnUpdate").hide();
                    $("#btnEdit").show();
                    $("#txtHallCity").attr("disabled", "disabled");
                    $("#txtHallName").attr("disabled", "disabled");
                    $("#txtHallNameHindi").attr("disabled", "disabled");
                    $("#ddlHallArea").attr("disabled", "disabled");
                    $("#ddlHallCat").attr("disabled", "disabled");
                    $("#txtHallServices").attr("disabled", "disabled");
                    $("#txtHallAreaSqft").attr("disabled", "disabled");
                    $("#txtHallOpenAt").attr("disabled", "disabled");
                    $("#txtHallCloseAt").attr("disabled", "disabled");
                    $("#ddlHallClosedOn").attr("disabled", "disabled");
                    $("#txtHallContact").attr("disabled", "disabled");
                    $("#txtHallContact2").attr("disabled", "disabled");
                    $("#txtHallURL").attr("disabled", "disabled");
                    $("#txtHallEmail").attr("disabled", "disabled");
                    $("#ddlHallSubs").attr("disabled", "disabled");
                    $("#txtHallFullAddress").attr("disabled", "disabled");
                    $("#txtHallPass").attr("disabled", "disabled");
                });
                
                $("#ddlHallArea").change(function() {
                    var opt = $(this).find('option:selected').val();
                    if(opt=="Other")
                    {
                        $("#txtHallArea").removeAttr("disabled");
                    }
                    else
                    {
                        $("#txtHallArea").attr("disabled", "disabled");
                    }
                });
            </script>   
        </div>
    </body>
</html>