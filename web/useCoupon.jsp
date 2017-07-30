<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    int cnt = 0;
    String cid = request.getParameter("cid");
    String res = "0";
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
    pst = con.prepareStatement("update claimedoffers set couponstatus='Used', redeemdate=now() where cid=?");
    pst.setString(1, cid);
    cnt = pst.executeUpdate();
    if (cnt > 0) {
        res = "1";
    }
    con.close();
    out.print(res);%>