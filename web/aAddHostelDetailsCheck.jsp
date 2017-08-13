<%@page import="com.quickc.pack.Email"%>
<%@page import="BO.ManageHostelBO"%><%@page import="DAO.ManageDAO"%><%
    String hostAreaDdl, hostAreaTxt, hostArea = "", url, phone;
    String lat, longi, hostURL = "";
    request.setCharacterEncoding("UTF-8");
    String aid = String.valueOf(session.getAttribute("aid"));
    hostAreaDdl = request.getParameter("ddlHostArea");
    hostAreaTxt = request.getParameter("txtHostArea");

    if (hostAreaDdl.equalsIgnoreCase("Other")) {
        hostArea = hostAreaTxt;
    } else {
        hostArea = hostAreaDdl;
    }
    ManageDAO objDAO = new ManageDAO();
    ManageHostelBO objBO = new ManageHostelBO();
    hostURL = request.getParameter("txtHostURL");
    phone = request.getParameter("txtHostPhone");

    if (hostURL.equalsIgnoreCase("")) {
        hostURL = "Not Available";
    }
    if (phone.equalsIgnoreCase("")) {
        phone = "Not Available";
    }
    objBO.setPhone(phone);
    objBO.setWebsiteUrl(hostURL);

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
    objBO.setAddedBy(aid);
    objBO.setPossession(request.getParameter("ddlHostPossession"));
    objBO.setFurnished(request.getParameter("ddlHostFurnished"));
    objBO.setEmail(request.getParameter("txtHostEmail"));
    objBO.setContact(request.getParameter("txtHostContact"));
    objBO.setAddress(request.getParameter("txtHostFullAddress"));
    objBO.setForWhom(request.getParameter("ddlHostFor"));
    objBO.setHostAreaSqft(request.getParameter("txtHostAreaSqft"));
    objBO.setSubscription(request.getParameter("ddlHostSubs"));
    if (request.getParameter("opType").equals("add")) {
        objBO.setMaplocation(lat + "," + longi);
        objDAO.addHostelDetails(objBO);
        if (objBO.getHostId() != null) {
            String body = "Dear Team MyShejari\n";
            body += "\n<b>New Business Added</b>\n\n";
            body += "Business Name " + objBO.getHostName() + "\n";
            body += "Business Type : Hostel\n";
            body += "Business Location : " + objBO.getHostArea() + "\n";
            body += "Thanks and Regards";

            Email e = new Email();
            String a[] = {"team@myshejari.com"};
            e.sendFromGMail("care@myshejari.com", "Ankush@02", a, "New Business Added", body);

            session.setAttribute("hostidAdd", objBO.getHostId());
            response.sendRedirect("aAddHostelAmenities.jsp");
        } else {
            out.print("Failed to add host details");
        }
    } else {
        request.setCharacterEncoding("UTF-8");
        objBO.setHostId(request.getParameter("hostid"));
        objBO.setPassword(request.getParameter("txtHostPass"));
        objBO.setAddFlag(false);
        objDAO.updateHostelDetails(objBO);
        if (objBO.isAddFlag()) {
            response.sendRedirect("aManageHostels.jsp");
        } else {
            out.print("Failed to add hostel details");
        }
    }%>