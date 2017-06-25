<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Add Marriage Hall Details</title>
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
                        Add Marriage Hall
                        <small>( Step 2 of 3 )</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i> Manage Marriage Hall</a></li>
                        <li class="active">Add Marriage Hall</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <form role="form" action="aAddHallDetailsCheck.jsp" method="post">
                                    <input type="hidden" name="opType" value="add"/>
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Select City</label>
                                                    <select class="form-control" id="txtHallCity" name="txtHallCity" required>
                                                        <option value="Amravati">Amravati</option>
                                                        <option value="Akola">Akola</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>हॉल नाम</label>
                                                    <input type="text" id="txtHallStoreNameHindi" name="txtHallNameHindi" class="form-control" placeholder="हॉल का नाम दर्ज करें" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Hall Name</label>
                                                    <input type="text" id="txtHallStoreName" name="txtHallName" class="form-control" placeholder="Enter hall name" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Select Existing Area</label>
                                                    <select class="form-control" id="ddlHallArea" name="ddlHallArea" required>
                                                        <option value="Amravati">Ambapeth</option>
                                                        <option value="Dastur Nagar">Dastur Nagar</option>
                                                        <option value="Nawathe">Nawathe</option>
                                                        <option value="Badnera">Badnera</option>
                                                        <option value="Panchwati Chowk">Panchwati Chowk</option>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Add New Area</label>
                                                    <input type="text" name="txtHallArea" id="txtHallArea" class="form-control" placeholder="Enter New Area" required>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label>Hall Services</label>
                                                        <input type="text" id="txtHallServices" name="txtHallServices" class="form-control" placeholder="Enter services in detail" required>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6" id="otherDiv">
                                                    <div class="form-group">
                                                        <label>Hall Area in Square Feet</label>
                                                        <input type="text" id="txtHallAreaSqft" name="txtHallAreaSqft" class="form-control" placeholder="Enter hall dimensions" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label>Website URL</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" id="txtHallURL" name="txtHallURL" placeholder="Enter website URL of hall">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-link"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label>Email Address</label>
                                                        <div class="input-group">
                                                            <input type="email" class="form-control" id="txtHallEmail" name="txtHallEmail" placeholder="Enter email address">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-envelope"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <div class="form-group">
                                                        <label>Contact Number</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" id="txtHallContact" name="txtHallContact" placeholder="Enter contact numbers separated by comma(,)">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-phone"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3" id="otherDiv">
                                                    <div class="form-group">
                                                        <label>Subscription Type</label>
                                                        <select class="form-control" id="ddlHallSubs" name="ddlHallSubs" required>
                                                            <option value="free">Initial - Free for 3 Months</option>
                                                            <option value="3">3 Months</option>
                                                            <option value="6">6 Months</option>
                                                            <option value="12">1 Year</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label>Full Address</label>
                                                        <div class="form-group date">
                                                            <textarea class="form-control" id="txtHallFullAddress" name="txtHallFullAddress" rows="2" cols="100" placeholder="Enter full address" required></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <button type="submit" class="btn btn-primary">Next</button>
                                                <input type="reset" value="Reset" class="btn btn-primary">
                                                <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                            </div>
                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="aSideMenuRight.jsp"/>
        <jsp:include page="aFooterFiles.jsp"/>
        <script>
            
            $("#txtHallArea").attr("disabled", "disabled");
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
            
            $('#bothdates').daterangepicker();
            $('#timezone1').click(function(){
                $('#lblAM').text($('#lblAM').text() == 'PM' ? 'AM' : 'PM');
                $('#txtAM').val($('#lblAM').text());
            });
            $('#timezone2').click(function(){
                $('#lblPM').text($('#lblPM').text() == 'PM' ? 'AM' : 'PM');
                $('#txtPM').val($('#lblPM').text());
            });
 
        </script>
    </div>
</body>
</html>
