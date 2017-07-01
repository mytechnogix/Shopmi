<%@page import="BO.ManageHostelBO"%>
<%@page import="DAO.ManageDAO"%>
<%
    String hostAreaDdl, hostAreaTxt, hostArea = "", url;
    String lat, longi, hostURL = "";
    String aid = String.valueOf(session.getAttribute("aid"));
    request.setCharacterEncoding("UTF-8");
    hostAreaDdl = request.getParameter("ddlHostArea");
    hostAreaTxt = request.getParameter("txtHostArea");

    url = request.getParameter("txtHostURL");

    if (hostAreaDdl.equalsIgnoreCase("Other")) {
        hostArea = hostAreaTxt;
    } else {
        hostArea = hostAreaDdl;
    }
    if (url.equalsIgnoreCase(null) || url.equals("")) {
        hostURL = "NA";
    } else {
        hostURL = url;
    }
    ManageDAO objDAO = new ManageDAO();
    ManageHostelBO objBO = new ManageHostelBO();
    lat = String.valueOf(session.getAttribute("latitude"));
    longi = String.valueOf(session.getAttribute("longitude"));
    objBO.setHostName(request.getParameter("txtHostName"));
    objBO.setHostNameHindi(request.getParameter("txtHostNameHindi"));
    objBO.setHostArea(hostArea);
    objBO.setRent(request.getParameter("txtHostRent"));
    objBO.setDeposit(request.getParameter("txtHostDeposit"));
    objBO.setCity(request.getParameter("txtHostCity"));
    objBO.setMetadata(request.getParameter("txtHostMetadata"));
    objBO.setBedrooms(request.getParameter("txtHostBedrooms"));
    objBO.setBeds(request.getParameter("txtHostBeds"));
    objBO.setDescription(request.getParameter("txtHostDesc"));
    objBO.setWebsiteUrl(hostURL);
    objBO.setAddedBy(aid);
    //objBO.setSubs(request.getParameter("ddlOfferSubs"));
    objBO.setPossession(request.getParameter("ddlHostPossession"));
    objBO.setFurnished(request.getParameter("ddlHostFurnished"));

    objBO.setEmail(request.getParameter("txtHostEmail"));
    objBO.setContact(request.getParameter("txtHostContact"));
    objBO.setAddress(request.getParameter("txtHostFullAddress"));
    objBO.setForWhom(request.getParameter("ddlHostFor"));
    objBO.setHostAreaSqft(request.getParameter("txtHostAreaSqft"));
    if (request.getParameter("opType").equals("add")) {
        objBO.setMaplocation(lat + "," + longi);
        objDAO.addHostelDetails(objBO);
        if (objBO.getHostId() != 0) {
            session.setAttribute("hostidAdd", objBO.getHostId());
            response.sendRedirect("aAddHostelAmenities.jsp");
        } else {
            out.print("Failed to add host details");
        }
    } else {
        objBO.setHostId(Integer.parseInt(request.getParameter("hostid")));
        objBO.setAddFlag(false);
        objDAO.updateHostelDetails(objBO);
        if (objBO.isAddFlag()) {
            response.sendRedirect("aManageHostels.jsp");
        } else {
            out.print("Failed to add hostel details");
        }
    }
%>