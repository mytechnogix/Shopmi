<%@page import="java.io.File"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    int cnt = 0;
    String imgName = "";
    String type = request.getParameter("type");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        String originalFileAbsolute;
        if (type.equals("offer")) {
            String oid = request.getParameter("id");
            String OriginalFile = "/images/offerphotos/";

            pst = con.prepareStatement("select offerimg from offers where oid=?");
            pst.setString(1, oid);
            rs = pst.executeQuery();
            while (rs.next()) {
                imgName = rs.getString("offerimg");
            }
            originalFileAbsolute = getServletContext().getRealPath(OriginalFile);

            File file1 = new File(originalFileAbsolute + "/" + imgName);
            file1.delete();
            pst = con.prepareStatement("delete from offers where oid=?;");
            pst.setString(1, oid);
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (type.equals("store")) {

            String storeid = request.getParameter("id");
            String OriginalFile = "/images/storephotos/";

            pst = con.prepareStatement("select photo from storedetails where storeid=?");
            pst.setString(1, storeid);
            rs = pst.executeQuery();
            while (rs.next()) {
                imgName = rs.getString("photo");
            }
            originalFileAbsolute = getServletContext().getRealPath(OriginalFile);

            File file1 = new File(originalFileAbsolute + "/" + imgName);
            file1.delete();
            pst = con.prepareStatement("delete from storedetails where storeid=?;");
            pst.setString(1, storeid);
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (type.equals("advertise")) {

            int aid = Integer.parseInt(request.getParameter("id"));
            String OriginalFile = "/images/advphotos/";

            pst = con.prepareStatement("select advimg from advertise where aid=?");
            pst.setInt(1, aid);
            rs = pst.executeQuery();
            while (rs.next()) {
                imgName = rs.getString("advimg");
            }
            originalFileAbsolute = getServletContext().getRealPath(OriginalFile);

            File file1 = new File(originalFileAbsolute + "/" + imgName);
            file1.delete();
            pst = con.prepareStatement("delete from advertise where aid=?;");
            pst.setInt(1, aid);
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (type.equals("hall")) {

            int aid = Integer.parseInt(request.getParameter("id"));
            String OriginalFile = "/images/hallphotos/";

            pst = con.prepareStatement("select photo from halls where hallid=?");
            pst.setInt(1, aid);
            rs = pst.executeQuery();
            while (rs.next()) {
                imgName = rs.getString("photo");
            }
            originalFileAbsolute = getServletContext().getRealPath(OriginalFile);

            File file1 = new File(originalFileAbsolute + "/" + imgName);
            file1.delete();
            pst = con.prepareStatement("delete from halls where hallid=?;");
            pst.setInt(1, aid);
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (type.equals("mes")) {

            int aid = Integer.parseInt(request.getParameter("id"));
            String OriginalFile = "/images/mesphotos/";

            pst = con.prepareStatement("select photo from mes where mesid=?");
            pst.setInt(1, aid);
            rs = pst.executeQuery();
            while (rs.next()) {
                imgName = rs.getString("photo");
            }
            originalFileAbsolute = getServletContext().getRealPath(OriginalFile);

            File file1 = new File(originalFileAbsolute + "/" + imgName);
            file1.delete();
            pst = con.prepareStatement("delete from mes where mesid=?;");
            pst.setInt(1, aid);
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                out.print("1");
            } else {
                out.print("0");
            }
        }
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }%>