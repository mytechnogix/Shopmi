<%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    int cnt = 0;
    String id = request.getParameter("id");
    String type = request.getParameter("type");
    String opass = request.getParameter("opass");
    String npass = request.getParameter("npass");
    String res = "0";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());

        if (type.equals("user")) {
            pst = con.prepareStatement("update users set pass=? where email=? and pass=?");
            pst.setString(1, npass);
            pst.setString(2, id);
            pst.setString(3, opass);
            cnt = pst.executeUpdate();
        } else if (type.equals("store")) {
            pst = con.prepareStatement("update storedetails set pass=? where storeid=? and pass=?");
            pst.setString(1, npass);
            pst.setString(2, id);
            pst.setString(3, opass);
            cnt = pst.executeUpdate();
        } else if (type.equals("hall")) {
            pst = con.prepareStatement("update halls set pass=? where hallid=? and pass=?");
            pst.setString(1, npass);
            pst.setString(2, id);
            pst.setString(3, opass);
            cnt = pst.executeUpdate();
        } else if (type.equals("mes")) {
            pst = con.prepareStatement("update mes set pass=? where mesid=? and pass=?");
            pst.setString(1, npass);
            pst.setString(2, id);
            pst.setString(3, opass);
            cnt = pst.executeUpdate();
        } else if (type.equals("hostel")) {
            pst = con.prepareStatement("update hostel set pass=? where hostid=? and pass=?");
            pst.setString(1, npass);
            pst.setString(2, id);
            pst.setString(3, opass);
            cnt = pst.executeUpdate();
        } else if (type.equals("admin")) {
            pst = con.prepareStatement("update admin set pass=? where email=? and pass=?");
            pst.setString(1, npass);
            pst.setString(2, id);
            pst.setString(3, opass);
            cnt = pst.executeUpdate();
        }
        if (cnt > 0) {
            res = "1";
        } else if (cnt == 0) {
            res = "2";
        }
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }
    out.print(res);%>