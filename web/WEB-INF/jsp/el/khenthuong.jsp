<%-- 
    Document   : newjsp
    Created on : Apr 4, 2018, 12:42:12 PM
    Author     : hieuhayho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content=""> 

        <title>Admin Panel</title> 
        <base href="${pageContext.servletContext.contextPath}/">

        <!-- Bootstrap Core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- DataTables CSS -->
        <link href="vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

        <!-- DataTables Responsive CSS -->
        <link href="vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"></a><img src="img/logo.png" width="130px" height="50px"/>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>Admin</strong>
                                        <span class="pull-right text-muted">
                                            <em>Bây giờ</em>
                                        </span>
                                    </div>
                                    <div>Chào mừng bạn đến với H.Company</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>H.Company</strong>
                                        <span class="pull-right text-muted">
                                            <em>Bây giờ</em>
                                        </span>
                                    </div>
                                    <div>H.Company được thành lập 2018, là công ty đang phát triển về mảng công nghệ thông tin</div>
                                </a>
                            </li>

                            <!--  <li>
                          <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a> 
                            </li>-->
                        </ul>
                        <!-- /.dropdown-messages -->
                    </li>
                    <!-- /.dropdown -->

                    <!-- /.dropdown-tasks -->
                    </li>
                    <!-- /.dropdown -->


                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <img src="img/admin.png"/> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> Thông tin</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Cài đặt</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Thoát</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li>

                                <a href="el/newjsp/showall.htm"><img src="img/home.png"/> Chung </a>
                            </li>
                            <li>
                                <a href="#"><img src="img/phongban.png"/> Phòng Ban<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="el/kd.htm">Kinh Doanh</a> 
                                    </li>
                                    <li>
                                        <a href="el/kt.htm">Kế Toán</a>
                                    </li>
                                    <li>
                                        <a href="el/ns.htm">Nhân Sự</a>
                                    </li>
                                    <li>
                                        <a href="el/itc.htm">IT</a>
                                    </li>
                                    <li>
                                        <a href="el/tt.htm">Truyền Thông</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="el/nv.htm"><img src="img/nv.png"/>  Nhân Viên</a>
                            </li>
                            <li>
                                <a href="el/tk.htm"><img src="img/dk.png"/> Toàn Khoản</a>
                            </li>
                            <li>
                                <a href="el/nvxs.htm"><img src="img/thanhtich.png"/> NV Xuất Sắc</a>
                            </li>
                            <li>
                                <a href="el/newjsp/khenthuong.htm"><img src="img/kyluat.png"/> Khen Thưởng & Kỹ Luật</a>
                            </li>
                            <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><img src="img/tuychon.png"/> Tùy Chọn<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="el/bl.htm">Báo Lỗi</a>
                                    </li>
                                    <li>
                                        <a href="#">Thoát</a>
                                    </li>

                                    <!-- /.nav-second-level -->
                            </li>

                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">H.Company - Website quản lý nhân viên</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Danh sách toàn bộ nhân viên
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    
                                    <tr>
                                        <th>Mã NV</th>
                                        <th>Ảnh</th>
                                        <th>Tên</th>    
                                        <th>SĐT</th>
                                        <th>Giới tính</th>                                      
                                        <th>Phòng ban</th>
                                        <th>Tổng thưởng</th>

                                    </tr>
                                    </thead>
                                    <c:forEach var="rows" items="${listnv}">
                                        <form:form action="el/newjsp/khenthuong.htm" modelAttribute="nhanvien">
                                            <tr>
                                                <td>${rows.manv}</td>
                                                <td><img src="img/${rows.img}" width="60" height="60"/></td>
                                                <td>${rows.hovaten}</td>
                                                <td>${rows.sodienthoai}</td>
                                                <td>${rows.gioitinh}</td>              
                                                <td>${rows.phongban}</td>
                                                <td>${rows.tongthuong}</td>
                                                <td> <button name="btnUpdate">Cập nhật</button>  </td>    
                                                                                         </tr>
                                    </form:form>
                                    </c:forEach>    



                                    </tbody>    
                                </table>
                                <!-- /.table-responsive -->

                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Phòng Kinh Doanh
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>

                                                <th>Họ và tên</th>
                                                <th>Giới tính</th>
                                                <th>Chức vụ</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="rows" items="${listnvpb}">
                                            <form action="el/newjsp/delete.html">
                                                <tr>

                                                    <td>${rows.hovaten}</td>


                                                    <td>${rows.gioitinh}</td>

                                                    <td>${rows.chucvu}</td>


                                                </tr>
                                            </form>
                                        </c:forEach>    
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Phòng Nhân Sự
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Họ và tên</th>
                                                <th>Giới tính</th>
                                                <th>Chức vụ</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Phòng Kế Toán
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Họ và tên</th>
                                                <th>Giới tính</th>
                                                <th>Chức vụ</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Phòng IT
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive table-bordered">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Họ và tên</th>
                                                <th>Giới tính</th>
                                                <th>Chức vụ</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Phòng Truyền Thông
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Họ và tên</th>
                                                <th>Giới tính</th>
                                                <th>Chức vụ</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Khen Thưởng 2018
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Họ và tên</th>
                                                <th>Giới tính</th>
                                                <th>Phòng ban</th>
                                                <th>Đạt</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="success">
                                                <td>1</td>
                                                <td>Nguyễn Minh Hiếu</td>
                                                <td>Nam</td>
                                                <td>Giám đốc</td>
                                                <td>Giám đốc xuất sắc</td>

                                            </tr>
                                            <tr class="info">
                                                <td>2</td>
                                                <td>Nguyễn Nhựt Trường</td>
                                                <td>Nam</td>
                                                <td>Kinh Doanh</td>
                                                <td>Nhân viên tích cực</td>
                                            </tr>
                                            <tr class="warning">
                                                <td>3</td>
                                                <td>Phan Lê Quốc Trung</td>
                                                <td>Nam</td>
                                                <td>Nhân Sự</td>
                                                <td>Nhân viên xuất sắc</td>
                                            </tr>
                                            <tr class="danger">

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="vendor/metisMenu/metisMenu.min.js"></script>

        <!-- DataTables JavaScript -->
        <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
        <script src="vendor/datatables-responsive/dataTables.responsive.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="dist/js/sb-admin-2.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
            $(document).ready(function () {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            });
        </script>

    </body>

    <footer>
        <hr>
        <style>
            .ft{width: auto;
                height: 80px;

                text-align: center;
            }       
        </style>
        <div class="ft">
            <p>H.Company - Công nghệ & Truyền thông</p>
            <p>Địa chỉ : 235/72 Nam Kỳ Khởi Nghĩa, Quận 3, TP.Hồ Chí Minh</p>
            <p>Email : domain3hvn@gmail.com</p>
        </div>
    </footer>
</html>

