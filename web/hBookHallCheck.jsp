<%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    int cnt = 0;
    int hallid = Integer.parseInt(String.valueOf(session.getAttribute("hHallid")));
    String type = request.getParameter("type");
    int dd = Integer.parseInt(request.getParameter("dd"));
    int mm = Integer.parseInt(request.getParameter("mm"));
    int yy = Integer.parseInt(request.getParameter("yy"));
    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        if (type.equals("book")) {
            pst = con.prepareStatement("insert into bookedhall values(?,?,?,?)");
            pst.setInt(1, hallid);
            pst.setInt(2, dd);
            pst.setInt(3, mm);
            pst.setInt(4, yy);
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else {
            pst = con.prepareStatement("delete from bookedhall where hallid=? and dd=? and mm=? and yy=?");
            pst.setInt(1, hallid);
            pst.setInt(2, dd);
            pst.setInt(3, mm);
            pst.setInt(4, yy);
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