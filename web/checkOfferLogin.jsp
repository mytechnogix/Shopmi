<%
if (!String.valueOf(session.getAttribute("flag")).equals("1")) {
        out.print("0");
    } else {
        out.print("1");
    }
%>