<%@page import="DAO.ManageDAO"%><%@page import="BO.ManageUsersBO"%><%
    ManageUsersBO objBO = new ManageUsersBO();
    ManageDAO objDAO = new ManageDAO();
    objBO.setEmail(request.getParameter("email"));
    objBO.setFnm(request.getParameter("fnm"));
    objBO.setLnm(request.getParameter("lnm"));
    objBO.setPass(request.getParameter("pass"));
    objBO.setPhoto(request.getParameter("img"));

    objDAO.addUser(objBO);

    out.print("" + objBO.getFlag() + "");%>