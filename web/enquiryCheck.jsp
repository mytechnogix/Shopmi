<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    int cnt = 0, rid = 0;
    String type = request.getParameter("type");
    String sub = request.getParameter("sub");
    String desc = request.getParameter("desc");
    String storeid = request.getParameter("sid");
    String uid = String.valueOf(session.getAttribute("uid"));
    String res = "0";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (uid != null && type.equalsIgnoreCase("store")) {
            pst = con.prepareStatement("select storeid from reviewstore where uid=? and storeid=?");
            pst.setString(1, uid);
            pst.setString(2, storeid);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewstore set reviewsub=?, enquiry=?, reviewdate=now() where uid=? and storeid=?");
                pst.setString(1, sub);
                pst.setString(2, desc);
                pst.setString(3, uid);
                pst.setString(4, storeid);

                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewstore(uid, storeid, reviewsub, enquiry) values(?,?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, storeid);
                pst.setString(3, sub);
                pst.setString(4, desc);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            }
        } else if (uid != null && type.equalsIgnoreCase("hall")) {
            pst = con.prepareStatement("select hallid from reviewhall where uid=? and hallid=?");
            pst.setString(1, uid);
            pst.setString(2, storeid);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewhall set reviewsub=?, enquiry=? where uid=? and hallid=?");
                pst.setString(1, sub);
                pst.setString(2, desc);
                pst.setString(3, uid);
                pst.setString(4, storeid);

                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewhall(uid, hallid, reviewsub, enquiry) values(?,?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, storeid);
                pst.setString(3, sub);
                pst.setString(4, desc);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            }
        } else if (uid != null && type.equalsIgnoreCase("mes")) {
            pst = con.prepareStatement("select mesid from reviewmes where uid=? and mesid=?");
            pst.setString(1, uid);
            pst.setString(2, storeid);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewmes set reviewsub=?, enquiry=? where uid=? and mesid=?");
                pst.setString(1, sub);
                pst.setString(2, desc);
                pst.setString(3, uid);
                pst.setString(4, storeid);

                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewmes(uid, mesid, reviewsub, enquiry) values(?,?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, storeid);
                pst.setString(3, sub);
                pst.setString(4, desc);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            }
        }
        out.print(res);
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }%>