<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageMesBO"%>
<%
    String mesAreaDdl, mesAreaTxt, mesArea = "", url;
    String lat, longi, mesURL = "", amLunch, pmLunch, amDinner, pmDinner;

    request.setCharacterEncoding("UTF-8");
    mesAreaDdl = request.getParameter("ddlMesArea");
    mesAreaTxt = request.getParameter("txtMesArea");
    amLunch = request.getParameter("txtLunchAM");
    pmLunch = request.getParameter("txtLunchPM");
    amDinner = request.getParameter("txtDinnerAM");
    pmDinner = request.getParameter("txtDinnerAM");

    if (mesAreaDdl.equalsIgnoreCase("Other")) {
        mesArea = mesAreaTxt;
    } else {
        mesArea = mesAreaDdl;
    }
    ManageDAO objDAO = new ManageDAO();
    ManageMesBO objBO = new ManageMesBO();
    lat = String.valueOf(session.getAttribute("latitude"));
    longi = String.valueOf(session.getAttribute("longitude"));
    objBO.setMesName(request.getParameter("txtMesName"));
    objBO.setMesNameHindi(request.getParameter("txtMesNameHindi"));
    objBO.setMesArea(mesArea);
    objBO.setCity(request.getParameter("txtMesCity"));
    objBO.setMetadata(request.getParameter("txtMesMetadata"));
    objBO.setHomeDelivery(request.getParameter("ddlMesHomeDelivery"));
    objBO.setUrl(request.getParameter("txtMesURL"));
    objBO.setSubType(request.getParameter("ddlMesSubs"));
    objBO.setLunchTime(request.getParameter("txtMesLunchStart") + " " + amLunch + " to " + request.getParameter("txtMesLunchEnd") + " " + pmLunch);
    objBO.setDinnerTime(request.getParameter("txtMesDinnerStart") + " " + amDinner + " to " + request.getParameter("txtMesDinnerEnd") + " " + pmDinner);
    objBO.setEmail(request.getParameter("txtMesEmail"));
    objBO.setContact(request.getParameter("txtMesContact"));
    objBO.setAddress(request.getParameter("txtMesFullAddress"));
    objBO.setClosedOn(request.getParameter("ddlMesClosedOn"));
    objBO.setServiceArea(request.getParameter("txtMesServiceArea"));
    objBO.setServices(request.getParameter("txtMesServices"));
    objBO.setAddedBy(String.valueOf(session.getAttribute("aid")));
    if (request.getParameter("opType").equals("add")) {
        objBO.setMapLocation(lat + "," + longi);
        objDAO.addMesDetails(objBO);
        if (objBO.getMesId() != null) {
            session.setAttribute("mesidAdd", objBO.getMesId());
            response.sendRedirect("aAddMesPhoto.jsp");
        } else {
            out.print("Failed to add mes details");
        }
    } else {
        objBO.setMesId(request.getParameter("mesid"));
        objBO.setAddFlag(false);
        objDAO.updateMesDetails(objBO);
        if (objBO.isAddFlag()) {
            response.sendRedirect("aManageMes.jsp");
        } else {
            out.print("Failed to add mes details");
        }
    }
%>