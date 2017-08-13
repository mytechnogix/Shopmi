<%@page import="com.quickc.pack.Email"%>
<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageStoreBO"%>
<%
    String storeCatDdl, storeCatTxt, storeCat = "", storeAreaDdl, storeAreaTxt, storeArea = "", url;
    String lat, longi, storeURL = "", am, pm, phone;

    request.setCharacterEncoding("UTF-8");
    storeCatDdl = request.getParameter("ddlOfferStoreCat");
    storeCatTxt = request.getParameter("txtOfferStoreCat");
    storeAreaDdl = request.getParameter("ddlOfferStoreArea");
    storeAreaTxt = request.getParameter("txtOfferStoreArea");
    am = request.getParameter("txtAM");
    pm = request.getParameter("txtPM");

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
    ManageDAO objDAO = new ManageDAO();
    ManageStoreBO objBO = new ManageStoreBO();

    storeURL = request.getParameter("txtOfferURL");
    phone = request.getParameter("txtOfferPhone");

    if (storeURL.equalsIgnoreCase("")) {
        storeURL = "Not Available";
    }
    if (phone.equalsIgnoreCase("")) {
        phone = "Not Available";
    }
    objBO.setPhone(phone);
    objBO.setUrl(storeURL);

    lat = String.valueOf(session.getAttribute("latitude"));
    longi = String.valueOf(session.getAttribute("longitude"));
    objBO.setStoreName(request.getParameter("txtOfferStoreName"));
    objBO.setMetadata(request.getParameter("txtMetadata"));
    objBO.setStoreNameHindi(request.getParameter("txtOfferStoreNameHindi"));
    objBO.setStoreArea(storeArea);
    objBO.setStoreCat(storeCat);
    objBO.setCity(request.getParameter("txtOfferCity"));
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
            String body = "Dear Team MyShejari\n";
            body += "\n<b>New Business Added</b>\n\n";
            body += "Business Name " + objBO.getStoreName() + "\n";
            body += "Business Type : Store\n";
            body += "Business Location : " + objBO.getStoreArea() + "\n";
            body += "Thanks and Regards";

            Email e = new Email();
            String a[] = {"team@myshejari.com"};
            e.sendFromGMail("care@myshejari.com", "Ankush@02", a, "New Business Added", body);
            session.setAttribute("storeidAdd", objBO.getStoreId());
            response.sendRedirect("aAddStorePhoto.jsp");
        } else {
            out.print("Failed to add store details");
        }
    } else {
        objBO.setStoreId(request.getParameter("storeid"));
        objBO.setPassword(request.getParameter("txtOfferPass"));
        objBO.setAddFlag(false);
        objDAO.updateStoreDetails(objBO);
        if (objBO.isAddFlag()) {
            response.sendRedirect("aManageStores.jsp");
        } else {
            out.print("Failed to add store details");
        }
    }
%>