<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    String id = request.getParameter("id");
    String type = request.getParameter("type");
    int rating = 0;
    String uid = String.valueOf(session.getAttribute("uid"));
    String res = "";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (!(uid.equalsIgnoreCase("null")) && type.equals("store")) {
            pst = con.prepareStatement("select rating from reviewstore where uid=? and storeid=?");
            pst.setString(1, uid);
            pst.setString(2, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                rating = rs.getInt("rating");
            }
            res = String.valueOf(rating);
        } else {
            res = "failed";
        }
        out.print(res);
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }%>