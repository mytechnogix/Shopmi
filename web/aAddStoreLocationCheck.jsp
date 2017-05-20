<%
    session.setAttribute("latitude", request.getParameter("txtLat"));
    session.setAttribute("longitude", request.getParameter("txtLong"));
    response.sendRedirect("aAddStoreDetails.jsp");
%>