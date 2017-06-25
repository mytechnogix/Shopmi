<%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    int cnt = 0;
    String status = "";
    String id = request.getParameter("id");
    String temp = request.getParameter("status");
    String type = request.getParameter("type");

    if (temp.equals("Active")) {
        status = "Inactive";
    }
    if (temp.equals("Inactive") || temp.equals("Pending")) {
        status = "Active";
    }
    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (type.equals("offer")) {
            pst = con.prepareStatement("update offers set offerstatus=? where oid=?");
            pst.setString(1, status);
            pst.setString(2, id);
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (type.equals("advertise")) {
            pst = con.prepareStatement("update advertise set advstatus=? where aid=?");
            pst.setString(1, status);
            pst.setString(2, id);
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (type.equals("hall")) {
            pst = con.prepareStatement("update halls set status=? where hallid=?");
            pst.setString(1, status);
            pst.setString(2, id);
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (type.equals("mes")) {
            pst = con.prepareStatement("update mes set messtatus=? where mesid=?");
            pst.setString(1, status);
            pst.setString(2, id);
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (type.equals("hostel")) {
            pst = con.prepareStatement("update hostel set hoststatus=? where hostid=?");
            pst.setString(1, status);
            pst.setString(2, id);
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else {
            pst = con.prepareStatement("update storedetails set storestatus=? where storeid=?");
            pst.setString(1, status);
            pst.setString(2, id);
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        }
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }%>