<%
    String name = String.valueOf(session.getAttribute("adminName"));
    String img = String.valueOf(session.getAttribute("adminImg"));
    String adminRole = String.valueOf(session.getAttribute("adminRole"));
%>
<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><%=name%></p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="active treeview">
                <a href="aDashboard.jsp">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-files-o"></i>
                    <span>Manage Services</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="aManageStores.jsp"><i class="fa fa-circle-o"></i> Manage Shops</a></li>
                    <li><a href="aManageHalls.jsp"><i class="fa fa-circle-o"></i> Manage Party Halls</a></li>
                    <li><a href="aManageMes.jsp"><i class="fa fa-circle-o"></i> Manage Mes</a></li>
                    <li><a href="aManageHostels.jsp"><i class="fa fa-circle-o"></i> Manage Hostels</a></li>
                </ul>
            </li>
            <li>
                <a href="aManageOffers.jsp">
                    <i class="fa fa-files-o"></i>
                    <span>Manage Offers</span>
                </a>
            </li>
            <li>
                <a href="aManageAdv.jsp">
                    <i class="fa fa-files-o"></i>
                    <span>Manage Advertisements</span>
                </a>
            </li>
            <%
                if (adminRole.equalsIgnoreCase("Platinum")) {
            %>
            <li>
                <a href="aManageSite.jsp">
                    <i class="fa fa-files-o"></i>
                    <span>Manage Site</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-files-o"></i>
                    <span>Manage Access</span>
                </a>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>Manage Logs</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="aSiteLogs.jsp"><i class="fa fa-circle-o"></i> Site Logs</a></li>
                    <li><a href="aUserLogs.jsp"><i class="fa fa-circle-o"></i> User Logs</a></li>
                    <li><a href="aStoreLogs.jsp"><i class="fa fa-circle-o"></i> Store Logs</a></li>
                    <li><a href="aAdminLogs.jsp"><i class="fa fa-circle-o"></i> Admin Logs</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-laptop"></i>
                    <span>Manage Issues</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="aIssuesPending.jsp"><i class="fa fa-circle-o"></i> Pending</a></li>
                    <li><a href="aIssuesResolved.jsp"><i class="fa fa-circle-o"></i> Resolved</a></li>
                </ul>
            </li>
            <li>
                <a href="aEnquiries.jsp">
                    <i class="fa fa-edit"></i> <span>Enquiries</span>
                </a>
            </li>
            <%                }
            %>
            <li>
                <a href="aIntruderAlert.jsp">
                    <i class="fa fa-calendar"></i> 
                    <span>Intruder Alert
                        <small class="label pull-right bg-red">3</small>
                    </span>
                </a>
            </li>
        </ul>
    </section>
</aside>