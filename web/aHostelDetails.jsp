<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <%
        int hostid = Integer.parseInt(request.getParameter("hostid"));
        PreparedStatement pst;
        ResultSet rs, rs1;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from hostel where hostid=?");
        pst.setInt(1, hostid);
        rs = pst.executeQuery();
        if (rs.next()) {
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=rs.getString("hostname")%></title>
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
                        <%=rs.getString("hostname")%><br>
                        <small><a href="aHostelAmenities.jsp?id=<%=hostid%>">Update Amenities</a></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i> Manage Services</a></li>
                        <li class="active">Manage Hostels</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <form role="form" action="aAddHostelDetailsCheck.jsp" method="post">
                                    <input type="hidden" name="opType" value="update"/>
                                    <input type="hidden" name="hostid" value="<%=hostid%>"/>
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Select City</label>
                                                    <select class="form-control" id="txtHostCity" name="txtHostCity" required>
                                                        <option value="Amravati">Amravati</option>
                                                        <%
                                                            pst = con.prepareStatement("select distinct city from hostel");
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
                                                    <label>होस्टल नाम</label>
                                                    <input type="text" id="txtHostNameHindi" value="<%=rs.getString("hostnamehindi")%>" name="txtHostNameHindi" class="form-control" placeholder="होस्टल का नाम दर्ज करें" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Hostel Name</label>
                                                    <input type="text" id="txtHostName" value="<%=rs.getString("hostname")%>" name="txtHostName" class="form-control" placeholder="Enter hostel name" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Select Existing Area</label>
                                                    <select class="form-control" id="ddlHostArea" name="ddlHostArea" required>
                                                        <%
                                                            pst = con.prepareStatement("select distinct hostarea from hostel");
                                                            rs1 = pst.executeQuery();
                                                            while (rs1.next()) {
                                                                if (rs.getString("hostarea").equals(rs1.getString("hostarea"))) {
                                                        %>
                                                        <option value='<%=rs1.getString("hostarea")%>' selected><%=rs1.getString("hostarea")%></option>
                                                        <%} else {
                                                        %>
                                                        <option value='<%=rs1.getString("hostarea")%>'><%=rs1.getString("hostarea")%></option>
                                                        <%}
                                                            }
                                                            con.close();
                                                        %>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-4" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Add New Area</label>
                                                    <input type="text" id="txtHostArea" name="txtHostArea" class="form-control" placeholder="Enter New Area" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Hostel Area (in Sq.Ft)</label>
                                                    <input type="text" id="txtHostAreaSqft" value="<%=rs.getString("hostareasqft")%>" name="txtHostAreaSqft" class="form-control" placeholder="Enter hostel area in square feet" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Bedrooms</label>
                                                    <input type="text" id="txtHostBedrooms" value="<%=rs.getString("bedrooms")%>" name="txtHostBedrooms" class="form-control" placeholder="Enter New Category" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Beds</label>
                                                    <input type="text" id="txtHostBeds"  value="<%=rs.getString("beds")%>" name="txtHostBeds" class="form-control" placeholder="Enter New Category" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>For</label>
                                                    <select class="form-control" id="ddlHostFor" name="ddlHostFor" required>
                                                        <option value='<%=rs.getString("forwhom")%>'><%=rs.getString("forwhom")%></option>
                                                        <option value="Family">Family</option>
                                                        <option value="Bachelors">Bachelors</option>
                                                        <option value="Any">Any</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Furnished</label>
                                                    <select class="form-control" id="ddlHostFurnished" name="ddlHostFurnished" required>
                                                        <option value='<%=rs.getString("furnished")%>'><%=rs.getString("furnished")%></option>
                                                        <option value="No">No</option>
                                                        <option value="Semi">Semi</option>
                                                        <option value="Fully">Fully</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Rent</label>
                                                    <input type="text" class="form-control" value="<%=rs.getString("rent")%>" id="txtHostRent" name="txtHostRent" placeholder="Enter rent in rupees" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Deposit</label>
                                                    <input type="text" class="form-control"  value="<%=rs.getString("deposit")%>"id="txtHostDeposit" name="txtHostDeposit" placeholder="Enter deposit in rupees" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Possession</label>
                                                    <select class="form-control" id="ddlHostPossession" name="ddlHostPossession" required>
                                                        <option value='<%=rs.getString("possession")%>'><%=rs.getString("possession")%></option>
                                                        <option value="Immediately">Immediately</option>
                                                        <option value="After 10 days">After 10 days</option>
                                                        <option value="Next Month">Next Month</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Contact Number</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="<%=rs.getString("contact")%>" id="txtHostContact" name="txtHostContact" placeholder="Enter 10 digit contact number" required>
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Website URL</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="<%=rs.getString("websiteurl")%>" id="txtHostURL" name="txtHostURL" placeholder="Enter website URL of hostel">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-link"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Email Address</label>
                                                    <div class="input-group">
                                                        <input type="email" class="form-control" value="<%=rs.getString("email")%>" id="txtHostEmail" name="txtHostEmail" placeholder="Enter email address">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-envelope"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Subscription Type</label>
                                                    <select class="form-control" id="ddlHostSubs" name="ddlHostSubs" required>
                                                        <option value="Initial - Free for 3 Months">Initial - Free for 3 Months</option>
                                                        <option value="3">3 Months</option>
                                                        <option value="6">6 Months</option>
                                                        <option value="12">1 Year</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Description</label>
                                                    <div class="form-group date">
                                                        <textarea class="form-control" id="txtHostDesc" name="txtHostDesc" rows="2" cols="100" placeholder="Enter full hostel description" required><%=rs.getString("description")%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Full Address</label>
                                                    <div class="form-group date">
                                                        <textarea class="form-control" id="txtHostFullAddress" name="txtHostFullAddress" rows="2" cols="100" placeholder="Enter full hostel address" required><%=rs.getString("address")%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <div id="btnEdit" class="btn btn-primary">Edit</div>
                                        <button type="submit" id="btnUpdate" class="btn btn-primary">Update</button>
                                        <input type="reset" id="btnReset" value="Reset" class="btn btn-primary">
                                        <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
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
            <script>
                $("#btnUpdate").hide();
                $("#txtHostCity").attr("disabled", "disabled");
                $("#txtHostName").attr("disabled", "disabled");
                $("#txtHostNameHindi").attr("disabled", "disabled");
                $("#ddlHostArea").attr("disabled", "disabled");
                $("#txtHostContact").attr("disabled", "disabled");
                $("#txtHostURL").attr("disabled", "disabled");
                $("#txtHostEmail").attr("disabled", "disabled");
                $("#ddlHostSubs").attr("disabled", "disabled");
                $("#txtHostFullAddress").attr("disabled", "disabled");
                $("#txtHostArea").attr("disabled", "disabled");
                $("#txtHostAreaSqft").attr("disabled", "disabled");
                $("#txtHostBedrooms").attr("disabled", "disabled");
                $("#txtHostBeds").attr("disabled", "disabled");
                $("#ddlHostFor").attr("disabled", "disabled");
                $("#txtHostRent").attr("disabled", "disabled");
                $("#txtHostDeposit").attr("disabled", "disabled");
                $("#txtHostDesc").attr("disabled", "disabled");
                $("#ddlHostPossession").attr("disabled", "disabled");
                $("#ddlHostFurnished").attr("disabled", "disabled");

                $("#btnEdit").click(function(){
                    $("#btnUpdate").show();
                    $("#btnEdit").hide();
                    $("#txtHostCity").removeAttr("disabled");
                    $("#txtHostName").removeAttr("disabled");
                    $("#txtHostNameHindi").removeAttr("disabled");
                    $("#ddlHostArea").removeAttr("disabled");
                    $("#txtHostContact").removeAttr("disabled");
                    $("#txtHostURL").removeAttr("disabled");
                    $("#txtHostEmail").removeAttr("disabled");
                    $("#ddlHostSubs").removeAttr("disabled");
                    $("#txtHostFullAddress").removeAttr("disabled");
                    $("#txtHostAreaSqft").removeAttr("disabled");
                    $("#txtHostBedrooms").removeAttr("disabled");
                    $("#txtHostBeds").removeAttr("disabled");
                    $("#ddlHostFor").removeAttr("disabled");
                    $("#txtHostRent").removeAttr("disabled");
                    $("#txtHostDeposit").removeAttr("disabled");
                    $("#txtHostDesc").removeAttr("disabled");
                    $("#ddlHostPossession").removeAttr("disabled");
                    $("#ddlHostFurnished").removeAttr("disabled");
                });
                $("#btnReset").click(function(){
                    $("#btnUpdate").hide();
                    $("#btnEdit").show();
                    $("#txtHostCity").attr("disabled", "disabled");
                    $("#txtHostName").attr("disabled", "disabled");
                    $("#txtHostNameHindi").attr("disabled", "disabled");
                    $("#ddlHostArea").attr("disabled", "disabled");
                    $("#txtHostContact").attr("disabled", "disabled");
                    $("#txtHostURL").attr("disabled", "disabled");
                    $("#txtHostEmail").attr("disabled", "disabled");
                    $("#ddlHostSubs").attr("disabled", "disabled");
                    $("#txtHostFullAddress").attr("disabled", "disabled");
                    $("#txtHostArea").attr("disabled", "disabled");
                    $("#txtHostAreaSqft").attr("disabled", "disabled");
                    $("#txtHostBedrooms").attr("disabled", "disabled");
                    $("#txtHostBeds").attr("disabled", "disabled");
                    $("#ddlHostFor").attr("disabled", "disabled");
                    $("#txtHostRent").attr("disabled", "disabled");
                    $("#txtHostDeposit").attr("disabled", "disabled");
                    $("#txtHostDesc").attr("disabled", "disabled");
                    $("#ddlHostPossession").attr("disabled", "disabled");
                    $("#ddlHostFurnished").attr("disabled", "disabled");
                });
                
                
                $("#txtHostArea").attr("disabled", "disabled");
                $("#ddlHostArea").change(function() {
                    var opt = $(this).find('option:selected').val();
                    if(opt=="Other")
                    {
                        $("#txtHostArea").removeAttr("disabled");
                    }
                    else
                    {
                        $("#txtHostArea").attr("disabled", "disabled");
                    }
                });
            </script>
        </div>
    </body>
</html>
