<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    int cnt = 0;
    String id = request.getParameter("id");
    String type = request.getParameter("type");
    String review = request.getParameter("review");
    String uid = String.valueOf(session.getAttribute("uid"));
    String res = "0";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (uid != null && type.equalsIgnoreCase("store")) {
            pst = con.prepareStatement("select storeid from reviewstore where uid=? and storeid=?");
            pst.setString(1, uid);
            pst.setString(2, id);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewstore set review=? where uid=? and storeid=?");
                pst.setString(1, review);
                pst.setString(2, uid);
                pst.setString(3, id);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewstore(uid, storeid, review) values(?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, id);
                pst.setString(3, review);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            }
        } else if (uid != null && type.equals("hall")) {
            pst = con.prepareStatement("select hallid from reviewhall where uid=? and hallid=?");
            pst.setString(1, uid);
            pst.setString(2, id);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewhall set review=? where uid=? and hallid=?");
                pst.setString(1, review);
                pst.setString(2, uid);
                pst.setString(3, id);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewhall(uid, hallid, review) values(?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, id);
                pst.setString(3, review);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            }
        } else if (uid != null && type.equals("hostel")) {
            pst = con.prepareStatement("select hostid from reviewhost where uid=? and hostid=?");
            pst.setString(1, uid);
            pst.setString(2, id);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewhost set review=? where uid=? and hostid=?");
                pst.setString(1, review);
                pst.setString(2, uid);
                pst.setString(3, id);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewhost(uid, hostid, review) values(?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, id);
                pst.setString(3, review);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            }
        }
         else if (uid != null && type.equals("mes")) {
            pst = con.prepareStatement("select mesid from reviewmes where uid=? and mesid=?");
            pst.setString(1, uid);
            pst.setString(2, id);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewmes set review=? where uid=? and mesid=?");
                pst.setString(1, review);
                pst.setString(2, uid);
                pst.setString(3, id);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewmes(uid, mesid, review) values(?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, id);
                pst.setString(3, review);
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