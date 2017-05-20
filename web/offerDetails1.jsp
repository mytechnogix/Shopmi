<%@page import="DAO.ManageDAO"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    String storeName = "";
    int oid = 0;
    ManageDAO objDAO = new ManageDAO();
    try {
//        out.println("<br/>Encrypted Password     :    " + request.getParameter("p"));
//            out.println("<br/>Salt                 :    " + request.getParameter("s"));
//            out.println("<br/>IV                     :    " + request.getParameter("i"));
//            out.println("<br/>Key                 :    " + session.getAttribute("RANDKEY"));
//            out.println("<br/>Original Password     :    " + objDAO.decryptAESEncryptWithSaltAndIV(request.getParameter("p"), session.getAttribute("RANDKEY").toString(), request.getParameter("s"), request.getParameter("i")));
        oid = Integer.parseInt(objDAO.decryptAESEncryptWithSaltAndIV(request.getParameter("p"), session.getAttribute("RANDKEY").toString(), request.getParameter("s"), request.getParameter("i")));

        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from view_offers where oid=?");
        pst.setInt(1, oid);
        rs = pst.executeQuery();
        while (rs.next()) {
            storeName = rs.getString("storename");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>  
<%=storeName%>
</body>
</html>
