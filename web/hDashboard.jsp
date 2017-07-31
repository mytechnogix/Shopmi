
<%@page import="java.sql.DriverManager"%>
<%@page import="com.quickc.pack.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    String visits = "", rating = "", reviews = "", enq = "";
    String hallname = String.valueOf(session.getAttribute("hHallName"));
    String hallid = String.valueOf(session.getAttribute("hHallid"));
    int cnt = 0;
    PreparedStatement pst;
    ResultSet rs;
    Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    DBConnector dbc = new DBConnector();
    con = DriverManager.getConnection(dbc.getConstr());

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%=hallname%></title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="hHeader.jsp"/>
            <jsp:include page="hSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        <%=hallname%>
                    </h1>
                    <ol class="breadcrumb">
                        <li class="active">Home</li>
                    </ol>
                </section>
                <%
                    pst = con.prepareStatement("select * from halls where hallid=?");
                    pst.setString(1, hallid);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        visits = rs.getString("visitcount");
                        rating = rs.getString("rating");
                        reviews = rs.getString("reviewscount");
                        enq = rs.getString("enquirycount");
                    }
                %>
                <section class="content">
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3 id="vcount"><%=visits%></h3>
                                    <p>Visits</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-shopping-cart"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3 id="memberCount"><%=enq%></h3>
                                    <p>Enquiries</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3 id="catCount"><%=rating%></h3>
                                    <p>Rating</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-tags"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3 id="visitsCount"><%=reviews%></h3>
                                    <p>Reviews</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-desktop"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Latest Orders</h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive">
                                        <table class="table no-margin">
                                            <thead>
                                                <tr>
                                                    <th>Order ID</th>
                                                    <th>Item</th>
                                                    <th>Status</th>
                                                    <th>Popularity</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR9842</a></td>
                                                    <td>Call of Duty IV</td>
                                                    <td><span class="label label-success">Shipped</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#00a65a" data-height="20">90,80,90,-70,61,-83,63</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR1848</a></td>
                                                    <td>Samsung Smart TV</td>
                                                    <td><span class="label label-warning">Pending</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#f39c12" data-height="20">90,80,-90,70,61,-83,68</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR7429</a></td>
                                                    <td>iPhone 6 Plus</td>
                                                    <td><span class="label label-danger">Delivered</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#f56954" data-height="20">90,-80,90,70,-61,83,63</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR7429</a></td>
                                                    <td>Samsung Smart TV</td>
                                                    <td><span class="label label-info">Processing</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#00c0ef" data-height="20">90,80,-90,70,-61,83,63</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR1848</a></td>
                                                    <td>Samsung Smart TV</td>
                                                    <td><span class="label label-warning">Pending</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#f39c12" data-height="20">90,80,-90,70,61,-83,68</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR7429</a></td>
                                                    <td>iPhone 6 Plus</td>
                                                    <td><span class="label label-danger">Delivered</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#f56954" data-height="20">90,-80,90,70,-61,83,63</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR9842</a></td>
                                                    <td>Call of Duty IV</td>
                                                    <td><span class="label label-success">Shipped</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#00a65a" data-height="20">90,80,90,-70,61,-83,63</div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="box-footer clearfix">
                                    <a href="javascript::;" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
                                    <a href="javascript::;" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="info-box bg-yellow">
                                <span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Inventory</span>
                                    <span class="info-box-number">5,200</span>

                                    <div class="progress">
                                        <div class="progress-bar" style="width: 50%"></div>
                                    </div>
                                    <span class="progress-description">
                                        50% Increase in 30 Days
                                    </span>
                                </div>
                            </div>
                            <div class="info-box bg-green">
                                <span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Mentions</span>
                                    <span class="info-box-number">92,050</span>

                                    <div class="progress">
                                        <div class="progress-bar" style="width: 20%"></div>
                                    </div>
                                    <span class="progress-description">
                                        20% Increase in 30 Days
                                    </span>
                                </div>
                            </div>
                            <div class="info-box bg-red">
                                <span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Downloads</span>
                                    <span class="info-box-number">114,381</span>

                                    <div class="progress">
                                        <div class="progress-bar" style="width: 70%"></div>
                                    </div>
                                    <span class="progress-description">
                                        70% Increase in 30 Days
                                    </span>
                                </div>
                            </div>
                            <div class="info-box bg-aqua">
                                <span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Direct Messages</span>
                                    <span class="info-box-number">163,921</span>

                                    <div class="progress">
                                        <div class="progress-bar" style="width: 40%"></div>
                                    </div>
                                    <span class="progress-description">
                                        40% Increase in 30 Days
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <jsp:include page="aFooterFiles.jsp"/>
        </div>
        <%con.close();%>
    </body>
</html>
