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
        int storeId = Integer.parseInt(String.valueOf(session.getAttribute("sStoreid")));
        PreparedStatement pst;
        ResultSet rs, rs1;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from storedetails where storeid=?");
        pst.setInt(1, storeId);
        rs = pst.executeQuery();
        if (rs.next()) {
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=rs.getString("storename")%></title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
        <style>
            @media (max-width: 750px) {
                #tooltipMap
                {
                    margin-top: 10px!important;
                }
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
                        <%=rs.getString("storename")%>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Shop Details</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="box box-primary">
                                <form role="form" action="sUpdateStoreDetailsCheck.jsp" method="post">
                                    <input type="hidden" name="opType" value="update"/>
                                    <input type="hidden" name="storeid" value="<%=storeId%>"/>
                                    <hr>
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-lg-10">
                                                <div class="form-group">
                                                    <label>City</label>
                                                    <select class="form-control" id="txtOfferCity" name="txtOfferCity" required>
                                                        <option value='<%=rs.getString("city")%>' selected><%=rs.getString("city")%></option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10">
                                                <div class="form-group">
                                                    <label>Shop Name</label>
                                                    <input type="text" id="txtOfferStoreName" name="txtOfferStoreName" class="form-control" value="<%=rs.getString("storename")%>" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Shop Area</label>
                                                    <input type="text" name="txtOfferStoreArea" class="form-control" placeholder="Enter Store Area" value="<%=rs.getString("storearea")%>" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10">
                                                <div class="form-group">
                                                    <label>Shop Category</label>
                                                    <%
                                                        String cat = rs.getString("category");
                                                        if (cat.equalsIgnoreCase("store")) {
                                                            cat = "Not Available";
                                                        }
                                                    %>
                                                    <input type="text" name="txtOfferStoreCat" class="form-control" value="<%=cat%>" placeholder="Enter Shop Category. e.g. General Store" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10">
                                                <div class="form-group">
                                                    <label>Shop Services</label>
                                                    <input type="text" name="txtOfferServices" class="form-control" value="<%=rs.getString("services")%>" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10" id="otherDiv">
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
                                            <div class="col-lg-5">
                                                <div class="form-group">
                                                    <label>Shop Opens at</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtOfferOpenAt" name="txtOfferOpenAt" value="<%=openAt%>" required>
                                                        <div class="input-group-addon" id="timezone1">
                                                            <label id="lblAM" style="cursor: pointer;"><%=am%></label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtAM" id="txtAM" value="<%=am%>">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
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
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Shop closed On</label>
                                                    <select class="form-control" id="ddlOfferClosedOn" name="ddlOfferClosedOn" required>
                                                        <option value='<%=rs.getString("closedon")%>' selected><%=rs.getString("closedon")%></option>
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
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10">
                                                <div class="form-group">
                                                    <label>Mobile Number</label>
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
                                            <div class="col-lg-10">
                                                <div class="form-group">
                                                    <label>Landline Number</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtOfferPhone" name="txtOfferPhone" value="<%=rs.getString("phone")%>" required>
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10">
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
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10">
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
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Subscription Type</label>
                                                    <select class="form-control" id="ddlOfferSubs" name="ddlOfferSubs" required>
                                                        <option value='<%=rs.getString("subtype")%>' selected><%=rs.getString("subtype")%></option>
                                                        <option value="IMSPM3">For 90 + 15 Days @Rs. 1.41/Day - IMSPM3</option>
                                                        <option value="IMSPM6">For 180 + 30 Days @Rs. 1.18/Day - IMSPM6</option>
                                                        <option value="IMSPY1">For 365 + 45 Days @Rs.0.85/Day - IMSPY1</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Full Address</label>
                                                    <div class="form-group date">
                                                        <textarea class="form-control" id="txtOfferFullAddress" name="txtOfferFullAddress" rows="2" cols="100" required><%=rs.getString("fulladdress")%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
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
                
                $("#ddlOfferSubs").attr("disabled","disabled");
            </script>   
        </div>
        <%
            con.close();
        %>
    </body>
</html>