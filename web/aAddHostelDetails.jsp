<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Add Hostel</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
    </head>
    <%
        PreparedStatement pst;
        Connection con;
        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
    %>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="aHeader.jsp"/>
            <jsp:include page="aSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Add Hostel
                        <small>( Step 2 of 3 )</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i> Manage Hostels</a></li>
                        <li class="active">Add New Hostel</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <form role="form" action="aAddHostelDetailsCheck.jsp" method="post">
                                    <input type="hidden" name="opType" value="add"/>
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Select City</label>
                                                    <select class="form-control" id="txtHostCity" name="txtHostCity" required>
                                                        <option value="Amravati">Amravati</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>होस्टल नाम</label>
                                                    <input type="text" id="txtHostNameHindi" name="txtHostNameHindi" class="form-control" placeholder="होस्टल का नाम दर्ज करें" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Hostel Name</label>
                                                    <input type="text" id="txtHostName" name="txtHostName" class="form-control" placeholder="Enter hostel name" required>
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
                                                            rs = pst.executeQuery();
                                                            while (rs.next()) {
                                                        %>
                                                        <option value="<%=rs.getString("hostarea")%>"><%=rs.getString("hostarea")%></option>
                                                        <%}%>      
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
                                                    <input type="number" id="txtHostAreaSqft" name="txtHostAreaSqft" class="form-control" placeholder="Enter hostel area in square feet" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Bedrooms</label>
                                                    <input type="number" id="txtHostBedrooms" name="txtHostBedrooms" class="form-control" placeholder="Enter New Category" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Beds</label>
                                                    <input type="number" id="txtHostBeds" name="txtHostBeds" class="form-control" placeholder="Enter New Category" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>For</label>
                                                    <select class="form-control" id="ddlHostFor" name="ddlHostFor" required>
                                                        <option value="Family">Family</option>
                                                        <option value="Bachelors">Bachelors</option>
                                                        <option value="Any">Any</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Furnished</label>
                                                    <select class="form-control" id="ddlHostFurnished" name="ddlHostFurnished" required>
                                                        <option value="No">No</option>
                                                        <option value="Semi">Semi</option>
                                                        <option value="Fully">Fully</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Rent</label>
                                                    <input type="number" class="form-control" id="txtHostRent" name="txtHostRent" placeholder="Enter rent in rupees" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Deposit</label>
                                                    <input type="number" class="form-control" id="txtHostDeposit" name="txtHostDeposit" placeholder="Enter deposit in rupees" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Possession</label>
                                                    <select class="form-control" id="ddlHostPossession" name="ddlHostPossession" required>
                                                        <option value="Immediately">Immediately</option>
                                                        <option value="After 10 days">After 10 days</option>
                                                        <option value="Next Month">Next Month</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Contact Number 1</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtHostContact" name="txtHostContact" placeholder="Enter contact number 1" required>
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
                                                        <input type="text" class="form-control" id="txtHostContact2" name="txtHostPhone" placeholder="Enter contact number 2">
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
                                                        <input type="text" class="form-control" id="txtHostURL" name="txtHostURL" placeholder="Enter website URL of hostel">
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
                                                        <input type="email" class="form-control" id="txtHostEmail" name="txtHostEmail" placeholder="Enter email address" required>
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
                                                        <option value=""> - - Select Subscription Type - -</option>
                                                        <option value="MSPM3">For 90 Days @1.66 Rs/Day - MSPM3</option>
                                                        <option value="MSPM6">For 180 Days @1.38 Rs/Day - MSPM6</option>
                                                        <option value="MSPY1">For 365 Days @0.95 Rs/Day - MSPY1</option>
                                                        <option value="carousal">Included in carousal</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Description</label>
                                                    <div class="form-group date">
                                                        <textarea class="form-control" id="txtHostDesc" name="txtHostDesc" rows="2" cols="100" placeholder="Enter full hostel description" required></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Metadata</label>
                                                    <div class="form-group">
                                                        <textarea class="form-control" id="txtHostMetadata" name="txtHostMetadata" rows="2" cols="100" placeholder="Enter metadata for search" required></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Full Address</label>
                                                    <div class="form-group date">
                                                        <textarea class="form-control" id="txtHostFullAddress" name="txtHostFullAddress" rows="2" cols="100" placeholder="Enter full hostel address" required></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                        <button type="submit" class="btn btn-primary">Next</button>
                                        <input type="reset" value="Reset" class="btn btn-primary">
                                    </div>
                                </form> 
                            </div>
                        </div>
                    </div> 
                </section>
            </div>
            <jsp:include page="aSideMenuRight.jsp"/>
            <jsp:include page="aFooterFiles.jsp"/>
            <script>
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
        <%
                con.close();
            } catch (Exception ex) {
            }
        %>
    </body>
</html>
