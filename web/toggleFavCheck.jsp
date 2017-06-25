<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    int cnt = 0;
    String id = request.getParameter("id");
    String type = request.getParameter("type");
    String uid = String.valueOf(session.getAttribute("uid"));
    String res = "0";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (type.equalsIgnoreCase("store")) {
            pst = con.prepareStatement("select storeid from reviewstore where uid=? and storeid=?");
            pst.setString(1, uid);
            pst.setString(2, id);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewstore set fav=fav xor 1 where uid=? and storeid=?");
                pst.setString(1, uid);
                pst.setString(2, id);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewstore(uid, storeid, fav) values(?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, id);
                pst.setInt(3, 1);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            }
        } else if (type.equalsIgnoreCase("hall")) {
            pst = con.prepareStatement("select hallid from reviewhall where uid=? and hallid=?");
            pst.setString(1, uid);
            pst.setString(2, id);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewhall set fav=fav xor 1 where uid=? and hallid=?");
                pst.setString(1, uid);
                pst.setString(2, id);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewhall(uid, hallid, fav) values(?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, id);
                pst.setInt(3, 1);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            }
        } else if (type.equalsIgnoreCase("hostel")) {
            pst = con.prepareStatement("select hostid from reviewhost where uid=? and hostid=?");
            pst.setString(1, uid);
            pst.setString(2, id);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewhost set fav=fav xor 1 where uid=? and hostid=?");
                pst.setString(1, uid);
                pst.setString(2, id);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewhost(uid, hostid, fav) values(?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, id);
                pst.setInt(3, 1);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            }
        } else if (type.equalsIgnoreCase("mes")) {
            pst = con.prepareStatement("select mesid from reviewmes where uid=? and mesid=?");
            pst.setString(1, uid);
            pst.setString(2, id);
            rs = pst.executeQuery();
            if (rs.next()) {

                pst = con.prepareStatement("update reviewmes set fav=fav xor 1 where uid=? and mesid=?");
                pst.setString(1, uid);
                pst.setString(2, id);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                pst = con.prepareStatement("insert into reviewmes(uid, mesid, fav) values(?,?,?);");
                pst.setString(1, uid);
                pst.setString(2, id);
                pst.setInt(3, 1);
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