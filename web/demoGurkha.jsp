<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    int cnt = 0;
    String type = "advertise";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (type.equals("store")) {
            pst = con.prepareStatement("select storeid from storedetails");
            rs = pst.executeQuery();
            while (rs.next()) {
                pst = con.prepareStatement("update storedetails set gurkha=fn_enctest(?) where storeid=?");
                pst.setString(1, rs.getString("storeid"));
                pst.setString(2, rs.getString("storeid"));
                cnt = pst.executeUpdate();
            }
        } else if (type.equals("hall")) {
            pst = con.prepareStatement("select hallid from halls");
            rs = pst.executeQuery();
            while (rs.next()) {
                pst = con.prepareStatement("update halls set gurkha=fn_enctest(?) where hallid=?");
                pst.setString(1, rs.getString("hallid"));
                pst.setString(2, rs.getString("hallid"));
                cnt = pst.executeUpdate();
            }
        } else if (type.equals("mes")) {
            pst = con.prepareStatement("select mesid from mes");
            rs = pst.executeQuery();
            while (rs.next()) {
                pst = con.prepareStatement("update mes set gurkha=fn_enctest(?) where mesid=?");
                pst.setString(1, rs.getString("mesid"));
                pst.setString(2, rs.getString("mesid"));
                cnt = pst.executeUpdate();
            }
        } else if (type.equals("hostel")) {
            pst = con.prepareStatement("select hostid from hostel");
            rs = pst.executeQuery();
            while (rs.next()) {
                pst = con.prepareStatement("update hostel set gurkha=fn_enctest(?) where hostid=?");
                pst.setInt(1, rs.getInt("hostid"));
                pst.setInt(2, rs.getInt("hostid"));
                cnt = pst.executeUpdate();
            }
        }else if (type.equals("advertise")) {
            pst = con.prepareStatement("select aid from advertise");
            rs = pst.executeQuery();
            while (rs.next()) {
                pst = con.prepareStatement("update advertise set gurkha=fn_enctest(?) where aid=?");
                pst.setInt(1, rs.getInt("aid"));
                pst.setInt(2, rs.getInt("aid"));
                cnt = pst.executeUpdate();
            }
        }
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }%>