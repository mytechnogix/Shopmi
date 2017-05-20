<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <%
        String openAt = "", closeAt = "";
        int storeId = Integer.parseInt(request.getParameter("id"));
        PreparedStatement pst;
        ResultSet rs, rs1;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Add Store</title>
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
                        Add Store
                        <small>( Step 2 of 3 )</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i> Manage Store</a></li>
                        <li class="active">Add New Store</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <%
                                    pst = con.prepareStatement("select * from storedetails where storeid=?");
                                    pst.setInt(1, storeId);
                                    rs = pst.executeQuery();
                                    if (rs.next()) {
                                %>
                                <form role="form" action="aAddStoreDetailsCheck.jsp" method="post">
                                    <input type="hidden" name="opType" value="update"/>
                                    <input type="hidden" name="storeid" value="<%=storeId%>"/>

                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Select City</label>
                                                    <select class="form-control" id="txtOfferCity" name="txtOfferCity" required>
                                                        <%
                                                            pst = con.prepareStatement("select distinct city from storedetails");
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
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Store Name</label>
                                                    <input type="text" id="txtOfferStoreName" name="txtOfferStoreName" class="form-control" value="<%=rs.getString("storename")%>" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Select Existing Area</label>
                                                    <select class="form-control" id="ddlOfferStoreArea" name="ddlOfferStoreArea" required>
                                                        <%
                                                            pst = con.prepareStatement("select distinct storearea from storedetails");
                                                            rs1 = pst.executeQuery();
                                                            while (rs1.next()) {
                                                                if (rs.getString("storearea").equals(rs1.getString("storearea"))) {
                                                        %>
                                                        <option value='<%=rs1.getString("storearea")%>' selected><%=rs1.getString("storearea")%></option>
                                                        <%} else {
                                                        %>
                                                        <option value='<%=rs1.getString("storearea")%>'><%=rs1.getString("storearea")%></option>
                                                        <%}
                                                            }%>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Add New Area</label>
                                                    <input type="text" id="txtOfferStoreArea" name="txtOfferStoreArea" class="form-control" placeholder="Enter New Area" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Select Existing Category</label>
                                                    <select class="form-control" id="ddlOfferStoreCat" name="ddlOfferStoreCat" required>
                                                        <%
                                                            pst = con.prepareStatement("select distinct category from storedetails");
                                                            rs1 = pst.executeQuery();
                                                            while (rs1.next()) {
                                                                if (rs.getString("category").equals(rs1.getString("category"))) {
                                                        %>
                                                        <option value='<%=rs1.getString("category")%>' selected><%=rs1.getString("category")%></option>
                                                        <%} else {
                                                        %>
                                                        <option value='<%=rs1.getString("category")%>'><%=rs1.getString("category")%></option>
                                                        <%}
                                                            }%>  <option value="Other">Other</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Add New Category</label>
                                                    <input type="text" id="txtOfferStoreCat" name="txtOfferStoreCat" class="form-control" placeholder="Enter New Category" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Store Services</label>
                                                    <input type="text" id="txtOfferServices" name="txtOfferServices" class="form-control" value="<%=rs.getString("services")%>" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Service Area</label>
                                                    <input type="text" id="txtOfferServiceArea" name="txtOfferServiceArea" class="form-control" value="<%=rs.getString("servicearea")%>" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <%
                                                String am = "", pm = "";
                                                String temp = rs.getString("workinghours");
                                                String[] strArray = temp.split(Pattern.quote("to"));
                                                String[] strAM = strArray[0].trim().split(Pattern.quote(" "));
                                                String[] strPM = strArray[1].trim().split(Pattern.quote(" "));

                                                openAt = strAM[0].trim();
                                                am = strAM[1].trim();
                                                closeAt = strPM[0].trim();
                                                pm = strPM[1].trim();
                                            %>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Store Opens at</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtOfferOpenAt" name="txtOfferOpenAt" value="<%=openAt%>" required>
                                                        <div class="input-group-addon" id="timezone1">
                                                            <label id="lblAM" style="cursor: pointer;"><%=am%></label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtAM" id="txtAM" value="<%=am%>">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Store closes at</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtOfferCloseAt" name="txtOfferCloseAt" value="<%=closeAt%>" required>
                                                        <div class="input-group-addon" id="timezone2">
                                                            <label id="lblPM" style="cursor: pointer;"><%=pm%></label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtPM" id="txtPM" value="<%=pm%>">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Store closed On</label>
                                                    <select class="form-control" id="ddlOfferClosedOn" name="ddlOfferClosedOn" required>
                                                        <option value='<%=rs.getString("closedon")%>' selected><%=rs.getString("closedon")%></option>
                                                        <option value="Sunday">Sunday</option>
                                                        <option value="Monday">Monday</option>
                                                        <option value="Tuesday">Tuesday</option>
                                                        <option value="Wednesday">Wednesday</option>
                                                        <option value="Thursday">Thursday</option>
                                                        <option value="Friday">Friday</option>
                                                        <option value="Saturday">Saturday</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Contact Number</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtOfferContact" name="txtOfferContact" value="<%=rs.getString("contact")%>" required>
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Website URL</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtOfferURL" name="txtOfferURL" value="<%=rs.getString("websiteurl")%>">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-link"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Email Address</label>
                                                    <div class="input-group">
                                                        <input type="email" class="form-control" id="txtOfferEmail" name="txtOfferEmail" value="<%=rs.getString("email")%>" >
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-envelope"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Subscription Type</label>
                                                    <select class="form-control" id="ddlOfferSubs" name="ddlOfferSubs" required>
                                                        <option value='<%=rs.getString("subtype")%>' selected><%=rs.getString("subtype")%></option>
                                                        <option value="Initial - Free for 3 Months">Initial - Free for 3 Months</option>
                                                        <option value="3 Months"> 3 Months</option>
                                                        <option value="6 Months"> 6 Months</option>
                                                        <option value="1 Year"> 1 Year</option>
                                                        <option value="Lifetime"> Lifetime</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <label>Full Address</label>
                                        <div class="form-group date">
                                            <textarea class="form-control" id="txtOfferFullAddress" name="txtOfferFullAddress" rows="2" cols="100" required><%=rs.getString("fulladdress")%></textarea>
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
                $("#txtOfferCity").attr("disabled", "disabled");
                $("#txtOfferStoreName").attr("disabled", "disabled");
                $("#ddlOfferStoreArea").attr("disabled", "disabled");
                $("#ddlOfferStoreCat").attr("disabled", "disabled");
                $("#txtOfferServices").attr("disabled", "disabled");
                $("#txtOfferServiceArea").attr("disabled", "disabled");
                $("#txtOfferOpenAt").attr("disabled", "disabled");
                $("#txtOfferCloseAt").attr("disabled", "disabled");
                $("#ddlOfferClosedOn").attr("disabled", "disabled");
                $("#txtOfferContact").attr("disabled", "disabled");
                $("#txtOfferURL").attr("disabled", "disabled");
                $("#txtOfferEmail").attr("disabled", "disabled");
                $("#ddlOfferSubs").attr("disabled", "disabled");
                $("#txtOfferFullAddress").attr("disabled", "disabled");

                $("#btnEdit").click(function(){
                    $("#btnUpdate").show();
                    $("#btnEdit").hide();
                    $("#txtOfferCity").removeAttr("disabled");
                    $("#txtOfferStoreName").removeAttr("disabled");
                    $("#ddlOfferStoreArea").removeAttr("disabled");
                    $("#ddlOfferStoreCat").removeAttr("disabled");
                    $("#txtOfferServices").removeAttr("disabled");
                    $("#txtOfferServiceArea").removeAttr("disabled");
                    $("#txtOfferOpenAt").removeAttr("disabled");
                    $("#txtOfferCloseAt").removeAttr("disabled");
                    $("#ddlOfferClosedOn").removeAttr("disabled");
                    $("#txtOfferContact").removeAttr("disabled");
                    $("#txtOfferURL").removeAttr("disabled");
                    $("#txtOfferEmail").removeAttr("disabled");
                    $("#ddlOfferSubs").removeAttr("disabled");
                    $("#txtOfferFullAddress").removeAttr("disabled");
                });
                $("#btnReset").click(function(){
                    $("#btnUpdate").hide();
                    $("#btnEdit").show();
                    $("#txtOfferCity").attr("disabled", "disabled");
                    $("#txtOfferStoreName").attr("disabled", "disabled");
                    $("#ddlOfferStoreArea").attr("disabled", "disabled");
                    $("#ddlOfferStoreCat").attr("disabled", "disabled");
                    $("#txtOfferServices").attr("disabled", "disabled");
                    $("#txtOfferServiceArea").attr("disabled", "disabled");
                    $("#txtOfferOpenAt").attr("disabled", "disabled");
                    $("#txtOfferCloseAt").attr("disabled", "disabled");
                    $("#ddlOfferClosedOn").attr("disabled", "disabled");
                    $("#txtOfferContact").attr("disabled", "disabled");
                    $("#txtOfferURL").attr("disabled", "disabled");
                    $("#txtOfferEmail").attr("disabled", "disabled");
                    $("#ddlOfferSubs").attr("disabled", "disabled");
                    $("#txtOfferFullAddress").attr("disabled", "disabled");
                });
            </script>   
        </div>
    </body>
</html>