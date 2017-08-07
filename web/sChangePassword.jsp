<%
    String storeid = String.valueOf(session.getAttribute("sStoreid"));
    if (storeid == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Change Password</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="sHeader.jsp"/>
            <jsp:include page="sSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Change Password
                    </h1>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-10">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <input type="hidden" id="uEmail" value="<%=storeid%>">
                                    <div class="form-group has-feedback">
                                        <input type="password" class="form-control" name="psw" id="uPass" placeholder="Current Password" required="required">
                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="password" class="form-control" name="npsw" id="uNPass" placeholder="New Password" required="required">
                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>                                        
                                    <div class="form-group has-feedback">
                                        <input type="password" class="form-control" name="ncpsw" id="uCPass" placeholder=" Confirm New Password" required="required">
                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>
                                    <button type="submit" id="subButton" class="btn btn-primary pull-left" onclick="uChangePassCheck('store')">Submit</button>
                                    <button class="btn btn-primary pull-left" style="margin-left: 5px;" onclick="history.back()">Back</button>
                                    <br><br>
                                    <div id="changeError" class="text-red"></div>
                                    <div id="changeSuccess" class="text-green"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <jsp:include page="aFooterFiles.jsp"/>
        </div>
    </body>
</html>
