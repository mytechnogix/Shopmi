<%@page import="java.sql.*"%><%@page import="com.quickc.pack.DBConnector"%><%
    String uid = request.getParameter("email");
    PreparedStatement pst;
    ResultSet rs;
    Connection con;
    String res = "0";
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());
    pst = con.prepareStatement("select * from users where email=? and status='Active';");
    pst.setString(1, uid);
    rs = pst.executeQuery();
    if (rs.next()) {
        session.setAttribute("uid", uid);
        session.setAttribute("fnm", rs.getString("fnm"));
        session.setAttribute("lnm", rs.getString("lnm"));
        session.setAttribute("flag", "1");
        res = "1";
    }
    con.close();
    out.print(res);%>