<style>
    .profile-sidebar {
        padding: 20px 0 10px 0;
        background: #fff;
    }
    .profile-userpic img {
        float: none;
        margin: 0 auto;
        width: 100%;
        height: 100%;
        -webkit-border-radius: 50% !important;
        -moz-border-radius: 50% !important;
        border-radius: 50% !important;
    }

    .profile-usertitle {
        text-align: center;
        margin-top: 20px;
    }

    .profile-usertitle-name {
        color: #5a7391;
        text-transform: uppercase;
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 7px;
    }

    .profile-usertitle-job {
        color: #5b9bd1;
        font-size: 12px;
        font-weight: 600;
        margin-bottom: 15px;
    }

    .profile-userbuttons {
        text-align: center;
        margin-top: 10px;
    }

    .profile-userbuttons .btn {
        text-transform: uppercase;
        font-size: 11px;
        font-weight: 600;
        padding: 6px 15px;
        margin-right: 5px;
    }

    .profile-userbuttons .btn:last-child {
        margin-right: 0px;
    }

    .profile-usermenu {
        margin-top: 30px;
    }

    .profile-usermenu ul li {
        border-bottom: 1px solid #f0f4f7;
    }

    .profile-usermenu ul li:last-child {
        border-bottom: none;
    }

    .profile-usermenu ul li a {
        font-size: 14px;
        font-weight: 400;
    }

    .profile-usermenu ul li a i {
        margin-right: 8px;
        font-size: 14px;
    }

    .profile-usermenu ul li a:hover {
        background-color: #fafcfd;
        color: #5b9bd1;
    }

    .profile-usermenu ul li.active {
        border-bottom: none;
    }

    .profile-usermenu ul li.active a {
        color: #5b9bd1;
        background-color: #f6f9fb;
        border-left: 2px solid #5b9bd1;
        margin-left: -2px;
    }
</style>

<%
    String uid = String.valueOf(session.getAttribute("uid"));
    String fnm = String.valueOf(session.getAttribute("fnm"));
    String lnm = String.valueOf(session.getAttribute("lnm"));
%>
<div class="profile-sidebar">
    <div class="profile-userpic">
        <img src="images/default.jpg" style="width: 100px; height: 100px" class="img-responsive" alt="">
    </div>
    <div class="profile-usertitle">
        <div class="profile-usertitle-name">
            <%=fnm%> <%=lnm%>
        </div>
        <div class="profile-usertitle-job">
            <%=uid%>
        </div>
    </div>
    <div class="profile-userbuttons">
        <button type="button" class="btn btn-primary btn-sm" onclick="showWebPart('md')">Edit Profile</button>
        <button type="button" class="btn btn-warning btn-sm">Change Picture</button>
    </div>
    <div class="profile-usermenu">
        <ul class="nav">
            <li class="active">
                <a href="javascript:showWebPart('mo')" class="mo">
                    <i class="glyphicon glyphicon-gift"></i>
                    My Offers 
                </a>
            </li>
            <li>
                <a href="javascript:showWebPart('mf')" class="mf">
                    <i class="fa fa-thumbs-o-up"></i>
                    Favorites </a>
            </li>
            <li>
                <a href="javascript:showWebPart('mr')" class="mr">
                    <i class="fa fa-comments-o"></i>
                     Reviews </a>
            </li>
            <li>
                <a href="javascript:showWebPart('enq')" class="enq">
                    <i class="fa fa-envelope-o"></i>
                    Enquiries </a>
            </li>
            <li>
                <a href="javascript:showWebPart('md')" class="md">
                    <i class="fa fa-edit"></i>
                    My Details </a>
            </li>
        </ul>
    </div>
</div>
<br>
<br>