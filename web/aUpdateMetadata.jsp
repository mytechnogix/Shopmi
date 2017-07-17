<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.*"%>
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
            String storeid = request.getParameter("id");
            String type = request.getParameter("type");
            String metadata = "";
            int cnt = 0;
            PreparedStatement pst;
            ResultSet rs;
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("select metadata from search where id=? and type=?");
            pst.setString(1, storeid);
            pst.setString(2, type);
            rs = pst.executeQuery();
            while (rs.next()) {
                metadata = rs.getString("metadata");
            }
        %>
        <div class="wrapper">
            <jsp:include page="aHeader.jsp"/>
            <jsp:include page="aSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Update Metadata
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Store</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <form class="form-horizontal" role="form" action="aUpdateMetadataCheck.jsp" method="post">
                                        <input type="hidden" name="id" value="<%=storeid%>">
                                        <input type="hidden" name="type" value="<%=type%>">
                                        <div class="box-body">
                                            <label> Metadata</label>
                                            <div class="form-group">
                                                <textarea name="metadata" style="width: 90%;" rows="5" placeholder="Enter Metadata" required>
                                                    <%=metadata%>
                                                </textarea>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                            <button type="submit" class="btn btn-primary">Update</button>
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