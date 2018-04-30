    <%-- 
    Document   : form-wizard
    Created on : Apr 5, 2018, 8:08:41 PM
    Author     : TrungQuoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

    <head>
        <meta charset="UTF-8">
        <!--IE Compatibility modes-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Mobile first-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Form Wizard</title>  
        <base href="${pageContext.servletContext.contextPath}/">

        <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x">
        <meta name="author" content="">

        <meta name="msapplication-TileColor" content="#5bc0de" />
        <meta name="msapplication-TileImage" content="assets/img/metis-tile.png" />

        <!-- Bootstrap -->
        <link rel="stylesheet" href="assets/lib/bootstrap/css/bootstrap.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="assets/lib/font-awesome/css/font-awesome.css">

        <!-- Metis core stylesheet -->
        <link rel="stylesheet" href="assets/css/main.css">

        <!-- metisMenu stylesheet -->
        <link rel="stylesheet" href="assets/lib/metismenu/metisMenu.css">

        <!-- onoffcanvas stylesheet -->
        <link rel="stylesheet" href="assets/lib/onoffcanvas/onoffcanvas.css">

        <!-- animate.css stylesheet -->
        <link rel="stylesheet" href="assets/lib/animate.css/animate.css">

        <link href='//maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css' rel='stylesheet'/>
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
<style>a:active{position:relative;top:1px;left:1px}
#all-button{text-align:center}
#all-button a{padding:10px 20px;color:#fff;text-align:center;border:0;cursor:pointer;border-radius:3px;display:inline-block;font-weight:500;-webkit-box-shadow:inset 0 -4px rgba(0,0,0,0.15);box-shadow:inset 0 -4px rgba(0,0,0,0.15);color:#fff;max-width:220px;line-height:30px;font-size:16px;text-transform: uppercase;margin:10px}
#all-button a:hover{-webkit-box-shadow:inset 0 -54px rgba(0,0,0,0.15);box-shadow:inset 0 -54px rgba(0,0,0,0.15);color:#fff}
.demo-button:before{content:'\f1d9';font-family:fontawesome;display:inline-block;margin:0 8px 3px 0;vertical-align:middle}
.download-button:before{content:'\f019';font-family:fontawesome;display:inline-block;margin:0 8px 3px 0;vertical-align:middle}
.buy-button:before{content:'\f07a';font-family:fontawesome;display:inline-block;margin:0 8px 3px 0;vertical-align:middle}
.blue{background:#3498db;}
.green{background:#2ecc71}
.red{background:#e74c3c}
.orange{background:#e8930c}
.purple{background:#9b59b6}
.yellow{background:#FFD600}
.pink{background:#F889EB}
.grey{background:#bdc3c7}
.turquoise{background:#1abc9c}
.midnight{background:#2c3e50}
.asbestos{background:#6d7b7c}
.dark{background:#454545}</style>
        <link rel="stylesheet" href="/assets/lib/plupload/js/jquery.plupload.queue/css/jquery.plupload.queue.css">
        <link rel="stylesheet" href="/assets/lib/jquery.gritter/css/jquery.gritter.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/Uniform.js/2.1.2/themes/default/css/uniform.default.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!--For Development Only. Not required -->
        <script>
            less = {
                env: "development",
                relativeUrls: false,
                rootpath: "/assets/"
            };
        </script>
        <link rel="stylesheet" href="assets/css/style-switcher.css">
        <link rel="stylesheet/less" type="text/css" href="assets/less/theme.less">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.1/less.js"></script>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>

    <body class="  ">

        <div class="bg-dark dk" id="wrap">
            <div id="top">

                <!-- .navbar -->
                <nav class="navbar navbar-inverse navbar-static-top">
                    <div class="container-fluid">


                        <!-- Brand and toggle get grouped for better mobile display -->
                        <header class="navbar-header">

                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="index.htm" class="navbar-brand"><img src="assets/img/logo.png" alt=""></a>

                        </header>



                        <div class="topnav">
                            <div class="btn-group">
                                <a data-placement="bottom" data-original-title="Fullscreen" data-toggle="tooltip"
                                   class="btn btn-default btn-sm" id="toggleFullScreen">
                                    <i class="glyphicon glyphicon-fullscreen"></i>
                                </a>
                            </div>
                            <div class="btn-group">
                                <a data-placement="bottom" data-original-title="E-mail" data-toggle="tooltip"
                                   class="btn btn-default btn-sm">
                                    <i class="fa fa-envelope"></i>
                                    <span class="label label-warning">5</span>
                                </a>
                                <a data-placement="bottom" data-original-title="Messages" href="#" data-toggle="tooltip"
                                   class="btn btn-default btn-sm">
                                    <i class="fa fa-comments"></i>
                                    <span class="label label-danger">4</span>
                                </a>
                                <a data-toggle="modal" data-original-title="Help" data-placement="bottom"
                                   class="btn btn-default btn-sm"
                                   href="#helpModal">
                                    <i class="fa fa-question"></i>
                                </a>
                            </div>
                            <div class="btn-group">
                                <a href="user/login.htm" data-toggle="tooltip" data-original-title="Logout" data-placement="bottom"
                                   class="btn btn-metis-1 btn-sm">
                                    <i class="fa fa-power-off"></i>
                                </a>
                            </div>
                            <div class="btn-group">
                                <a data-placement="bottom" data-original-title="Show / Hide Left" data-toggle="tooltip"
                                   class="btn btn-primary btn-sm toggle-left" id="menu-toggle">
                                    <i class="fa fa-bars"></i>
                                </a>
                                <a href="#right" data-toggle="onoffcanvas" class="btn btn-default btn-sm" aria-expanded="false">
                                    <span class="fa fa-fw fa-comment"></span>
                                </a>
                            </div>

                        </div>





                        <div class="collapse navbar-collapse navbar-ex1-collapse">

                            <!-- .nav -->
                            <ul class="nav navbar-nav">
                                <li><a href="form-wizard/showall.htm">Dashboard</a></li>
                                <li><a href="table.htm">Tables</a></li>
                                <li class='dropdown active'>
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        Form Elements <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a>General</a></li>
                                        <li><a>Validation</a></li>
                                        <li>>WYSIWYG</a></li>
                                        <li><a>Wizard &amp; File Upload</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <!-- /.nav -->
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </nav>
                <!-- /.navbar -->
                <header class="head">
                    <div class="search-bar">
                        <form class="main-search" action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Live Search ...">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary btn-sm text-muted" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                        <!-- /.main-search -->                                </div>
                    <!-- /.search-bar -->
                    <div class="main-bar">
                        <h3>
                            <i class="fa fa-magic"></i>&nbsp;
                            Form Wizard
                        </h3>
                    </div>
                    <!-- /.main-bar -->
                </header>
                <!-- /.head -->
            </div>
            <!-- /#top -->
            <div id="left">
                <div class="media user-media bg-dark dker">
                    <div class="user-media-toggleHover">
                        <span class="fa fa-user"></span>
                    </div>
                    <div class="user-wrapper bg-dark">
                        <a class="user-link" href="">
                            <img class="media-object img-thumbnail user-img" alt="User Picture" src="assets/img/logo.png">
                            <span class="label label-danger user-label">16</span>
                        </a>

                        <div class="media-body">
                            <h5 class="media-heading">Archie</h5>
                            <ul class="list-unstyled user-info">
                                <li><a href="">${user.id}</a></li>
                                <li>Last Access : <br>
                                    <small><i class="fa fa-calendar"></i>&nbsp;16 Mar 16:32</small>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- #menu -->
                <ul id="menu" class="bg-blue dker">
                    <li class="nav-header">Menu</li>
                    <li class="nav-divider"></li>



                    <li class="">
                        <a href="javascript:;">
                            <i class="fa fa-pencil"></i>
                            <span class="link-title">
                                Forms
                            </span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="collapse">

                            <li>
                                <a href="user/list.htm">
                                    <i class="fa fa-angle-right"></i>&nbsp; Phòng Ban </a>
                            </li>

                        </ul>
                    </li>
                    <li>
                        <a href="student.htm">
                            <i class="fa fa-table"></i>
                            <span class="link-title">Nhân Viên</span>
                        </a>
                    </li>

                    <li>
                        <a>
                            <i class="fa fa-map-marker"></i><span class="link-title">
                                Maps
                            </span>
                        </a>
                    </li>

                    <li>
                        <a href="Test/showall.htm">
                            <i class="fa fa-calendar"></i>
                            <span class="link-title">
                                Calendar
                            </span>
                        </a>
                    </li>



                    <li class="nav-divider"></li>
                    <li>
                        <a href="user/login.htm">
                            <i class="fa fa-sign-in"></i>
                            <span class="link-title">
                                Login Page
                            </span>
                        </a>
                    </li>

                </ul>
                <!-- /#menu -->
            </div>
            <!-- /#left -->
            <div id="content">
                <div class="outer">
                    <div class="inner bg-light lter">
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
                               <div id="all-button">
<a href="el/newjsp/showall.htm" class="green" target="_blank" rel="nofollow">Danh sách</a>
<a href="report/by-major.htm" class="orange" target="_blank" rel="nofollow">Tổng Điểm Phòng</a>
<a href="report/by-major.htm" class="orange" target="_blank" rel="nofollow">Thành Tích</a>
<a href="el/ktkl.htm" class="blue" target="_blank" rel="nofollow">Đánh giá</a></div>

                                <!-- /.table-responsive -->
                                
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default" style="width: 1250px">
                            <div class="panel-heading" style="text-align: center">
                                <img src="img/vuongmien.png" width="30px" height="30px"/>    Top 6 Nhân Viên Xuất Sắc Nhất Công Ty <img src="img/vuongmien.png" width="30px" height="30px"/>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example" >
                                   
                                               
                                      

                                  
                                    <thead>

                                        <tr>
                                            <th>Mã NV</th>
                                            <th>Image</th>
                                            <th>Họ và tên</th>
                                            <th>Thưởng</th>
                                            <th>Phòng ban</th>
                                        
                                        </tr>
                                    </thead>
                                    <c:forEach var="m" items="${students}">
                                        <tr>
                                            <td style="text-align: center">${m.id}</td>
                                            <td style="text-align: center"><img src="img/${m.photo}" width="50px" height="50px"/></td>
                                            <td style="text-align: center">${m.fullname}</td>
                                            <td style="text-align: center">${m.mark}</td>
                                            <td style="text-align: center">${m.major.name}</td>
                                      
                                        </tr>
                                    </c:forEach>

                                    </tbody>    
                                </table>
                                <!-- /.table-responsive -->

                            </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        
                 


                        <!-- /.row -->


                        <!-- /.row -->

                    </div>
                    <!-- /.inner -->
                </div>


                <br>            


                <!-- /.outer -->
            </div>
            <!-- /#content -->


            <!-- /#right -->
        </div>
        <!-- /#wrap -->
        <footer class="Footer bg-dark dker">
            <p>2017 &copy; Metis Bootstrap Admin Template v2.4.2</p>
        </footer>
        <!-- /#footer -->
        <!-- #helpModal -->

        <!-- /.modal -->
        <!-- /#helpModal -->
        <!--jQuery -->
        <script src="assets/lib/jquery/jquery.js"></script>

        <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/holder/2.4.1/holder.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/Uniform.js/2.1.2/jquery.uniform.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js"></script>

        <!--Bootstrap -->
        <script src="assets/lib/bootstrap/js/bootstrap.js"></script>
        <!-- MetisMenu -->
        <script src="assets/lib/metismenu/metisMenu.js"></script>
        <!-- onoffcanvas -->
        <script src="assets/lib/onoffcanvas/onoffcanvas.js"></script>
        <!-- Screenfull -->
        <script src="assets/lib/screenfull/screenfull.js"></script>

        <script src="/assets/lib/plupload/js/plupload.full.min.js"></script>
        <script src="/assets/lib/plupload/js/jquery.plupload.queue/jquery.plupload.queue.min.js"></script>
        <script src="/assets/lib/jquery.gritter/js/jquery.gritter.min.js"></script>
        <script src="/assets/lib/formwizard/js/jquery.form.wizard.js"></script>

        <!-- Metis core scripts -->
        <script src="assets/js/core.js"></script>
        <!-- Metis demo scripts -->
        <script src="assets/js/app.js"></script>

        <script>
            $(function () {
                Metis.formWizard();
            });
        </script>

        <script src="assets/js/style-switcher.js"></script>
    </body>

</html>
