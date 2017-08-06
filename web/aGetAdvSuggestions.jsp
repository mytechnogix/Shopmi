<%@page contentType="text/html" pageEncoding="UTF-8"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    String input = request.getParameter("query");

    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    Connection con = DriverManager.getConnection(dbc.getConstr());
    Statement stmt = con.createStatement();

    ResultSet rs = stmt.executeQuery("Select * from view_advertise where storename LIKE '%" + input + "%' or storearea LIKE '%"
            + input + "%' or advtitle LIKE '%" + input + "%' or advdesc LIKE '%" + input + "%' order by storename limit 5");
    String nm = "", advtitle = "", aid = "", type = "";
    String res = "";
    if (rs.next()) {
        res += "<table>";
        rs.previous();
        while (rs.next()) {
            aid = rs.getString("aid");
            nm = rs.getString("storename");
            advtitle = rs.getString("advtitle");
            res += "<tr class='searchRes'><td><a href='aSubscriptionAdv.jsp?id=" + aid + "'>" + advtitle + ", " + nm + "  <i class='fa fa-external-link'></a></a></td></tr>";
        }
        res += "</table>";
        out.print(res);
    } else {
        out.print("No Records Matched with <b style='font-size: 16px; color:red'><i>" + input + "</i></b> search input");
    }%>