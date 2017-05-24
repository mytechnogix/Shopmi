<%-- 
    Document   : cspLoginCheck
    Created on : Jan 28, 2016, 3:36:13 PM
    Author     : Ankush
--%>
<%@page import="java.sql.*" %>
<%@page import="com.quickc.pack.DBConnector" %>
<html>
    <jsp:include page="aHeadFiles.jsp"/>
    <body style="background-color: darkslategray">
        <%
            String aid = "", pass = "", name = "", img = "", role = "";
            aid = request.getParameter("aid");
            pass = request.getParameter("pass");
            PreparedStatement pst;
            Connection con;
            ResultSet rs;
            int cnt = 0;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                DBConnector dbc = new DBConnector();
                con = DriverManager.getConnection(dbc.getConstr());

                pst = con.prepareStatement("select * from admin where email=? and pass=?;");
                pst.setString(1, aid);
                pst.setString(2, pass);
                rs = pst.executeQuery();

                while (rs.next()) {
                    cnt++;
                    name = rs.getString("nm");
                    role = rs.getString("role");
                }

                if (cnt > 0) {
                    session.setAttribute("adminFlag", "1");
                    session.setAttribute("aid", aid);
                    session.setAttribute("adminName", name);
                    session.setAttribute("adminRole", role);

                    response.sendRedirect("aDashboard.jsp");
                } else {
        %>
        <br><br><br><br>
        <table width="400px" height="250px" align="center" border="3">
            <td align="center">
                <span style="font-size: 20px; font-family: verdana; color: white">Login Failed! Try Again</span>
                <br><br>
                <div class="btn btn-primary" onclick="history.back()">Retry</div>
            </td>
        </table>
        <%            }
                con.close();
            } catch (Exception e) {
                out.print("Error Occured !!" + e);
            }
        %>
    </body>
</html> 

