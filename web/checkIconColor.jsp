<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    int cnt = 0;
    String id = request.getParameter("id");
    String type = request.getParameter("type");
    double rating = 0;
    String enquired = "";
    String reviewed = "";
    int fav = 0;
    String uid = String.valueOf(session.getAttribute("uid"));
    String res = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (!(uid.equalsIgnoreCase("null")) && type.equals("store")) {
            pst = con.prepareStatement("select * from reviewstore where uid=? and storeid=?");
            pst.setString(1, uid);
            pst.setString(2, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                enquired = rs.getString("enquiry");
                fav = rs.getInt("fav");
                rating = rs.getInt("rating");
                reviewed = rs.getString("review");

                if (fav == 1) {
                    res += "1";
                } else {
                    res += "0";
                }
                if (rating != 0) {
                    res += ",1";
                } else {
                    res += ",0";
                }
                if (!enquired.equals("NA")) {
                    res += ",1";
                } else {
                    res += ",0";
                }
                if (!reviewed.equals("NA")) {
                    res += ",1";
                } else {
                    res += ",0";
                }
            }
        } else {
            res = "failed";
        }
        out.print(res);
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }%>