<%@page contentType="text/html" pageEncoding="UTF-8"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    String input = request.getParameter("query");
    String filter = request.getParameter("filter");
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    Connection con = DriverManager.getConnection(dbc.getConstr());
    Statement stmt = con.createStatement();

    ResultSet rs = stmt.executeQuery("Select * from storedetails where storearea LIKE '%" + input + "%' or storename LIKE '%"
            + input + "%' or city LIKE '%" + input + "%' or category LIKE '%" + input + "%' order by " + filter + " desc");
    String gurkha, storeName = "", contact = "", storeArea = "", services = "", sundayStatus = "", photo = "", storeNameHindi = "";
    String res = "";
    if (rs.next()) {
        res = "<table id='example2' class='table table-bordered table-striped products-list product-list-in-box'><thead><tr><th><span id='showCount'>0</span> shop(s) found related to <span id='resFor' style='color: green; font-weight: bold'></span></th></tr></thead><tbody>";
        rs.previous();
        while (rs.next()) {
            if (rs.getString("storestatus").equals("Active")) {
                gurkha = rs.getString("gurkha");
                storeName = rs.getString("storename");
                storeNameHindi = rs.getString("hindistorename");
                storeArea = rs.getString("storearea");
                contact = rs.getString("contact");
                services = rs.getString("services");
                sundayStatus = rs.getString("closedon");
                photo = rs.getString("photo");

                if (photo.contains("default")) {
                    photo = "shopIcon_sm.png";
                }
                res += "<tr><td style='text-align:left' class='item boxr' style='margin-bottom:10px'><div class='product-img'><img  src='images/storephotos/" + photo + "' alt='Shop Image'></div><div class='product-info'><a href='storeDetails.jsp?id=" + gurkha + "' class='product-title'>" + storeName + " - " + storeNameHindi + " </a><span class=' pull-right top'><a href='storeDetails.jsp?id=" + gurkha + "'><i class='glyphicon glyphicon-map-marker pull-right'></i></a></span><br><span><i class='fa fa-road' title='Location'></i> " + storeArea + "</span><br><span><i class='fa fa-phone' title='Contact'></i>   " + contact + "</span><div class=bottom><span><i class='fa fa-tags'></i> " + services + "</span><br><span><i class='fa fa-ban' title='Closed on'></i>  " + sundayStatus + "</span><br><div class=' text-center' style='background-color:gray'><a href='storeDetails.jsp?id=" + gurkha + "' style='color:#fff'>See More Details</a></div></div></div></td></tr>";
            }
        }
        res += "</tbody><tfoot><tr><td></td></tr></tfoot></table>";
        out.print(res);
    } else {
        out.print("No Records Matched with <b style='font-size: 16px; color:red'><i>" + input + "</i></b> search input");
    }%>