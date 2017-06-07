
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Marriage Hall Home</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <style>
            .booked
            {
                background-color: red;
                color: white;
            }
            table
            {
                width: 100%;
            }
            td{
                padding: 8px;
                cursor: pointer;
                text-align: center;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="hHeader.jsp"/>
            <jsp:include page="hSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Book Hall
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Book Hall</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-lg-8 text-center">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <div class="box-title">
                                        Book Date
                                    </div>
                                </div>
                                <div class="box-body">
                                    <form method=post action="hBookHall.jsp">
                                        <select name="month" class="col-lg-4" id="month" style="height: 34px;">
                                            <option value="0">Jan</option>
                                            <option value="1">Feb</option>
                                            <option value="2">March</option>
                                            <option value="3">April</option>
                                            <option value="4">May</option>
                                            <option value="5">Jun</option>
                                            <option value="6">Jul</option>
                                            <option value="7">Aug</option>
                                            <option value="8">Sept</option>
                                            <option value="9">Oct</option>
                                            <option value="10">Nov</option>
                                            <option value="11">Dec</option>
                                        </select>
                                        <select name="year" class=" col-lg-4" id="year" style="height: 34px;">
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
                                        </select>
                                        <input type=submit id="btnDisplay" class="col-lg-4 btn btn-primary" value="Display">
                                    </form>
                                    <%
                                        PreparedStatement pst;
                                        Connection con;
                                        ResultSet rs;
                                        List<Integer> arr = new ArrayList<Integer>();
                                        int cnt = 0;
                                        boolean yyok = false;
                                        int yy = 0, mm = 0;
                                        String yyString = "";
                                        String mmString = "";
                                        int hallid = Integer.parseInt(String.valueOf(session.getAttribute("hallid")));
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            DBConnector dbc = new DBConnector();
                                            con = DriverManager.getConnection(dbc.getConstr());

                                            yyString = request.getParameter("year");
                                            mmString = request.getParameter("month");

                                            session.setAttribute("month", mmString);
                                            session.setAttribute("year", yyString);

                                            if (yyString != null && yyString.length() > 0) {
                                                try {
                                                    yy = Integer.parseInt(yyString);
                                                    mm = Integer.parseInt(mmString);
                                                    yyok = true;
                                                } catch (NumberFormatException e) {
                                                    out.println(" " + mmString + "/" + yyString + " invalid");
                                                }
                                            }

                                            Calendar c = Calendar.getInstance();
                                            if (!yyok) {
                                                yy = c.get(Calendar.YEAR);
                                                mm = c.get(Calendar.MONTH);
                                            }

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
                                    %> 
                                    <br><br>
                                    <table border=1 class="table-responsive">
                                        <%
                                            GregorianCalendar calendar = new GregorianCalendar(yy, mm, 1);
                                        %> 
                                        <tr><th colspan="7" class="text-center"><%= months[mm]%> <%= yy%></tr>
                                        <tr><td>Sun<td>Mon<td>Tue<td>Wed<td>Thu<td>Fri<td>Sat</tr> 
                                        <%
                                            leadGap = calendar.get(Calendar.DAY_OF_WEEK) - 1;
                                            int daysInMonth = dom[mm];
                                            if (calendar.isLeapYear(calendar.get(Calendar.YEAR)) && mm == 1) {
                                                ++daysInMonth;
                                            }
                                            out.print("<tr>");
                                            out.println(" ");
                                            for (int i = 0; i < leadGap; i++) {
                                                out.print("<td> ");
                                            }
                                            for (int i = 1; i <= daysInMonth; i++) {
                                                if (cnt < arr.size()) {
                                                    if (i == arr.get(cnt)) {
                                                        out.print("<td class='booked'>");
                                                        cnt++;
                                                    } else {
                                                        out.print("<td>");
                                                    }
                                                } else {
                                                    cnt = 100;
                                                }
                                                if (cnt == 100) {
                                                    out.print("<td>");
                                                }

                                                out.print(i);
                                                out.print("</td>");
                                                if ((leadGap + i) % 7 == 0) {
                                                    out.println("</tr>");
                                                    out.print("<tr>");
                                                }
                                            }

                                        %>
                                        </tr>
                                    </table>
                                    <br>
                                    <canvas id="myCanvas" width="20" height="10"
                                            style="border:1px solid #000000; background-color:red"> 
                                    </canvas>  Booked Date
                                    <canvas id="myCanvas" width="20" height="10"
                                            style="margin-left: 3px; border:1px solid #000000; background-color:white"> 
                                    </canvas>  Available Date
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <jsp:include page="aSideMenuRight.jsp"/>
            <jsp:include page="aFooterFiles.jsp"/>
        </div>
        <script>
            $('select option[value=<%=mm%>]').attr('selected','selected');
            var tdTxt;
            var gType;
            $( "td" ).click(function() {
                var fire=false;
                var typeOfOp;
                tdTxt = $(this);
                var mm=$('#month :selected').val();
                var dd=$(this).text();
                var yy=$('#year :selected').text();
                
                var isBooked = $(this).hasClass("booked");
                if(isBooked)
                {
                    if (confirm(dd+"/"+mm+"/"+yy+"\nUnbook this date")) {
                        fire=true;
                        typeOfOp="unbook";
                    }
                }
                else{
                    if (confirm("Book this date")) {
                        fire=true;
                        typeOfOp="book";
                    }
                }
                if(fire){
                    bookDate(typeOfOp, dd, mm, yy);
                }
            });
        
            function bookDate(type, dd, mm, yy)
            {
                gType=type;
                if (typeof XMLHttpRequest != "undefined"){
                    xmlHttp= new XMLHttpRequest();
                }
                else if (window.ActiveXObject){
                    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp==null){
                    alert("Browser does not support XMLHTTP Request")
                    return;
                }
                var url="hBookHallCheck.jsp";
                url +="?type="+type+"&dd="+dd+"&mm="+mm+"&yy="+yy;
                xmlHttp.onreadystatechange=bookDateOutput;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
            }
            function bookDateOutput(){
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
                    //alert(xmlHttp.responseText);
                    if(xmlHttp.responseText=="1"){
                        if(gType=="unbook")
                            $(tdTxt).removeClass("booked");
                        if(gType=="book")
                            $(tdTxt).addClass("booked");
                    }
                    else if(xmlHttp.responseText=="0")
                    {
                        alert("failed to update");
                    }
                }
            }
            function GetXmlHttpObject()
            {
                if (window.XMLHttpRequest)
                {
                    return new XMLHttpRequest();
                }
                if (window.ActiveXObject)
                {
                    return new ActiveXObject("Microsoft.XMLHTTP");
                }
                return null;
            }
        </script>
        <%
            } catch (Exception ex) {
                out.print(ex);
            }
        %>
    </body>
</html>
