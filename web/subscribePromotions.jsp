<%@page import="com.quickc.pack.Email"%><%@page import="java.util.Random"%><%@page import="java.sql.*"%><%@page import="com.quickc.pack.DBConnector"%><%
    PreparedStatement pst;
    ResultSet rs;
    Connection con;
    String res = "0";
    int cnt = 0;
    String email = request.getParameter("email");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from promotions where email=?");
        pst.setString(1, email);
        rs = pst.executeQuery();
        if (!rs.next()) {
            pst = con.prepareStatement("insert into promotions(email) values(?)");
            pst.setString(1, email);
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                res = "1";
            }
        } else {
            res = "2";
        }
        con.close();
    } catch (Exception e) {
        out.print("0");
    }
    out.print(res);%>