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
        <title>Add Mes</title>
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
                        Add Mes
                        <small>( Step 2 of 3 )</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i> Manage Services</a></li>
                        <li class="active">Manage Mes</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <form role="form" action="aAddMesDetailsCheck.jsp" method="post">
                                    <input type="hidden" name="opType" value="add"/>
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Select City</label>
                                                    <select class="form-control" id="txtMesCity" name="txtMesCity" required>
                                                        <option value="Amravati">Amravati</option>
                                                        <option value="Akola">Akola</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>मेस नाम</label>
                                                    <input type="text" id="txtMesNameHindi" name="txtMesNameHindi" class="form-control" placeholder="मेस का नाम दर्ज करें" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Mes Name</label>
                                                    <input type="text" id="txtMesName" name="txtMesName" class="form-control" placeholder="Enter mes name" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Select Existing Area</label>
                                                    <select class="form-control" id="ddlMesArea" name="ddlMesArea" required>
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
                                                    <input type="text" id="txtMesArea" name="txtMesArea" class="form-control" placeholder="Enter New Area" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Service Area</label>
                                                    <input type="text" id="txtMesServiceArea" name="txtMesServiceArea" class="form-control" placeholder="Enter service area" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <label>Home Delivery</label>
                                                <select class="form-control" id="ddlHomeDeliveryCity" name="ddlMesHomeDelivery" required>
                                                    <option value="">--select home delivery--</option>    
                                                    <option value="Yes">Yes</option>
                                                    <option value="No">No</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-3" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Mes closed On</label>
                                                    <select class="form-control" id="ddlMesClosedOn" name="ddlMesClosedOn" required>
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
                                            <div class="col-lg-3">
                                                <label>Mes Lunch Time</label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtMesLunchStart" name="txtMesLunchStart" placeholder="Lunch start time" required>
                                                        <div class="input-group-addon" id="timezone1">
                                                            <label id="lblLunchAM" style="cursor: pointer;">AM</label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtLunchAM" id="txtLunchAM" value="AM">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <label>&nbsp;</label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtMesLunchEnd" name="txtMesLunchEnd" placeholder="Lunch end time" required>
                                                        <div class="input-group-addon" id="timezone2">
                                                            <label id="lblLunchPM" style="cursor: pointer;">PM</label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtLunchPM" id="txtLunchPM" value="PM">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <label>Mes Dinner Time</label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtMesDinnerStart" name="txtMesDinnerStart" placeholder="Dinner start time" required>
                                                        <div class="input-group-addon" id="timezone3">
                                                            <label id="lblDinnerAM" style="cursor: pointer;">AM</label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtDinnerAM" id="txtDinnerAM" value="AM">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <label>&nbsp;</label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtMesDinnerEnd" name="txtMesDinnerEnd" placeholder="Dinner end time" required>
                                                        <div class="input-group-addon" id="timezone4">
                                                            <label id="lblDinnerPM" style="cursor: pointer;">PM</label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtDinnerPM" id="txtDinnerPM" value="PM">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Mes Services</label>
                                                    <input type="text" id="txtMesServices" name="txtMesServices" class="form-control" placeholder="Enter mes services in detail" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Contact Number</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtMesContact" name="txtMesContact" placeholder="Enter 10 digit contact number" required>
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Subscription Type</label>
                                                    <select class="form-control" id="ddlMesSubs" name="ddlMesSubs" required>
                                                        <option value="Initial - Free for 3 Months">Initial - Free for 3 Months</option>
                                                        <option value="3 Months">3 Months</option>
                                                        <option value="6 Months">6 Months</option>
                                                        <option value="12 Months">1 Year</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Website URL</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtMesURL" name="txtMesURL" placeholder="Enter website URL">
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
                                                        <input type="email" class="form-control" id="txtMesEmail" name="txtMesEmail" placeholder="Enter email address">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-envelope"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <label>Metadata</label>
                                                <div class="form-group date">
                                                    <textarea class="form-control" id="txtMesMetadata" name="txtMesMetadata" rows="2" cols="100" placeholder="Enter metadata for search" required></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <label>Full Address</label>
                                                <div class="form-group date">
                                                    <textarea class="form-control" id="txtMesFullAddress" name="txtMesFullAddress" rows="2" cols="100" placeholder="Enter full mes address" required></textarea>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Next</button>
                                        <input type="reset" value="Reset" class="btn btn-primary">
                                        <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
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

                $("#txtMesArea").attr("disabled", "disabled");
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
