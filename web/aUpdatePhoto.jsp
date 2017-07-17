<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Update Photo</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <%
            String storeid = request.getParameter("sid");
            String type = request.getParameter("type");
            String imgCount = request.getParameter("img");

            session.setAttribute("sid", storeid);
            session.setAttribute("imgCount", imgCount);
            session.setAttribute("type", type);
        %>
        <div class="wrapper">
            <jsp:include page="aHeader.jsp"/>
            <jsp:include page="aSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Update Photo <%=imgCount%>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Store</li>
                        <li class="active">Add New Store</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <form role="form" ENCTYPE="multipart/form-data" onsubmit="return submitCheck()" action="aUpdatePhotoCheck.jsp" method="post">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label> Select Photo</label>
                                                <input type="file" name="file" id="file" onchange="fileCheck(this)" required>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                            <button type="submit" class="btn btn-primary">Upload</button>
                                            <input type="reset" value="Reset" class="btn btn-primary">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <jsp:include page="aSideMenuRight.jsp"/>
            <jsp:include page="aFooterFiles.jsp"/>
        </div>
    </body>
</html>