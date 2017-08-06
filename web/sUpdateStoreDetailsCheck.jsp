<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageStoreBO"%>
<%
    String am, pm;
    ManageDAO objDAO = new ManageDAO();
    ManageStoreBO objBO = new ManageStoreBO();
    request.setCharacterEncoding("UTF-8");
    am = request.getParameter("txtAM");
    pm = request.getParameter("txtPM");
    objBO.setStoreArea(request.getParameter("txtOfferStoreArea"));
    objBO.setStoreCat(request.getParameter("txtOfferStoreCat"));
    objBO.setStoreName(request.getParameter("txtOfferStoreName"));
    objBO.setCity(request.getParameter("txtOfferCity"));
    objBO.setUrl(request.getParameter("txtOfferURL"));
    objBO.setSubs(request.getParameter("ddlOfferSubs"));
    objBO.setWorkingHours(request.getParameter("txtOfferOpenAt") + " " + am + " to " + request.getParameter("txtOfferCloseAt") + " " + pm);
    objBO.setEmail(request.getParameter("txtOfferEmail"));
    objBO.setContact(request.getParameter("txtOfferContact"));
    objBO.setPhone(request.getParameter("txtOfferPhone"));
    objBO.setClosedOn(request.getParameter("ddlOfferClosedOn"));
    objBO.setServiceArea(request.getParameter("txtOfferServiceArea"));
    objBO.setServices(request.getParameter("txtOfferServices"));
    objBO.setAddress(request.getParameter("txtOfferFullAddress"));
    objBO.setStoreId(request.getParameter("storeid"));
    objBO.setAddFlag(false);
    objDAO.sUpdateStoreDetails(objBO);
    if (objBO.isAddFlag()) {
        response.sendRedirect("sDashboard.jsp");
    } else {
        out.print("Failed to add store details");
    }
%>