<%
    String s = request.getParameter("type");
    session.setAttribute("latitude", request.getParameter("txtLat"));
    session.setAttribute("longitude", request.getParameter("txtLong"));
    if (s.equals("stores")) {
        response.sendRedirect("aAddStoreDetails.jsp");
    } else if (s.equals("halls")) {
        response.sendRedirect("aAddHallDetails.jsp");
    }
     else if (s.equals("mes")) {
        response.sendRedirect("aAddMesDetails.jsp");
    }
%>