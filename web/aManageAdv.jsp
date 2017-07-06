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
        <title>Manage Advertisements</title>
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
            tr td:nth-child(2),tr td:nth-child(7){
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
                        Manage Advertisements
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Advertisements</li>
                    </ol>
                </section>
                <section class="content">

                    <div class="row">
                        <div class="col-md-12" id="advDetails">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title"></h3>
                                    <a href="aAddAdvertise.jsp" class="btn-sm btn-primary pull-right">
                                        <i class="fa fa-plus"></i>  Add Advertise</a>
                                </div>
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>AID</th>
                                                <th>Store Name</th>
                                                <th>Adv.Title</th>
                                                <th>Offer Duration</th>
                                                <th>Status</th>
                                                <th>Date - Time</th>
                                                <th>Offer Image</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String sDate = "", eDate = "", timedate = "", img = "";
                                                String advStatus = "", storeName = "", advTitle = "";
                                                int cnt = 0, aid = 0, storeid = 0;
                                                PreparedStatement pst;
                                                ResultSet rs;
                                                Connection con;
                                                Class.forName("com.mysql.jdbc.Driver");
                                                DBConnector dbc = new DBConnector();
                                                con = DriverManager.getConnection(dbc.getConstr());
                                                pst = con.prepareStatement("select * from view_advertise order by timedate desc");
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    cnt++;
                                                    aid = rs.getInt("aid");
                                                    advTitle = rs.getString("advtitle");
                                                    storeName = rs.getString("storename");
                                                    storeid = rs.getInt("storeid");
                                                    sDate = rs.getString("sDate");
                                                    eDate = rs.getString("eDate");
                                                    timedate = rs.getString("timedate");
                                                    advStatus = rs.getString("advstatus");
                                                    img = rs.getString("advimg");
                                            %>
                                            <tr>
                                                <td><%=aid%></td>
                                                <td class="text-blue"><a href="aStoreDetails.jsp?id=<%=storeid%>"><%=storeName%></a></td>
                                                <td class="text-blue"><a href="aAdvertiseDetails.jsp?aid=<%=aid%>&sid=<%=storeid%>"><%=advTitle%></a></td>
                                                <td><%=sDate%> - <%=eDate%></td>
                                                <td><a href="JavaScript:changeStatus('<%=aid%>','<%=advStatus%>','advertise')"><%=advStatus%></a></td>
                                                <td><%=timedate%></td>
                                                <td class="text-blue"><%=img%></td>
                                                <td>
                                                    <a href="JavaScript:del('<%=aid%>','advertise')" style="margin-left: 7px">
                                                        <i class="fa fa-trash-o"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <%}
                                                con.close();
                                            %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>AID</th>
                                                <th>Store Name</th>
                                                <th>Adv.Title</th>
                                                <th>Offer Duration</th>
                                                <th>Status</th>
                                                <th>Date - Time</th>
                                                <th>Offer Image</th>
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
