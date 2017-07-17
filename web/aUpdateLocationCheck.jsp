<%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    int cnt = 0;
    String id = request.getParameter("id");
    String type = request.getParameter("type");
    String mapLocation = request.getParameter("txtLat") + "," + request.getParameter("txtLong");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (type.equals("store")) {
            pst = con.prepareStatement("update storedetails set maplocation=? where storeid=?");
            pst.setString(1, mapLocation);
            pst.setString(2, id);
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                response.sendRedirect("aManageStores.jsp");
            } else {
                out.print("Failed to update shop location");
            }
        } else if (type.equals("mes")) {
            pst = con.prepareStatement("update mes set maplocation=? where mesid=?");
            pst.setString(1, mapLocation);
            pst.setString(2, id);
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                response.sendRedirect("aManageMes.jsp");
            } else {
                out.print("Failed to update mes location");
            }
        } else if (type.equals("hostel")) {
            pst = con.prepareStatement("update hostel set maplocation=? where hostid=?");
            pst.setString(1, mapLocation);
            pst.setString(2, id);
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                response.sendRedirect("aManageHostels.jsp");
            } else {
                out.print("Failed to update property location");
            }
        } else if (type.equals("hall")) {
            pst = con.prepareStatement("update halls set maplocation=? where hallid=?");
            pst.setString(1, mapLocation);
            pst.setString(2, id);
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                response.sendRedirect("aManageHalls.jsp");
            } else {
                out.print("Failed to update hall location");
            }
        }
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }%>