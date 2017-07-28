<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageHallBO"%>
<%
    String hallAreaDdl, hallAreaTxt, hallArea = "", url, email;
    String lat, longi, hallURL = "";

    request.setCharacterEncoding("UTF-8");
    hallAreaDdl = request.getParameter("ddlHallArea");
    hallAreaTxt = request.getParameter("txtHallArea");
    email = request.getParameter("txtHallEmail");

    if (hallAreaDdl.equalsIgnoreCase("Other")) {
        hallArea = hallAreaTxt;
    } else {
        hallArea = hallAreaDdl;
    }
    ManageDAO objDAO = new ManageDAO();
    ManageHallBO objBO = new ManageHallBO();
    lat = String.valueOf(session.getAttribute("latitude"));
    longi = String.valueOf(session.getAttribute("longitude"));
    objBO.setHallName(request.getParameter("txtHallName"));
    objBO.setHallNameHindi(request.getParameter("txtHallNameHindi"));
    objBO.setHallArea(hallArea);
    objBO.setHallAreaSqft(Integer.parseInt(request.getParameter("txtHallAreaSqft")));
    objBO.setCity(request.getParameter("txtHallCity"));
    objBO.setMetadata(request.getParameter("txtHallMetadata"));
    objBO.setUrl(request.getParameter("txtHallURL"));
    objBO.setSubType(request.getParameter("ddlHallSubs"));
    objBO.setEmail(email);
    objBO.setContact(request.getParameter("txtHallContact"));
    objBO.setAddress(request.getParameter("txtHallFullAddress"));
    objBO.setHallServices(request.getParameter("txtHallServices"));
    objBO.setAddedBy(String.valueOf(session.getAttribute("aid")));
    if (request.getParameter("opType").equals("add")) {
        objBO.setMapLocation(lat + "," + longi);
        objDAO.addHallDetails(objBO);
        if (objBO.getHallId()!= null) {
            session.setAttribute("hallidAdd", objBO.getHallId());
            response.sendRedirect("aAddHallPhoto.jsp");
        } else {
            out.print("Failed to add hall details");
        }
    } else {
        objBO.setHallId(request.getParameter("hallid"));
        objBO.setAddFlag(false);
        objDAO.updateHallDetails(objBO);
        if (objBO.isAddFlag()) {
            response.sendRedirect("aManageHalls.jsp");
        } else {
            out.print("Failed to add hall details");
        }
    }
%>