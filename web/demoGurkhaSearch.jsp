<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    int cnt = 0;
    String type = "hostel";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (type.equals("store")) {
            pst = con.prepareStatement("select storeid, gurkha from storedetails");
            rs = pst.executeQuery();
            while (rs.next()) {
                pst = con.prepareStatement("update search set gurkha=? where id=? and type='store'");
                pst.setString(1, rs.getString("gurkha"));
                pst.setString(2, rs.getString("storeid"));
                cnt = pst.executeUpdate();
            }
        } else if (type.equals("hall")) {
            pst = con.prepareStatement("select hallid, gurkha from halls");
            rs = pst.executeQuery();
            while (rs.next()) {
                pst = con.prepareStatement("update search set gurkha=? where id=? and type='hall'");
                pst.setString(1, rs.getString("gurkha"));
                pst.setString(2, rs.getString("hallid"));
                cnt = pst.executeUpdate();
            }
        } else if (type.equals("mes")) {
            pst = con.prepareStatement("select mesid, gurkha from mes");
            rs = pst.executeQuery();
            while (rs.next()) {
                pst = con.prepareStatement("update search set gurkha=? where id=? and type='mes'");
                pst.setString(1, rs.getString("gurkha"));
                pst.setString(2, rs.getString("mesid"));
                cnt = pst.executeUpdate();
            }
        } else if (type.equals("hostel")) {
            pst = con.prepareStatement("select hostid, gurkha from hostel");
            rs = pst.executeQuery();
            while (rs.next()) {
                pst = con.prepareStatement("update search set gurkha=? where id=? and type='hostel'");
                pst.setString(1, rs.getString("gurkha"));
                pst.setString(2, rs.getString("hostid"));
                cnt = pst.executeUpdate();
            }
        }
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }%>