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
        <title>Uploaded Photos</title>
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
            tr td:nth-child(2){
                cursor: pointer;
            }
        </style>
    </head>
    <%
        String storeid = String.valueOf(session.getAttribute("sStoreid"));
    %>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="sHeader.jsp"/>
            <jsp:include page="sSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Uploaded Photo Details
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Update Photos</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-6" id="storeDetails">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr.No.</th>
                                                <th>Image Name</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String img2 = "", img3 = "", img1 = "";
                                                int cnt = 0;
                                                PreparedStatement pst;
                                                ResultSet rs;
                                                Connection con;
                                                Class.forName("com.mysql.jdbc.Driver");
                                                DBConnector dbc = new DBConnector();
                                                con = DriverManager.getConnection(dbc.getConstr());
                                                pst = con.prepareStatement("select photo, photo2, photo3 from storedetails where storeid=?");
                                                pst.setInt(1, Integer.parseInt(storeid));
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    cnt++;
                                                    img1 = rs.getString("photo");
                                                    img2 = rs.getString("photo2");
                                                    img3 = rs.getString("photo3");
                                                }
                                            %>
                                            <tr>
                                                <td>1</td>
                                                <td class="text-blue"><%=img1%></td>
                                                <td>
                                                    <a href="sUpdatePhoto.jsp?type=store&img=1" style="margin-left: 7px">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td class="text-blue"><%=img2%></td>
                                                <td>
                                                    <a href="sUpdatePhoto.jsp?type=store&img=2" style="margin-left: 7px">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td class="text-blue"><%=img3%></td>
                                                <td>
                                                    <a href="sUpdatePhoto.jsp?type=store&img=3" style="margin-left: 7px">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <%
                                                con.close();
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="box-footer">
                                    <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 imgPreview">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Image Preview</h3>
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
            
            $("table tr").on("click","td:nth-child(2)",function () {
                var td6 = $(this).text();
                $(".setImage").html("<img src='images/storephotos/"+td6+"' class='preview'>");
                $("#imgPreviewName").text(td6);
                $(".imgPreview").show();
            });
        </script>
    </body>
</html>
