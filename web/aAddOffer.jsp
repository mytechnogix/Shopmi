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
        <title>Add Offer</title>
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
                        Add Offer
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Offers</li>
                        <li class="active">Add New Offer</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row imgUpload" >
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <form role="form" action="#" onsubmit="aAddOffer('000')">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Select Store</label>
                                            <select class="form-control" id="offerStoreId" required>
                                                <option value="">-- Select Store --</option>
                                                <%
                                                    PreparedStatement pst;
                                                    ResultSet rs;
                                                    Connection con;
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    DBConnector dbc = new DBConnector();
                                                    con = DriverManager.getConnection(dbc.getConstr());
                                                    pst = con.prepareStatement("select storeid, storename from storedetails where storestatus='Active'");
                                                    rs = pst.executeQuery();
                                                    while (rs.next()) {
                                                %>
                                                <option value="<%=rs.getString("storeid")%>"><%=rs.getString("storename")%></option>
                                                <%
                                                    }
                                                    con.close();
                                                %>
                                            </select>
                                        </div>
                                        <label>Offer Duration</label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="text" id="bothdates" class="form-control" placeholder="Select Start and End Date" required>
                                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                                            </div>
                                        </div>
                                        <label>Offer on</label>
                                        <div class="form-group date">
                                            <input type="text" class="form-control" id="offerOn" placeholder="Enter offer product name" required>
                                        </div>
                                        <label>Discount in Percent(%)</label>
                                        <div class="form-group date">
                                            <input type="number" class="form-control" id="offerDiscount" placeholder="Enter discount in percent" required>
                                        </div>
                                        <label>Number of Coupons</label>
                                        <div class="form-group date">
                                            <input type="number" class="form-control" id="offerCoupons" placeholder="Enter number of coupons to generate" required>
                                        </div>
                                        <label>Terms and Conditions</label>
                                        <div class="form-group date">
                                            <textarea class="form-control" id="offerTC" rows="4" cols="100" placeholder="Enter in detail, terms and conditions for this offer" required></textarea>
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
            <jsp:include page="aSideMenuRight.jsp"/>
            <jsp:include page="aFooterFiles.jsp"/>
            <script>
                $('#bothdates').daterangepicker();
            </script>
        </div>
    </body>
</html>
