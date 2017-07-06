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
        <title>Manage Marriage Halls</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="shortcut icon" href="images/logo1_img.png">        
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <style>
            .imgPreview
            {
                display: none;
            }
            .preview
            {
                width: 300px;
                height: 200px;
            }
            tr td:nth-child(2),tr td:nth-child(5),tr td:nth-child(6){
                cursor: pointer;
            }
            tr td:nth-child(2)
            {
                max-width: 150px;
                height: auto;
                overflow: hidden;
            }
        </style>
    </head>
    <%
        String adminRole = String.valueOf(session.getAttribute("adminRole"));
    %>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="aHeader.jsp"/>
            <jsp:include page="aSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Manage Marriage Halls
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Marriage Halls</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12" id="storeDetails">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <a href="aAddStoreLocation.jsp?type=halls" class="btn-sm btn-primary pull-right">
                                        <i class="fa fa-plus"></i>  Add Marriage Hall</a>
                                </div>
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>HID</th>
                                                <th>Hall Name</th>
                                                <th>Location</th>
                                                <th>Status</th>
                                                <th>Photo</th>
                                                <th>Reg. Date</th>
                                                <%
                                                    if (adminRole.equalsIgnoreCase("platinum")) {
                                                %>
                                                <th>Actions</th>
                                                <%}%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String hallName = "", location = "", city = "", status = "";
                                                String regDate = "", img = "";
                                                int cnt = 0, hallid = 0;
                                                PreparedStatement pst;
                                                ResultSet rs;
                                                Connection con;
                                                Class.forName("com.mysql.jdbc.Driver");
                                                DBConnector dbc = new DBConnector();
                                                con = DriverManager.getConnection(dbc.getConstr());
                                                pst = con.prepareStatement("select * from halls order by regdate desc");
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    cnt++;
                                                    hallid = rs.getInt("hallid");
                                                    hallName = rs.getString("hallname");
                                                    location = rs.getString("hall_area");
                                                    city = rs.getString("city");
                                                    status = rs.getString("status");
                                                    regDate = rs.getString("regdate");
                                                    img = rs.getString("photo");
                                            %>
                                            <tr>
                                                <td><%=hallid%></td>
                                                <%
                                                    if (adminRole.equalsIgnoreCase("platinum") || adminRole.equalsIgnoreCase("gold")) {
                                                %>
                                                <td class="text-blue" style="cursor: pointer"><a href="aHallDetails.jsp?hid=<%=hallid%>"><%=hallName%></a></td>
                                                <%} else {
                                                %>
                                                <td><%=hallName%></td>
                                                <%}%>                                            
                                                <td><%=location%>, <%=city%></td>
                                                <td><a href="JavaScript:changeStatus('<%=hallid%>','<%=status%>','hall')"><%=status%></a></td>
                                                <td class="text-blue"><%=img%></td>
                                                <td><%=regDate%></td>
                                                <%
                                                    if (adminRole.equalsIgnoreCase("platinum")) {
                                                %>
                                                <td>
                                                    <a href="JavaScript:del('<%=hallid%>','hall')" style="margin-left: 7px">
                                                        <i class="fa fa-trash-o"></i>
                                                    </a>
                                                </td>
                                                <%}%>
                                            </tr>
                                            <%}
                                                con.close();
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 imgPreview">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Image Preview</h3>
                                    <small class="pull-right"><a id="picPath" href="#">Change Picture</a></small>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-4 setImage">
                                        </div>
                                    </div>
                                </div>   
                                <div class="box-footer clearfix no-border">
                                    <span id="imgPreviewName"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <jsp:include page="aSideMenuRight.jsp"/>
        </div>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="plugins/fastclick/fastclick.js"></script>
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="js/custom.js"></script>
        <script>
            $(function () {
                $("#example1").DataTable();
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                });
            });
            
            $("table tr").on("click","td:nth-child(5)",function () {
                var hid = $(this).siblings(":nth-child(1)").text();
                var td5 = $(this).text();
                $("#storeDetails").addClass("col-lg-8");
                $("#picPath").attr("href","aAddHallPhoto.jsp?hid="+hid);
                $(".setImage").html("<img src='images/hallphotos/"+td5+"' class='preview'>");
                $("#imgPreviewName").text(td5);
                $(".imgPreview").show();
            });
        </script>
    </body>
</html>
