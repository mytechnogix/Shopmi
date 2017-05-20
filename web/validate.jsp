<%@page import="DAO.ManageDAO"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    </head>
    <body>
        <%
            ManageDAO objDAO = new ManageDAO();
            out.println("<br/>Encrypted Password     :    " + request.getParameter("p"));
            out.println("<br/>Salt                 :    " + request.getParameter("s"));
            out.println("<br/>IV                     :    " + request.getParameter("i"));
            out.println("<br/>Key                 :    " + session.getAttribute("RANDKEY"));
            out.println("<br/>Original Password     :    " + objDAO.decryptAESEncryptWithSaltAndIV(request.getParameter("p"), session.getAttribute("RANDKEY").toString(), request.getParameter("s"), request.getParameter("i")));
        %>
    </body>
</html>
