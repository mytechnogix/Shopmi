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
        <title>Add Advertise</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="sHeader.jsp"/>
            <jsp:include page="sSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Add Advertise
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-dashboard"></i> Manage Advertises</a></li>
                        <li class="active">Add Advertise</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row imgUpload" >
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <form role="form" action="aAddAdvertiseCheck.jsp" method="post">
                                    <input type="hidden" name="type" value="sAdd">
                                    <div class="box-body">
                                        <%String storeid = String.valueOf(session.getAttribute("sStoreid"));%>
                                        <input type="hidden" value="<%=storeid%>" name="advStoreId">
                                        <label>Advertise Duration</label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="text" id="bothdates" name="bothdates" class="form-control" placeholder="Select Start and End Date" required>
                                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                                            </div>
                                        </div>
                                        <label>Advertise Title</label>
                                        <div class="form-group date">
                                            <input type="text" class="form-control" name="advTitle" id="avdTitle" placeholder="eg. Rainy Season Super Sale" required>
                                        </div>
                                        <label>Advertise Description</label>
                                        <div class="form-group date">
                                            <input type="text" class="form-control" name="advDesc" id="advDesc" placeholder="eg. Flat 50% off on ProductName" required>
                                        </div>
                                        <label>Terms and Conditions</label>
                                        <div class="form-group date">
                                            <textarea class="form-control" id="advTC" name="advTC" rows="4" cols="100" placeholder="Enter in detail, terms and conditions for this advertise" required></textarea>
                                        </div>
                                        <label>Subscription Type</label>
                                        <div class="form-group date">
                                            <select class="form-control" name="advSubtype" required>
                                                <option value="">Select Subscription type</option>
                                                <option value="MSADM6">For 6 Months - 5 Rs/Day (MSADM6)</option>
                                                <option value="MSADM3">For 3 Months - 7 Rs/Day (MSADM3)</option>
                                                <option value="MSADM1">For 1 Month - 10 Rs/Day (MSADM1)</option>
                                                <option value="MSADW2">For 2 Weeks - 12 Rs/Day (MSADW2 - Ad banner creation not included)</option>
                                                <option value="MSADW1">For 1 Week - 14 Rs/Day (MSADW1 - Ad banner creation not included)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                        <button type="submit" class="btn btn-primary">Add</button>
                                        <input type="reset" value="Reset" class="btn btn-primary">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div> 
                </section>
            </div>
            <jsp:include page="aFooterFiles.jsp"/>
            <script>
                $('#bothdates').daterangepicker();
            </script>
        </div>
    </body>
</html>
