<%@page import="BO.ManageAdvBO"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="DAO.ManageDAO"%><%
    String storeId, advDesc, advTitle, tc = "", dates, start = "", end = "", type = "", subtype="";
    storeId = request.getParameter("advStoreId");
    advTitle = request.getParameter("advTitle");
    advDesc = request.getParameter("advDesc");
    tc = request.getParameter("advTC");
    type = request.getParameter("type");
    dates = request.getParameter("bothdates");
    subtype = request.getParameter("advSubtype");
    String[] strArray = dates.split(Pattern.quote("-"));
    //String[] sDate = strArray[0].split(Pattern.quote("/"));
    //String[] eDate = strArray[1].split(Pattern.quote("/"));
    //start = sDate[2].trim() + "-" + sDate[0].trim() + "-" + sDate[1].trim();
    //end = eDate[2].trim() + "-" + eDate[0].trim() + "-" + eDate[1].trim();

    start = strArray[0].trim();
    end = strArray[1].trim();

    ManageAdvBO objBO = new ManageAdvBO();
    ManageDAO objDAO = new ManageDAO();

    objBO.setStoreId(storeId);
    objBO.setStartAdv(start);
    objBO.setEndAdv(end);
    objBO.setAdvTitle(advTitle);
    objBO.setAdvDesc(advDesc);
    objBO.setSubType(subtype);
    objBO.setTc(tc);
    if (type.equals("sAdd")) {
        objDAO.addAdvertiseDetails(objBO);
        if (objBO.getAid() != 0) {
            response.sendRedirect("sAdvertiseDetails.jsp");
        } else {
            out.print("Failed to add advertise details");
        }
    } else if (type.equals("add")) {
        objDAO.addAdvertiseDetails(objBO);
        if (objBO.getAid() != 0) {
            session.setAttribute("aidPhoto", objBO.getAid());
            response.sendRedirect("aAddAdvPhoto.jsp");
        } else {
            out.print("Failed to add advertise details");
        }
    } else {
        objBO.setAid(Integer.parseInt(request.getParameter("aid")));
        objDAO.updateAdvertiseDetails(objBO);
        if (objBO.getAid() != 0) {
            response.sendRedirect("aManageAdv.jsp");
        } else {
            out.print("Failed to update advertise details");
        }
    }
%>