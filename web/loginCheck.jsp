<%@page import="java.sql.*"%><%@page import="com.quickc.pack.DBConnector"%><%
    String log = request.getParameter("log");
    String res = "", fnm = "", lnm = "", id = "", pass = "";
    if (log.equals("1")) {
        id = request.getParameter("id");
        pass = request.getParameter("pass");
        PreparedStatement pst;
        ResultSet rs;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from users where email=? and pass=? and status='Active'");
        pst.setString(1, id);
        pst.setString(2, pass);
        rs = pst.executeQuery();
        if (rs.next()) {
            fnm = rs.getString("fnm");
            lnm = rs.getString("lnm");
            session.setAttribute("uid", id);
            session.setAttribute("fnm", fnm);
            session.setAttribute("lnm", lnm);
            session.setAttribute("flag", "1");
            res = "1";
        } else {
            res = "2";
        }
    } else {
        session.removeAttribute("flag");
        session.removeAttribute("fnm");
        session.removeAttribute("uid");

        res = "0";
    }
    out.print(res);%>