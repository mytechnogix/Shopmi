<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        int hostid = Integer.parseInt(String.valueOf(session.getAttribute("hostidAdd")));
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Add Hostel Amenities</title>
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
                        Add Hostel Amenities
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
                                <form onsubmit="checkAmenities(); return false;">
                                    <input type="hidden" name="hostidAdd" id="hostidAdd" value="<%=hostid%>">
                                    <div class="box-body">
                                        <div class="col-lg-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="lift" id="lift" value="lift"> Lift
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="ac" id="ac" value="ac" > Air Conditioner
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="swim" id="swim" value="swim" > Swimming Pool
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="harvest" id="harvest" value="harvest" > Rain Water Harvesting
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="servantroom" id="servantroom" value="servantroom" > Servant Room
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="gas" id="gas" value="gas" > Gas Pipeline
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="gym" id="gym" value="gym" > Gym
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="power" id="power" value="power" > Power Backup
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="checkbox">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="firesafe" id="firesafe" value="firesafe" > Fire Safety
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="club" id="club" value="club" > Club House
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="play" id="play" value="play" > Children's Play Area 
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="security" id="security" value="security" > Security
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="park" id="park" value="park" > Park
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="housekeeping" id="housekeeping" value="housekeeping" > House Keeping
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="internet" id="internet" value="internet" > Internet Services
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="parking" id="parking" value="parking" > Parking
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                        <input type="button" onclick="checkAmenities('add')" value="Next" class="btn btn-primary">
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
        </div>
    </body>
</html>
