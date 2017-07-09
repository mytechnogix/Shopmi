<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    String id = request.getParameter("id");
    String res = "0";
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
    pst = con.prepareStatement("select oid from offers where storeid=?");
    pst.setString(1, id);
    rs = pst.executeQuery();
    if (rs.next()) {
        res = rs.getString("oid");
    }
    con.close();
    out.print(res);%>