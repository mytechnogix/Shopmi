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
                                <form role="form" action="aAddStoreDetailsCheck.jsp" method="post">
                                    <input type="hidden" name="opType" value="add"/>
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Select City</label>
                                                    <select class="form-control" id="txtOfferCity" name="txtOfferCity" required>
                                                        <option value="Amravati">Amravati</option>
                                                        <option value="Akola">Akola</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>स्टोर नाम</label>
                                                    <input type="text" id="txtOfferStoreNameHindi" name="txtOfferStoreNameHindi" class="form-control" placeholder="स्टोर का नाम दर्ज करें" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Store Name</label>
                                                    <input type="text" id="txtOfferStoreName" name="txtOfferStoreName" class="form-control" placeholder="Enter store name" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Select Existing Area</label>
                                                    <select class="form-control" id="ddlOfferStoreArea" name="ddlOfferStoreArea" required>
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
                                                    <input type="text" id="txtOfferStoreArea" name="txtOfferStoreArea" class="form-control" placeholder="Enter New Area" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Select Existing Category</label>
                                                    <select class="form-control" id="ddlOfferStoreCat" name="ddlOfferStoreCat" required>
                                                        <option value="Flowers and Decoration Store">Flowers and Decoration Store</option>
                                                        <option value="Saree and Dress Material Store">Saree and Dress Material Store</option>
                                                        <option value="Furniture and Home Decor Store">Furniture and Home Decor Store</option>
                                                        <option value="Paani-Puri Corner">Paani-Puri Corner</option>
                                                        <option value="Hardware Store">Hardware Store</option>
                                                        <option value="Chemist/Drugs/Medical Store">Chemist/Drugs/Medical Store</option>
                                                        <option value="Other">Other</option>
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
                                                    <input type="text" id="txtOfferServices" name="txtOfferServices" class="form-control" placeholder="Enter store services in detail" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-6" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Service Area</label>
                                                    <input type="text" id="txtOfferServiceArea" name="txtOfferServiceArea" class="form-control" placeholder="Enter service area" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Store Opens at</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtOfferOpenAt" name="txtOfferOpenAt" placeholder="Enter store open time" required>
                                                        <div class="input-group-addon" id="timezone1">
                                                            <label id="lblAM" style="cursor: pointer;">AM</label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtAM" id="txtAM" value="AM">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Store closes at</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="txtOfferCloseAt" name="txtOfferCloseAt" placeholder="Enter store close time" required>
                                                        <div class="input-group-addon" id="timezone2">
                                                            <label id="lblPM" style="cursor: pointer;">PM</label> <i class="fa fa-angle-down"></i>
                                                            <input type="hidden" name="txtPM" id="txtPM" value="PM">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3" id="otherDiv">
                                                <div class="form-group">
                                                    <label>Store closed On</label>
                                                    <select class="form-control" id="ddlOfferClosedOn" name="ddlOfferClosedOn" required>
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
                                                        <input type="text" class="form-control" id="txtOfferContact" name="txtOfferContact" placeholder="Enter 10 digit contact number" required>
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
                                                        <input type="text" class="form-control" id="txtOfferURL" name="txtOfferURL" placeholder="Enter website URL of store">
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
                                                        <input type="email" class="form-control" id="txtOfferEmail" name="txtOfferEmail" placeholder="Enter email address">
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
                                                        <option value="free">Initial - Free for 3 Months</option>
                                                        <option value="3">3 Months</option>
                                                        <option value="6">6 Months</option>
                                                        <option value="12">1 Year</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6" id="otherDiv">
                                                <label>Metadata</label>
                                                <div class="form-group date">
                                                    <textarea class="form-control" id="txtMetadata" name="txtMetadata" rows="2" cols="100" placeholder="Search metadata" required></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-6" id="otherDiv">
                                                <label>Full Address</label>
                                                <div class="form-group date">
                                                    <textarea class="form-control" id="txtOfferFullAddress" name="txtOfferFullAddress" rows="2" cols="100" placeholder="Enter full store address" required></textarea>
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
