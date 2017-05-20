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
        <title>Manage Stores</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="shortcut icon" href="images/logo1_img.png">        
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
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="aHeader.jsp"/>
            <jsp:include page="aSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Manage Stores
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Stores</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12" id="storeDetails">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <a href="aAddStoreLocation.jsp" class="btn-sm btn-primary pull-right">
                                        <i class="fa fa-plus"></i>  Add Store</a>
                                </div>
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>SID</th>
                                                <th>Store Name</th>
                                                <th>Category</th>
                                                <th>Location</th>
                                                <th>Status</th>
                                                <th>Photo</th>
                                                <th>Reg. Date</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String storeName = "", category = "", location = "", city = "", storeStatus;
                                                String regDate = "", img = "";
                                                int cnt = 0, storeid = 0;
                                                PreparedStatement pst;
                                                ResultSet rs;
                                                Connection con;
                                                Class.forName("com.mysql.jdbc.Driver");
                                                DBConnector dbc = new DBConnector();
                                                con = DriverManager.getConnection(dbc.getConstr());
                                                pst = con.prepareStatement("select * from storedetails order by regdate desc");
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    cnt++;
                                                    storeid = rs.getInt("storeid");
                                                    storeName = rs.getString("storename");
                                                    category = rs.getString("category");
                                                    location = rs.getString("storearea");
                                                    city = rs.getString("city");
                                                    storeStatus = rs.getString("storestatus");
                                                    regDate = rs.getString("regdate");
                                                    img = rs.getString("photo");
                                            %>
                                            <tr>
                                                <td><%=storeid%></td>
                                                <td class="text-blue" style="cursor: pointer"><a href="aStoreDetails.jsp?id=<%=storeid%>"><%=storeName%></a></td>
                                                <td><%=category%></td>
                                                <td><%=location%>, <%=city%></td>
                                                <td><a href="JavaScript:changeStatus('<%=storeid%>','<%=storeStatus%>','store')"><%=storeStatus%></a></td>
                                                <td class="text-blue"><%=img%></td>
                                                <td><%=regDate%></td>
                                                <td>
                                                    <a href="JavaScript:del('<%=storeid%>','store')" style="margin-left: 7px">
                                                        <i class="fa fa-trash-o"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>SID</th>
                                                <th>Store Name</th>
                                                <th>Category</th>
                                                <th>Location</th>
                                                <th>Status</th>
                                                <th>Photo</th>
                                                <th>Reg. Date</th>
                                                <th>Actions</th>
                                            </tr>
                                        </tfoot>
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
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
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
            
            $("table tr").on("click","td:nth-child(6)",function () {
                var sid = $(this).siblings(":nth-child(1)").text();
                var td6 = $(this).text();
                $("#storeDetails").addClass("col-lg-8");
                $("#picPath").attr("href","aAddStorePhoto.jsp?sid="+sid);
                $(".setImage").html("<img src='images/storephotos/"+td6+"' class='preview'>");
                $("#imgPreviewName").text(td6);
                $(".imgPreview").show();
            });
        </script>
    </body>
</html>
