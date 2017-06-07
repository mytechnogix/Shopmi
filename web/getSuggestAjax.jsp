<%@page contentType="text/html" pageEncoding="UTF-8"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    String input = request.getParameter("query");
    String filter = request.getParameter("filter");

    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    Connection con = DriverManager.getConnection(dbc.getConstr());
    Statement stmt = con.createStatement();

    ResultSet rs = stmt.executeQuery("Select * from storedetails where storearea LIKE '%" + input + "%' or storename LIKE '%"
            + input + "%' or city LIKE '%" + input + "%' or category LIKE '%" + input + "%' order by " + filter + " desc");
    String storeName = "", address = "", contact = "", services = "", serviceArea = "", sundayStatus = "", photo = "", storeNameHindi = "";
    int storeId = 0, cnt = 0;
    String res = "";
    if (rs.next()) {
        res = "<table id='example1' class='table table-bordered table-striped products-list product-list-in-box'><thead><tr><th><span id='showCount'>0</span> shop(s) found related to <span id='resFor' style='color: green; font-weight: bold'></span></th></tr></thead><tbody>";
        rs.previous();
        while (rs.next()) {
            if (rs.getString("storestatus").equals("Active")) {
                storeId = rs.getInt("storeid");
                storeName = rs.getString("storename");
                storeNameHindi = rs.getString("hindistorename");
                address = rs.getString("storearea");
                contact = rs.getString("contact");
                serviceArea = rs.getString("servicearea");
                services = rs.getString("services");
                sundayStatus = rs.getString("closedon");
                photo = rs.getString("photo");

                if (photo.contains("default")) {
                    photo = "shopIcon_sm.png";
                }
                res += "<tr><td style='text-align:left' class='item boxr' style='margin-bottom:10px'><div class='product-img'><img  src='images/storephotos/" + photo + "' alt='Shop Image'></div><div class='product-info'><a href='storeDetails.jsp?id=" + storeId + "' class='product-title' target='_blank'>" + storeName + " - " + storeNameHindi + " </a><span class=' pull-right top'><i class='glyphicon glyphicon-map-marker pull-right'></i></span><br><span>" + address + "</span><br><span >" + contact + "</span><div class=bottom><span>Services: " + services + "</span><br><span>Closed on : " + sundayStatus + "</span><br><span>Service Area : " + serviceArea + "</span><br><div class='box-footer text-center'><a href='storeDetails.jsp?id=" + storeId + "' target='_blank'>See More Details</a></div></div></div></td></tr>";
            }
        }
        res += "</tbody><tfoot><tr><td></td></tr></tfoot></table>";
        out.print(res);
    } else {
        out.print("No Records Matched with <b style='font-size: 16px; color:red'><i>" + input + "</i></b> search input");
    }%>