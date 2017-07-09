<%@page import="DAO.ManageDAO"%><%@page import="BO.ManageUsersBO"%><%@page import="java.sql.*"%><%@page import="com.quickc.pack.DBConnector"%><%
    ManageUsersBO objBO = new ManageUsersBO();
    ManageDAO objDAO = new ManageDAO();
    objBO.setEmail(request.getParameter("email"));
    objBO.setFnm(request.getParameter("fnm"));
    objBO.setLnm(request.getParameter("lnm"));
    objBO.setPass(request.getParameter("pass"));
    objBO.setPhoto(request.getParameter("img"));

    objDAO.addUser(objBO);
    String res = "0";
    if (objBO.getFlag() == 1) {
        PreparedStatement pst;
        ResultSet rs;
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select * from users where email=? and status='Active';");
        pst.setString(1, objBO.getEmail());
        rs = pst.executeQuery();
        if (rs.next()) {
            session.setAttribute("uid", objBO.getEmail());
            session.setAttribute("fnm", rs.getString("fnm"));
            session.setAttribute("lnm", rs.getString("lnm"));
            session.setAttribute("flag", "1");
            res = "1";
        }
        con.close();
    } else if (objBO.getFlag() == 2) {
        res = "2";
    }
    out.print(res);%>