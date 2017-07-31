<%
    if (!String.valueOf(session.getAttribute("storeFlag")).equals("1")) {
%>
<jsp:forward page="businessLogin.jsp"/>
<%    }

    String name = String.valueOf(session.getAttribute("sStoreName"));
    String img = String.valueOf(session.getAttribute("sStorePhoto"));

    if (img.contains("default.jpg")) {
        img = "shopIcon_sm.png";
    }
%>
<header class="main-header">
    <a href="sDashboard.jsp" class="logo">
        <span class="logo-mini">MS</span>
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
                        <img src="images/storephotos/<%=img%>" class="user-image" alt="Store Photo">
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header">
                            <img src="images/storephotos/<%=img%>" class="img-circle" alt="Store Photo">
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
            </ul>
        </div>
    </nav>
</header>