<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageStoreBO"%>
<%
    String storeCatDdl, storeCatTxt, storeCat = "", storeAreaDdl, storeAreaTxt, storeArea = "", url;
    String lat, longi, storeURL = "", am, pm;

    request.setCharacterEncoding("UTF-8");
    storeCatDdl = request.getParameter("ddlOfferStoreCat");
    storeCatTxt = request.getParameter("txtOfferStoreCat");
    storeAreaDdl = request.getParameter("ddlOfferStoreArea");
    storeAreaTxt = request.getParameter("txtOfferStoreArea");
    am = request.getParameter("txtAM");
    pm = request.getParameter("txtPM");

    url = request.getParameter("txtOfferURL");

    if (storeAreaDdl.equalsIgnoreCase("Other")) {
        storeArea = storeAreaTxt;
    } else {
        storeArea = storeAreaDdl;
    }
    if (storeCatDdl.equalsIgnoreCase("Other")) {
        storeCat = storeCatTxt;
    } else {
        storeCat = storeCatDdl;
    }
    if (url.equalsIgnoreCase(null) || url.equals("")) {
        storeURL = "NA";
    } else {
        storeURL = url;
    }
    ManageDAO objDAO = new ManageDAO();
    ManageStoreBO objBO = new ManageStoreBO();
    lat = String.valueOf(session.getAttribute("latitude"));
    longi = String.valueOf(session.getAttribute("longitude"));
    objBO.setStoreName(request.getParameter("txtOfferStoreName"));
    objBO.setStoreNameHindi(request.getParameter("txtOfferStoreNameHindi"));
    objBO.setStoreArea(storeArea);
    objBO.setStoreCat(storeCat);
    objBO.setCity(request.getParameter("txtOfferCity"));
    objBO.setUrl(storeURL);
    objBO.setSubs(request.getParameter("ddlOfferSubs"));
    objBO.setWorkingHours(request.getParameter("txtOfferOpenAt") + " " + am + " to " + request.getParameter("txtOfferCloseAt") + " " + pm);
    objBO.setEmail(request.getParameter("txtOfferEmail"));
    objBO.setContact(request.getParameter("txtOfferContact"));
    objBO.setAddress(request.getParameter("txtOfferFullAddress"));
    objBO.setClosedOn(request.getParameter("ddlOfferClosedOn"));
    objBO.setServiceArea(request.getParameter("txtOfferServiceArea"));
    objBO.setServices(request.getParameter("txtOfferServices"));
    objBO.setAddedBy(String.valueOf(session.getAttribute("aid")));
    if (request.getParameter("opType").equals("add")) {
        objBO.setMapLocation(lat + "," + longi);
        objDAO.addStoreDetails(objBO);
        if (objBO.getStoreId() != null && !(objBO.getStoreId().equals(""))) {
            session.setAttribute("storeidAdd", objBO.getStoreId());
            response.sendRedirect("aAddStorePhoto.jsp");
        } else {
            out.print("Failed to add store details");
        }
    } else {
        objBO.setStoreId(request.getParameter("storeid"));
        objBO.setAddFlag(false);
        objDAO.updateStoreDetails(objBO);
        if (objBO.isAddFlag()) {
            response.sendRedirect("aManageStores.jsp");
        } else {
            out.print("Failed to add store details");
        }
    }
%>