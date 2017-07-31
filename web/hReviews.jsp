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
        <title>Party Hall Reviews</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="shortcut icon" href="images/logo1_img.png">        
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="hHeader.jsp"/>
            <jsp:include page="hSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Reviews
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Customer Reviews</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12" id="advDetails">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Customer Reviews</h3>
                                </div>
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr. No.</th>
                                                <th>Customer ID</th>
                                                <th>Review</th>
                                                <th>Date - Time</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String timedate = "", uid = "", review = "";
                                                String storeid = String.valueOf(session.getAttribute("hHallid"));
                                                int cnt = 0;
                                                PreparedStatement pst;
                                                ResultSet rs;
                                                Connection con;
                                                Class.forName("com.mysql.jdbc.Driver");
                                                DBConnector dbc = new DBConnector();
                                                con = DriverManager.getConnection(dbc.getConstr());
                                                pst = con.prepareStatement("select * from reviewhall where hallid=? and review!='NA'");
                                                pst.setString(1, storeid);
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    cnt++;
                                                    uid = rs.getString("uid");
                                                    review = rs.getString("review");
                                                    timedate = rs.getString("reviewdate");
                                            %>
                                            <tr>
                                                <td><%=cnt%></td>
                                                <td><%=uid%></td>
                                                <td><%=review%></td>
                                                <td><%=timedate%></td>
                                            </tr>
                                            <%}
                                                con.close();
                                            %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Sr. No.</th>
                                                <th>Customer ID</th>
                                                <th>Review</th>
                                                <th>Date - Time</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
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
        </script>
        <script>
            $("#btnAdd").click(function(){
                $(".imgDetails").hide();
                $(".imgDetails1").hide();
            });
            $("#btnCancel").click(function(){
                $(".imgUpload").hide();
                $(".imgDetails").show();
                $(".imgDetails1").show();
            });
            $("table tr").on("click","td:nth-child(7)",function () {
                var aid = $(this).siblings(":nth-child(1)").text();
                var td6 = $(this).text();
                $("#advDetails").addClass("col-lg-8");
                $("#picPath").attr("href","aAddAdvPhoto.jsp?aid="+aid);
                $(".setImage").html("<img src='images/advphotos/"+td6+"' class='preview'>");
                $("#imgPreviewName").text(td6);
                $(".imgPreview").show();
            });
        </script>
    </body>
</html>
