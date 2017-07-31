<%
    if (!String.valueOf(session.getAttribute("hallFlag")).equals("1")) {
%>
<jsp:forward page="businessLogin.jsp"/>
<%    }

    String name = String.valueOf(session.getAttribute("hHallName"));
    String img = String.valueOf(session.getAttribute("hHallPhoto"));
%>
<header class="main-header">
    <a href="hDashboard.jsp" class="logo">
        <span class="logo-mini"><b>MS</b></span>
        <span class="logo-lg"><b>MyShejari</b>.com</span>
    </a>
    <nav class="navbar navbar-static-top" role="navigation">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="images/hallphotos/<%=img%>" class="user-image" alt="User Image">
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="images/hallphotos/<%=img%>" class="img-circle" alt="User Image">
                            <p><%=name%>
                            </p>
                        </li>
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">Change Password</a>
                            </div>
                            <div class="pull-right">
                                <a href="sLogout.jsp" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
            </ul>
        </div>
    </nav>
</header>