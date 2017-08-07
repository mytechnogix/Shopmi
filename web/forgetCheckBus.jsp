<%@page import="com.quickc.pack.Email"%><%@page import="java.util.Random"%><%@page import="com.quickc.pack.DBConnector"%><%@page import="java.sql.*"%><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    int cnt = 0;
    String email = request.getParameter("email");
    String type = request.getParameter("type");
    String res = "0", nps = "";
    String a[] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
    String A[] = {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"};
    String no[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};
    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        Random random = new Random();
        int n1 = (Math.abs(random.nextInt()) % 25) + 1;
        int n2 = (Math.abs(random.nextInt()) % 9) + 1;
        nps = ("MS@" + a[n1] + A[n1] + no[n2]);

        String body = "Dear Customer,\n\n";
        body += "Your password recovery is successful\n\n";
        body += "Your new password is : " + nps + "\n\n";
        body += "Please change your password after your first login\n\n";
        body += "Thanks and Regards";
        Email e = new Email();

        if (type.equals("store")) {
            pst = con.prepareStatement("select storename from storedetails where email=?;");
            pst.setString(1, email);
            rs = pst.executeQuery();
            if (rs.next()) {
                String receiver[] = {email};
                e.sendFromGMail("care@myshejari.com", "Ankush@02", receiver, "Password Recovery Successful!", body);

                pst = con.prepareStatement("update storedetails set pass=? where email=?;");
                pst.setString(1, nps);
                pst.setString(2, email);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                res = "2";
            }
        } else if (type.equals("hall")) {
            pst = con.prepareStatement("select hallname from halls where email=?;");
            pst.setString(1, email);
            rs = pst.executeQuery();
            if (rs.next()) {
                String receiver[] = {email};
                e.sendFromGMail("care@myshejari.com", "Ankush@02", receiver, "Password Recovery Successful!", body);

                pst = con.prepareStatement("update halls set pass=? where email=?;");
                pst.setString(1, nps);
                pst.setString(2, email);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                res = "2";
            }
        } else if (type.equals("mes")) {
            pst = con.prepareStatement("select mesname from mes where email=?;");
            pst.setString(1, email);
            rs = pst.executeQuery();
            if (rs.next()) {
                String receiver[] = {email};
                e.sendFromGMail("care@myshejari.com", "Ankush@02", receiver, "Password Recovery Successful!", body);

                pst = con.prepareStatement("update mes set pass=? where email=?;");
                pst.setString(1, nps);
                pst.setString(2, email);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                res = "2";
            }
        } else if (type.equals("hostel")) {
            pst = con.prepareStatement("select hostname from hostel where email=?;");
            pst.setString(1, email);
            rs = pst.executeQuery();
            if (rs.next()) {
                String receiver[] = {email};
                e.sendFromGMail("care@myshejari.com", "Ankush@02", receiver, "Password Recovery Successful!", body);

                pst = con.prepareStatement("update hostel set pass=? where email=?;");
                pst.setString(1, nps);
                pst.setString(2, email);
                cnt = pst.executeUpdate();
                if (cnt > 0) {
                    res = "1";
                }
            } else {
                res = "2";
            }
        }
        con.close();
    } catch (Exception ex) {
        out.print(ex);
    }
    out.print(res);%>