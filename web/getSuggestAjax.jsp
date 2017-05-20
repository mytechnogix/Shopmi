<%-- 
    Document   : getSuggestAjax
    Created on : Mar 5, 2017, 2:23:21 PM
    Author     : Ankush
--%>

<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
<%
    String input = request.getParameter("query");
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    Connection con = DriverManager.getConnection(dbc.getConstr());
    Statement stmt = con.createStatement();

    ResultSet rs = stmt.executeQuery("Select * from storedetails where storearea LIKE '%" + input + "%' or storename LIKE '%" 
            + input + "%' or city LIKE '%" + input + "%' or category LIKE '%" + input + "%'");
    String storeName = "", address = "", contact = "", services = "", serviceArea = "", sundayStatus = "", photo = "";
    int storeId = 0, cnt = 0;

    if (rs.next()) {
        rs.previous();
        while (rs.next()) {
            storeId = rs.getInt("storeid");
            storeName = rs.getString("storename");
            address = rs.getString("storearea");
            contact = rs.getString("contact");
            serviceArea = rs.getString("servicearea");
            services = rs.getString("services");
            sundayStatus = rs.getString("closedon");
            photo = rs.getString("photo");

            if (photo.contains("default")) {
                photo = "shopIcon_sm.png";
            }
            out.print("<li class='item boxr' style='margin-bottom:10px'><div class='product-img'><img src='images/storephotos/" + photo + "' alt='Shop Image'></div><div class='product-info'><a href='storeDetails.jsp?id=" + storeId + "' class='product-title' target='_blank'>" + storeName + "</a><span class=' pull-right top'><i class='glyphicon glyphicon-map-marker pull-right'></i></span><br><span>" + address + "</span><br><span >" + contact + "</span><div class=bottom><span>Services: " + services + "</span><br><span>Closed on : " + sundayStatus + "</span><br><span>Service Area : " + serviceArea + "</span><br><div class='box-footer text-center'><a href='storeDetails.jsp?id=" + storeId + "' class='uppercase' target='_blank'>See More</a></div></div></div></li>");
        }
    } else {
        out.print("No Records Matched with <b style='font-size: 16px; color:red'><i>"+input+"</i></b> search input");
    }
%>

