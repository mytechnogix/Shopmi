<%@page import="com.quickc.pack.DBConnector"%><%@page import="java.util.*,java.text.*,java.sql.*" %><%
    PreparedStatement pst;
    Connection con;
    ResultSet rs;
    List<Integer> arr = new ArrayList<Integer>();
    int cnt = 0;
    String res = "";
    int yy = 0, mm = 0;
    String yyString = "";
    String mmString = "";
    int hallid = Integer.parseInt(request.getParameter("hallid"));
    try {
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr());

        yyString = request.getParameter("year");
        mmString = request.getParameter("month");

        yy = Integer.parseInt(yyString);
        mm = Integer.parseInt(mmString);

        pst = con.prepareStatement("select dd from bookedhall where hallid=? and mm=? and yy=? order by dd");
        pst.setInt(1, hallid);
        pst.setInt(2, mm);
        pst.setInt(3, yy);
        rs = pst.executeQuery();
        while (rs.next()) {
            arr.add(rs.getInt("dd"));
        }
        Collections.sort(arr);
        String[] months = {
            "January", "February", "March", "April",
            "May", "June", "July", "August",
            "September", "October", "November", "December"
        };
        int dom[] = {
            31, 28, 31, 30,
            31, 30, 31, 31,
            30, 31, 30, 31
        };
        int leadGap = 0;
        res = "<table border=1 style='text-align:center'>";

        GregorianCalendar calendar = new GregorianCalendar(yy, mm, 1);
        res += "<tr><th colspan='7' style='text-align:center'>" + months[mm] + " - " + yy + "</tr>";
        res += "<tr><td>Sun<td>Mon<td>Tue<td>Wed<td>Thu<td>Fri<td>Sat</tr>";

        leadGap = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        int daysInMonth = dom[mm];
        if (calendar.isLeapYear(calendar.get(Calendar.YEAR)) && mm == 1) {
            ++daysInMonth;
        }
        res += "<tr>";
        out.println(" ");
        for (int i = 0; i < leadGap; i++) {
            res += "<td>";
        }
        for (int i = 1; i <= daysInMonth; i++) {
            if (cnt < arr.size()) {
                if (i == arr.get(cnt)) {
                    res += "<td class='booked'>";
                    cnt++;
                } else {
                    res += "<td>";
                }
            } else {
                cnt = 100;
            }
            if (cnt == 100) {
                res += "<td>";
            }
            res += i;
            res += "</td>";
            if ((leadGap + i) % 7 == 0) {
                res += "</tr>";
                res += "<tr>";
            }
        }
        res += "</tr></table>";
        out.print(res);
    } catch (Exception ex) {
        out.print(ex);
    }%>
