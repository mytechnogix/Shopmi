<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <%
        String storeName = "";
        int storeId = Integer.parseInt(request.getParameter("sid"));
        int oid = Integer.parseInt(request.getParameter("oid"));

        PreparedStatement pst;
        ResultSet rs;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select storename from storedetails where storeid=? and storestatus='Active'");
        pst.setInt(1, storeId);
        rs = pst.executeQuery();
        while (rs.next()) {
            storeName = rs.getString("storename");
        }
    %>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=storeName%></title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
        <style>
            #btnUpdate {
                display: none;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="aHeader.jsp"/>
            <jsp:include page="aSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        <%=storeName%>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active"> Manage Offers</li>
                        <li class="active"> <%=storeName%></li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <%
                                    pst = con.prepareStatement("select * from offers where oid=?");
                                    pst.setInt(1, oid);
                                    rs = pst.executeQuery();
                                    while (rs.next()) {
                                %>
                                <form name="formDetails" action="aAddOfferCheck.jsp" method="post">
                                    <input type="hidden" id="offerStoreId" value="NA">                                    <input type="hidden" id="offerStoreId" value="NA">
                                    <input type="hidden" id="type" name="type" value="<%=oid%>">
                                    <div class="box-body">
                                        <label>Offer Duration</label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="text" id="bothdates" name="bothdates" class="form-control" value="<%=rs.getString("sDate")%> - <%=rs.getString("eDate")%>" required>
                                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                                            </div>
                                        </div>
                                        <label>Offer on</label>
                                        <div class="form-group date">
                                            <input type="text" class="form-control" id="offerOn"  name="offerOn" value="<%=rs.getString("discounton")%>" required>
                                        </div>
                                        <label>Discount in Percent(%)</label>
                                        <div class="form-group date">
                                            <input type="number" class="form-control" id="offerDiscount" name="offerDiscount" value="<%=rs.getString("discount")%>" required>
                                        </div>
                                        <label>Number of Coupons</label>
                                        <div class="form-group date">
                                            <input type="number" class="form-control" id="offerCoupons" name="offerCoupons" value="<%=rs.getInt("totalcoupons")%>" required>
                                        </div>
                                        <label>Terms and Conditions</label>
                                        <div class="form-group date">
                                            <textarea class="form-control" id="offerTC" name="offerTC" rows="4" cols="100" required><%=rs.getString("termsandcondition")%></textarea>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <div id="btnEdit" class="btn btn-primary">Edit</div>
                                        <button type="submit" id="btnUpdate" class="btn btn-primary">Update</button>
                                        <input type="reset" id="btnReset" value="Reset" class="btn btn-primary">
                                        <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Image Preview</h3>
                                    <small class="pull-right"><a href="aAddOfferPhoto.jsp?oid=<%=oid%>">Change Photo</a></small>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-4 setImage">
                                            <img src="images/offerphotos/<%=rs.getString("offerimg")%>" style="width: 300px; height: 300px"/>
                                        </div>
                                    </div>
                                </div>   
                                <div class="box-footer clearfix no-border">
                                    <span><%=rs.getString("offerimg")%></span>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <%}%>
                </section>
            </div>
            <jsp:include page="aSideMenuRight.jsp"/>
            <jsp:include page="aFooterFiles.jsp"/>
            <script>
                // $('#bothdates').daterangepicker();
                
                $("#btnUpdate").hide();
                $("#bothdates").attr("Readonly","readonly");
                $("#offerOn").attr("Readonly","readonly");
                $("#offerDiscount").attr("Readonly","readonly");
                $("#offerCoupons").attr("Readonly","readonly");
                $("#offerTC").attr("Readonly","readonly");
                
                $("#btnEdit").click(function(){
                    $("#btnUpdate").show();
                    $("#btnEdit").hide();
                    $("#bothdates").removeAttr("Readonly");
                    $("#offerOn").removeAttr("Readonly");
                    $("#offerDiscount").removeAttr("Readonly");
                    $("#offerCoupons").removeAttr("Readonly");
                    $("#offerTC").removeAttr("Readonly");
                    $('#bothdates').daterangepicker();
                });
                $("#btnReset").click(function(){
                    $("#btnUpdate").hide();
                    $("#btnEdit").show();
                    $("#bothdates").attr("Readonly","readonly");
                    $("#offerOn").attr("Readonly","readonly");
                    $("#offerDiscount").attr("Readonly","readonly");
                    $("#offerCoupons").attr("Readonly","readonly");
                    $("#offerTC").attr("Readonly","readonly");
                });
            </script>
        </div>
    </body>
</html>
