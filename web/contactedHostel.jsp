<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    String hostid = request.getParameter("id");
    String type = request.getParameter("type");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (type.equals("hostel")) {
            pst = con.prepareStatement("update hostel set rating=rating+1 where hostid=?");
            pst.setString(1, hostid);
            pst.executeUpdate();
        }
    } catch (Exception ex) {
    }
%>