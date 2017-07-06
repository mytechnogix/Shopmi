<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    int hostid = Integer.parseInt(request.getParameter("id"));
    String amenities = request.getParameter("amenities");
    Connection con;
    PreparedStatement pst;
    int cnt = 0;

    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
    pst = con.prepareStatement("update hostel set amenities=? where hostid=? ");
    pst.setString(1, amenities);
    pst.setInt(2, hostid);
    cnt = pst.executeUpdate();
    con.close();
    if (cnt > 0) {
        out.print("1");
    } else {
        out.print("0");
    }%>