<%@page import="com.quickc.pack.Email"%><%@page import="java.util.Random"%><%@page import="java.sql.*"%><%@page import="com.quickc.pack.DBConnector"%><%
    PreparedStatement pst;
    ResultSet rs;
    Connection con;
    String email, nps = "";
    String res = "0";
    try {
        String a[] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
        String A[] = {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"};
        String no[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};
        email = request.getParameter("id");
        System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + email);
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());
        pst = con.prepareStatement("select fnm from users where email=? and status='Active';");
        pst.setString(1, email);
        rs = pst.executeQuery();
        if (rs.next()) {
            Random random = new Random();
            int n1 = (Math.abs(random.nextInt()) % 25) + 1;
            int n2 = (Math.abs(random.nextInt()) % 9) + 1;
            nps = ("MS@" + a[n1] + A[n1] + no[n2]);



            String body = "Dear Customer,\n\n";
            body += "Your password recovery is successful\n\n";
            body += "Your new temporary password is : " + nps + "\n\n";
            body += "Please change your password after your first login\n\n";
            body += "Thanks and Regards";

            Email e = new Email();
            String receiver[] = {email};
            e.sendFromGMail("service@myshejari.com", "MyShejari@123", receiver, "Password Recovery Successful!", body);

            pst = con.prepareStatement("update users set pass=? where email=?;");
            pst.setString(1, nps);
            pst.setString(2, email);
            pst.executeUpdate();

            res = "1";
        } else {
            res = "2";
        }
        con.close();
        out.print(res);
    } catch (Exception e) {
        res = "0";
    }%>