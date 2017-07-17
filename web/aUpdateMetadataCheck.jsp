<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    int cnt = 0;
    String id = request.getParameter("id");
    String type = request.getParameter("type");
    String metadata = request.getParameter("metadata").trim();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());

        pst = con.prepareStatement("select nm from search where id=? and type=?");
        pst.setString(1, id);
        pst.setString(2, type);
        rs = pst.executeQuery();
        if (rs.next()) {
            pst = con.prepareStatement("update search set metadata=? where id=? and type=?");
            pst.setString(1, metadata);
            pst.setString(2, id);
            pst.setString(3, type);
            cnt = pst.executeUpdate();
        } else {
            if (type.equals("store")) {
                pst = con.prepareStatement("select storename, storearea from storedetails where storeid=?");
                pst.setString(1, id);
                rs = pst.executeQuery();
            } else if (type.equals("hall")) {
                pst = con.prepareStatement("select hallname, hall_area from halls where hallid=?");
                pst.setString(1, id);
                rs = pst.executeQuery();
            } else if (type.equals("mes")) {
                pst = con.prepareStatement("select mesname, mesarea from mes where mesid=?");
                pst.setString(1, id);
                rs = pst.executeQuery();
            } else if (type.equals("hostel")) {
                pst = con.prepareStatement("select hostname, hostarea from hostel where hostid=?");
                pst.setString(1, id);
                rs = pst.executeQuery();
            }
            if (rs.next()) {
                pst = con.prepareStatement("insert into search values(?,?,?,?,?)");
                pst.setString(1, id);
                pst.setString(2, type);
                pst.setString(3, rs.getString(1));
                pst.setString(4, rs.getString(2));
                pst.setString(5, metadata);
                cnt = pst.executeUpdate();
            }
        }
        if (cnt > 0) {
            if (type.equals("store")) {
                response.sendRedirect("aManageStores.jsp?id=" + id);
            } else if (type.equals("mes")) {
                response.sendRedirect("aManageMes.jsp?mid=" + id);
            } else if (type.equals("hall")) {
                response.sendRedirect("aManageHalls.jsp?hid=" + id);
            } else if (type.equals("hostel")) {
                response.sendRedirect("aManageHostels.jsp?hostid=" + id);
            }
        } else {
            out.print("Failed to update metadata");
        }
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }%>