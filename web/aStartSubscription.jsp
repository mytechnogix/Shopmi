<%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    int cnt = 0;
    String id = request.getParameter("id");
    String type = request.getParameter("type");
    String date = request.getParameter("date");
    String res = "0";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());

        if (type.equals("store")) {
            pst = con.prepareStatement("update storedetails set substart=? where storeid=?");
            pst.setString(1, date);
            pst.setString(2, id);
            cnt = pst.executeUpdate();
        } else if (type.equals("hall")) {
            pst = con.prepareStatement("update halls set substart=? where hallid=?");
            pst.setString(1, date);
            pst.setString(2, id);
            cnt = pst.executeUpdate();
        } else if (type.equals("mes")) {
            pst = con.prepareStatement("update mes set substart=? where mesid=?");
            pst.setString(1, date);
            pst.setString(2, id);
            cnt = pst.executeUpdate();
        } else if (type.equals("hostel")) {
            pst = con.prepareStatement("update hostel set substart=? where hostid=?");
            pst.setString(1, date);
            pst.setString(2, id);
            cnt = pst.executeUpdate();
        } else if (type.equals("adv")) {
            pst = con.prepareStatement("update advertise set substart=? where aid=?");
            pst.setString(1, date);
            pst.setString(2, id);
            cnt = pst.executeUpdate();
        }
        if (cnt > 0) {
            res = "1";
        } else {
            res = "0";
        }
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }
    out.print(res);%>