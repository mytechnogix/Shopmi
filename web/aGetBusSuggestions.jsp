<%@page contentType="text/html" pageEncoding="UTF-8"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    String input = request.getParameter("query");

    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    Connection con = DriverManager.getConnection(dbc.getConstr());
    Statement stmt = con.createStatement();

    ResultSet rs = stmt.executeQuery("Select * from search where nm LIKE '%" + input + "%' or area LIKE '%"
            + input + "%' or metadata LIKE '%" + input + "%' order by nm limit 3");
    String nm = "", area = "", id = "", type = "";
    String res = "";
    if (rs.next()) {
        res += "<table>";
        rs.previous();
        while (rs.next()) {
            id = rs.getString("id");
            nm = rs.getString("nm");
            area = rs.getString("area");
            type = rs.getString("type");
            if (type.equalsIgnoreCase("store")) {
                res += "<tr class='searchRes'><td><a href='aSubscription.jsp?id=" + id + "&type=store'>" + nm + ", " + area + "  <i class='fa fa-external-link'></a></a></td></tr>";
            } else if (type.equalsIgnoreCase("hall")) {
                res += "<tr class='searchRes'><td><a href='aSubscription.jsp?id=" + id + "&type=hall'>" + nm + ", " + area + "  <i class='fa fa-external-link'></a></a></td></tr>";
            } else if (type.equalsIgnoreCase("mes")) {
                res += "<tr class='searchRes'><td><a href='aSubscription.jsp?id=" + id + "&type=mes'>" + nm + ", " + area + "  <i class='fa fa-external-link'></a></a></td></tr>";
            } else if (type.equalsIgnoreCase("hostel")) {
                res += "<tr class='searchRes'><td><a href='aSubscription.jsp?id=" + id + "&type=hostel'>" + nm + ", " + area + "   <i class='fa fa-external-link'></a></a></td></tr>";
            }
        }
        res += "</table>";
        out.print(res);
    } else {
        out.print("No Records Matched with <b style='font-size: 16px; color:red'><i>" + input + "</i></b> search input");
    }%>