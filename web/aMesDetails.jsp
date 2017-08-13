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
        String openAt = "", closeAt = "";
        int mesid = Integer.parseInt(request.getParameter("mid"));
        PreparedStatement pst;
        ResultSet rs, rs1;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from mes where mesid=?");
        pst.setInt(1, mesid);
        rs = pst.executeQuery();
        if (rs.next()) {
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=rs.getString("mesname")%></title>
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
                        <%=rs.getString("mesname")%>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i> Manage Services</a></li>
                        <li class="active">Mes Details</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <form role="form" action="aAddMesDetailsCheck.jsp" method="post">
                                    <input type="hidden" name="opType" value="update"/>
                                    <input type="hidden" name="mesid" value="<%=mesid%>"/>
                                    <div class="box-header">
                                        <div style="float: right">
                                            <i class="fa fa-image"></i><a href="aUpdatePhotosDetails.jsp?type=mes&sid=<%=mesid%>">  Update Photos</a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <i class="fa fa-map-marker"></i><a href="aUpdateLocation.jsp?type=mes&id=<%=mesid%>">  Update Location</a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <i class="fa fa-edit"></i><a href="aUpdateMetadata.jsp?type=mes&id=<%=mesid%>">  Update Metadata</a>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Select City</label>
                                                    <select class="form-control" id="txtMesCity" name="txtMesCity" required>
                                                        <%
                                                            pst = con.prepareStatement("select distinct city from mes");
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
                                                    <label>स्टोर नाम</label>
                                                    <input type="text" id="txtMesNameHindi" name="txtMesNameHindi" class="form-control" value="<%=rs.getString("mesnamehindi")%>" placeholder="स्टोर का नाम दर्ज करें" required>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Mes Name</label>
                                                    <input type="text" id="txtMesName" name="txtMesName" class="form-control" value="<%=rs.getString("mesname")%>" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Select Existing Area</label>
                                                    <select class="form-control" id="ddlMesArea" name="ddlMesArea" required>
                                                        <%
                                                            pst = con.prepareStatement("select distinct mesarea from mes");
                                                            rs1 = pst.executeQuery();
                                                            while (rs1.next()) {
                                                                if (rs.getString("mesarea").equals(rs1.getString("mesarea"))) {
                                                        %>
                                                        <option value='<%=rs1.getString("mesarea")%>' selected><%=rs1.getString("mesarea")%></option>
                                                        <%} else {
                                                        %>
                                                        <option value='<%=rs1.getString("mesarea")%>'><%=rs1.getString("mesarea")%></option>
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
                                                    <input type="text" id="txtMesArea" name="txtMesArea" class="form-control" placeholder="Enter New Area" required>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Service Area</label>
                                                    <input type="text" id="txtMesServiceArea" value="<%=rs.getString("servicearea")%>" name="txtMesServiceArea" class="form-control" placeholder="Enter service area" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Mes Services</label>
                                                    <input type="text" id="txtMesServices" value="<%=rs.getString("services")%>" name="txtMesServices" class="form-control" placeholder="Enter mes services in detail" required>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            String amLunch = "", pmLunch = "", amDinner = "", pmDinner = "", timeLunch1, timeLunch2;
                                            String timeDinner1 = "", timeDinner2 = "";
                                            //lunchtime calculations
                                            String temp1 = rs.getString("lunchtime");
                                            String[] strArray1 = temp1.split(Pattern.quote("to"));
                                            String[] strAM1 = strArray1[0].trim().split(Pattern.quote(" "));
                                            String[] strPM1 = strArray1[1].trim().split(Pattern.quote(" "));

                                            timeLunch1 = strAM1[0].trim();
                                            amLunch = strAM1[1].trim();
                                            timeLunch2 = strPM1[0].trim();
                                            pmLunch = strPM1[1].trim();
                                            //dinnertime calculations
                                            String temp2 = rs.getString("dinnertime");
                                            String[] strArray2 = temp2.split(Pattern.quote("to"));
                                            String[] strAM2 = strArray2[0].trim().split(Pattern.quote(" "));
                                            String[] strPM2 = strArray2[1].trim().split(Pattern.quote(" "));

                                            timeDinner1 = strAM2[0].trim();
                                            amDinner = strAM2[1].trim();
                                            timeDinner2 = strPM2[0].trim();
                                            pmDinner = strPM2[1].trim();
                                        %>

                                        <div class="row">
                                            <div class="col-lg-3">
                                                <label>Mes Lunch Time</label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="<%=timeLunch1%>" id="txtMesLunchStart" name="txtMesLunchStart" placeholder="Lunch start time" required>
                                                        <div class="input-group-addon" id="timezone1">
                                                            <label id="lblLunchAM" style="cursor: pointer;"><%=amLunch%></label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtLunchAM" id="txtLunchAM" value="<%=amLunch%>">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <label>&nbsp;</label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="<%=timeLunch2%>" id="txtMesLunchEnd" name="txtMesLunchEnd" placeholder="Lunch end time" required>
                                                        <div class="input-group-addon" id="timezone2">
                                                            <label id="lblLunchPM" style="cursor: pointer;"><%=pmLunch%></label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtLunchPM" id="txtLunchPM" value="<%=pmLunch%>">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <label>Mes Dinner Time</label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="<%=timeDinner1%>" id="txtMesDinnerStart" name="txtMesDinnerStart" placeholder="Dinner start time" required>
                                                        <div class="input-group-addon" id="timezone3">
                                                            <label id="lblDinnerAM" style="cursor: pointer;"><%=amDinner%></label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtDinnerAM" id="txtDinnerAM" value="<%=amDinner%>">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <label>&nbsp;</label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="<%=timeDinner2%>" id="txtMesDinnerEnd" name="txtMesDinnerEnd" placeholder="Dinner end time" required>
                                                        <div class="input-group-addon" id="timezone4">
                                                            <label id="lblDinnerPM" style="cursor: pointer;"><%=pmDinner%></label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtDinnerPM" id="txtDinnerPM" value="<%=pmDinner%>">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-lg-3">
                                                <label>Home Delivery</label>
                                                <select class="form-control" id="ddlMesHomeDelivery" name="ddlMesHomeDelivery" required>
                                                    <option value="<%=rs.getString("homedelivery")%>" selected><%=rs.getString("homedelivery")%></option>
                                                    <option value="Yes">Yes</option>
                                                    <option value="No">No</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-3" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Mes closed On</label>
                                                    <select class="form-control" id="ddlMesClosedOn" name="ddlMesClosedOn" required>
                                                        <option value="<%=rs.getString("closedon")%>" selected><%=rs.getString("closedon")%></option>
                                                        <option value="Sunday">Sunday</option>
                                                        <option value="Monday">Monday</option>
                                                        <option value="Tuesday">Tuesday</option>
                                                        <option value="Wednesday">Wednesday</option>
                                                        <option value="Thursday">Thursday</option>
                                                        <option value="Friday">Friday</option>
                                                        <option value="Saturday">Saturday</option>
                                                        <option value="Never">Never</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Contact Number 1</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="<%=rs.getString("contact")%>" id="txtMesContact" name="txtMesContact" placeholder="Enter contact number 1" required>
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Contact Number 2</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="<%=rs.getString("phone")%>" id="txtMesContact2" name="txtMesPhone" placeholder="Enter contact number 2">
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
                                                        <input type="text" class="form-control" value="<%=rs.getString("websiteurl")%>" id="txtMesURL" name="txtMesURL" placeholder="Enter website URL">
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
                                                        <input type="email" class="form-control" value="<%=rs.getString("email")%>" id="txtMesEmail" name="txtMesEmail" placeholder="Enter email address">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-envelope"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Subscription Type</label>
                                                    <select class="form-control" id="ddlMesSubs" name="ddlMesSubs" required>
                                                        <option value='<%=rs.getString("subtype")%>' selected><%=rs.getString("subtype")%></option>
                                                        <option value="Initial - Free for 3 Months">Initial - Free for 3 Months</option>
                                                        <option value="3 Months">3 Months</option>
                                                        <option value="6 Months">6 Months</option>
                                                        <option value="12 Months">1 Year</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="<%=rs.getString("pass")%>" id="txtMesPass" name="txtMesPass" placeholder="Enter password">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-envelope"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <label>Full Address</label>
                                                <div class="form-group date">
                                                    <textarea class="form-control" id="txtMesFullAddress" name="txtMesFullAddress" rows="2" cols="100" placeholder="Enter full mes address" required><%=rs.getString("address")%></textarea>
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
                    $('#lblLunchAM').text($('#lblLunchAM').text() == 'PM' ? 'AM' : 'PM');
                    $('#txtLunchAM').val($('#lblLunchAM').text());
                });
                $('#timezone2').click(function(){
                    $('#lblLunchPM').text($('#lblLunchPM').text() == 'PM' ? 'AM' : 'PM');
                    $('#txtLunchPM').val($('#lblLunchPM').text());
                });
                $('#timezone3').click(function(){
                    $('#lblDinnerAM').text($('#lblDinnerAM').text() == 'PM' ? 'AM' : 'PM');
                    $('#txtDinnerAM').val($('#lblDinnerAM').text());
                });
                $('#timezone4').click(function(){
                    $('#lblDinnerPM').text($('#lblDinnerPM').text() == 'PM' ? 'AM' : 'PM');
                    $('#txtDinnerPM').val($('#lblDinnerPM').text());
                });
                     
                $("#btnUpdate").hide();
                $("#txtMesCity").attr("disabled", "disabled");
                $("#txtMesName").attr("disabled", "disabled");
                $("#txtMesNameHindi").attr("disabled", "disabled");
                $("#ddlMesArea").attr("disabled", "disabled");
                $("#ddlMesCat").attr("disabled", "disabled");
                $("#txtMesServices").attr("disabled", "disabled");
                $("#txtMesServiceArea").attr("disabled", "disabled");
                $("#txtMesOpenAt").attr("disabled", "disabled");
                $("#txtMesCloseAt").attr("disabled", "disabled");
                $("#ddlMesClosedOn").attr("disabled", "disabled");
                $("#txtMesContact").attr("disabled", "disabled");
                $("#txtMesContact2").attr("disabled", "disabled");
                $("#txtMesURL").attr("disabled", "disabled");
                $("#txtMesEmail").attr("disabled", "disabled");
                $("#ddlMesSubs").attr("disabled", "disabled");
                $("#txtMesFullAddress").attr("disabled", "disabled");
                $("#ddlMesHomeDelivery").attr("disabled", "disabled");
                $("#txtMesLunchStart").attr("disabled", "disabled");
                $("#txtMesLunchEnd").attr("disabled", "disabled");
                $("#txtMesDinnerStart").attr("disabled", "disabled");
                $("#txtMesDinnerEnd").attr("disabled", "disabled");
                $("#txtMesArea").attr("disabled", "disabled");
                $("#txtMesPass").attr("disabled", "disabled");

                $("#btnEdit").click(function(){
                    $("#btnUpdate").show();
                    $("#btnEdit").hide();
                    $("#txtMesCity").removeAttr("disabled");
                    $("#txtMesName").removeAttr("disabled");
                    $("#txtMesNameHindi").removeAttr("disabled");
                    $("#ddlMesArea").removeAttr("disabled");
                    $("#ddlMesCat").removeAttr("disabled");
                    $("#txtMesServices").removeAttr("disabled");
                    $("#txtMesServiceArea").removeAttr("disabled");
                    $("#txtMesOpenAt").removeAttr("disabled");
                    $("#txtMesCloseAt").removeAttr("disabled");
                    $("#ddlMesClosedOn").removeAttr("disabled");
                    $("#txtMesContact").removeAttr("disabled");
                    $("#txtMesURL").removeAttr("disabled");
                    $("#txtMesEmail").removeAttr("disabled");
                    $("#ddlMesSubs").removeAttr("disabled");
                    $("#txtMesFullAddress").removeAttr("disabled");
                    $("#txtMesFullAddress").removeAttr("disabled");
                    $("#ddlMesHomeDelivery").removeAttr("disabled");
                    $("#txtMesLunchStart").removeAttr("disabled");
                    $("#txtMesLunchEnd").removeAttr("disabled");
                    $("#txtMesDinnerStart").removeAttr("disabled");
                    $("#txtMesDinnerEnd").removeAttr("disabled");
                    $("#txtMesContact2").removeAttr("disabled");
                    $("#txtMesPass").removeAttr("disabled");
                });
                $("#btnReset").click(function(){
                    $("#btnUpdate").hide();
                    $("#btnEdit").show();
                    $("#txtMesCity").attr("disabled", "disabled");
                    $("#txtMesName").attr("disabled", "disabled");
                    $("#txtMesNameHindi").attr("disabled", "disabled");
                    $("#ddlMesArea").attr("disabled", "disabled");
                    $("#ddlMesCat").attr("disabled", "disabled");
                    $("#txtMesServices").attr("disabled", "disabled");
                    $("#txtMesServiceArea").attr("disabled", "disabled");
                    $("#txtMesOpenAt").attr("disabled", "disabled");
                    $("#txtMesCloseAt").attr("disabled", "disabled");
                    $("#ddlMesClosedOn").attr("disabled", "disabled");
                    $("#txtMesContact").attr("disabled", "disabled");
                    $("#txtMesContact2").attr("disabled", "disabled");
                    $("#txtMesURL").attr("disabled", "disabled");
                    $("#txtMesEmail").attr("disabled", "disabled");
                    $("#ddlMesSubs").attr("disabled", "disabled");
                    $("#txtMesFullAddress").attr("disabled", "disabled");
                    $("#ddlMesHomeDelivery").attr("disabled", "disabled");
                    $("#txtMesLunchStart").attr("disabled", "disabled");
                    $("#txtMesLunchEnd").attr("disabled", "disabled");
                    $("#txtMesDinnerStart").attr("disabled", "disabled");
                    $("#txtMesDinnerEnd").attr("disabled", "disabled");
                    $("#txtMesArea").attr("disabled", "disabled");
                    $("#txtMesPass").attr("disabled", "disabled");
                });
                $("#ddlMesArea").change(function() {
                    var opt = $(this).find('option:selected').val();
                    if(opt=="Other")
                    {
                        $("#txtMesArea").removeAttr("disabled");
                    }
                    else
                    {
                        $("#txtMesArea").attr("disabled", "disabled");
                    }
                });

            </script>   
        </div>
    </body>
</html>