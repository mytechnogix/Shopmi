<%@page import="DAO.ManageDAO"%>
<%@page import="BO.ManageStoreBO"%>
<%
    ManageDAO objDAO = new ManageDAO();
    ManageStoreBO objBO = new ManageStoreBO();
    String url = request.getParameter("website").trim();
    String phone = request.getParameter("phone").trim();
    if (url.equals("")) {
        objBO.setUrl("Not Available");
    } else {
        objBO.setUrl(url);
    }
    if (phone.equals("")) {
        objBO.setPhone("Not Available");
    } else {
        objBO.setPhone(phone);
    }
    objBO.setCity(request.getParameter("city"));
    objBO.setStoreName(request.getParameter("businessName"));
    objBO.setStoreArea(request.getParameter("area"));
    objBO.setStoreCat(request.getParameter("type"));
    objBO.setServices(request.getParameter("services"));
    objBO.setEmail(request.getParameter("email"));
    objBO.setContact(request.getParameter("mob"));
    objBO.setAddress(request.getParameter("address"));

    objDAO.addBusinessDetails(objBO);
    if (objBO.getStoreId().equals("1")) {
        response.sendRedirect("registerBusinessSuccess.jsp");
    } else if (objBO.getStoreId().equals("2")) {
        out.print("Store already registered with this email id");
    } else {
        out.print("Something went wrong");
    }%>