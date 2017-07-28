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
            String id = "", pass = "", name = "", img = "", role = "", type = "";
            id = request.getParameter("id");
            pass = request.getParameter("pass");
            type = request.getParameter("type");

            PreparedStatement pst;
            Connection con;
            ResultSet rs;
            int cnt = 0;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                DBConnector dbc = new DBConnector();
                con = DriverManager.getConnection(dbc.getConstr());
                if (type.equals("admin")) {
                    pst = con.prepareStatement("select * from admin where email=? and pass=?;");
                    pst.setString(1, id);
                    pst.setString(2, pass);
                    rs = pst.executeQuery();

                    if (rs.next()) {
                        session.setAttribute("adminFlag", "1");
                        session.setAttribute("aid", id);
                        session.setAttribute("adminName", rs.getString("nm"));
                        session.setAttribute("adminRole", rs.getString("role"));
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
        } else if (type.equals("hall")) {
            pst = con.prepareStatement("select hallname, photo from halls where hallid=? and pass=? and status='Active';");
            pst.setString(1, id);
            pst.setString(2, pass);
            rs = pst.executeQuery();

            if (rs.next()) {
                session.setAttribute("hallFlag", "1");
                session.setAttribute("hallid", id);
                session.setAttribute("hallPhoto", rs.getString("photo"));
                session.setAttribute("hallName", rs.getString("hallname"));
                response.sendRedirect("hDashboard.jsp");
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
        <%                    }
        } else if (type.equals("store")) {
            pst = con.prepareStatement("select storeid, storename, photo from storedetails where email=? and pass=? and storestatus='Active';");
            pst.setString(1, id);
            pst.setString(2, pass);
            rs = pst.executeQuery();
            if (rs.next()) {
                session.setAttribute("storeFlag", "1");
                session.setAttribute("sStoreid", rs.getString("storeid"));
                session.setAttribute("sStorePhoto", rs.getString("photo"));
                session.setAttribute("sStoreName", rs.getString("storename"));
                response.sendRedirect("sDashboard.jsp");
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
        <%                    }
                }
                con.close();
            } catch (Exception e) {
                out.print("Error Occured !!" + e);
            }
        %>
    </body>
</html> 

