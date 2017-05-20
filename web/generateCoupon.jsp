<%@page import="DAO.ManageDAO"%><%@page import="BO.ManageOfferBO"%><%
    String oid = request.getParameter("oid");
    String storeid = request.getParameter("sid");
    String ret = "0";
    String uid = String.valueOf(session.getAttribute("uid"));
    if (oid != null) {
        ManageOfferBO objBO = new ManageOfferBO();
        ManageDAO objDAO = new ManageDAO();

        objBO.setOid(Integer.parseInt(oid));
        objBO.setStoreId(storeid);
        objBO.setUid(uid);
        objBO.setCid(0);

        objDAO.getOffer(objBO);

        if (objBO.getCoupon() != null) {
            ret = objBO.getCoupon();
        }
//        else if (objBO.getCoupon().equals("2")) {
//            ret = "2";
//        } else if (objBO.getCoupon().equals("3")) {
//            ret = "3";
//        } 
        else {
            ret = "0";
        }
    } else {
        ret = "0";
    }
    out.print(ret);%>