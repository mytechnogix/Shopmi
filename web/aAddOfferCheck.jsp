<%@page import="com.quickc.pack.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%@page import="java.util.regex.Pattern"%><%@page import="DAO.ManageDAO"%><%@page import="BO.ManageOfferBO"%><%
    String storeId, offerOn, discount, totalCoupons, tc = "", dates, oid = "", start = "", end = "";
    request.setCharacterEncoding("UTF-8");
    storeId = request.getParameter("offerStoreId");
    offerOn = request.getParameter("offerOn");
    discount = request.getParameter("offerDiscount");
    totalCoupons = request.getParameter("offerCoupons");
    tc = request.getParameter("offerTC");
    oid = request.getParameter("type");
    dates = request.getParameter("bothdates");
    String[] strArray = dates.split(Pattern.quote("-"));
//    String[] sDate = strArray[0].split(Pattern.quote("/"));
//    String[] eDate = strArray[1].split(Pattern.quote("/"));
//
//    start = sDate[2].trim() + "-" + sDate[0].trim() + "-" + sDate[1].trim();
//    end = eDate[2].trim() + "-" + eDate[0].trim() + "-" + eDate[1].trim();

    start = strArray[0].trim();
    end = strArray[1].trim();

    ManageOfferBO objBO = new ManageOfferBO();
    ManageDAO objDAO = new ManageDAO();

    objBO.setDiscountOn(offerOn);
    objBO.setDiscount(discount);
    objBO.setTotalCoupons(totalCoupons);
    objBO.setStartOffer(start);
    objBO.setEndOffer(end);
    objBO.setTc(tc);

    //from storeLogin
    if (oid.equalsIgnoreCase("222")) {
        objBO.setStoreId(storeId);
        objDAO.addOfferDetails(objBO);
        if (objBO.getOid() == 1) {
            String body = "Dear Team MyShejari\n";
            body += "\n<b>New Business Added</b>\n\n";
            body += "Business Name " + objBO.getStoreName() + "\n";
            body += "Offer Title : " + objBO.getDiscount() + "% off on "+objBO.getDiscountOn()+"\n";
            body += "Thanks and Regards";

            Email e = new Email();
            String a[] = {"team@myshejari.com"};
            e.sendFromGMail("care@myshejari.com", "Ankush@02", a, "New Offer Added", body);
            session.setAttribute("sOidAddOffer", objBO.getOid());
            out.print("1");
        } else if (objBO.getOid() == 2) {
            out.print("2");
        } else {
            out.print("0");
        }
    } else if (oid.equalsIgnoreCase("000")) {
        objBO.setStoreId(storeId);
        objDAO.addOfferDetails(objBO);
        if (objBO.getOid() == 1) {
            session.setAttribute("oidAddOffer", objBO.getOid());
            out.print("1");
        } else if (objBO.getOid() == 2) {
            out.print("2");
        } else {
            out.print("0");
        }
    } else {
        objBO.setOid(Integer.parseInt(oid));
        objDAO.updateOfferDetails(objBO);
        if (objBO.getOid() == 1) {
            response.sendRedirect("aManageOffers.jsp");
        } else {
            out.print("Failed to update record");
        }
    }%>