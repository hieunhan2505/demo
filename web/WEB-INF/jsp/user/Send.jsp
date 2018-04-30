<%-- 
    Document   : newjsp
    Created on : Apr 5, 2018, 1:50:42 PM
    Author     : TrungQuoc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Login Page</title>
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


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="login">

      <div class="form-signin">
    <div class="text-center">
        <img src="assets/img/logo.png" alt="Metis Logo">
    </div>
    <hr>
    <div class="tab-content">
        <div id="login" class="tab-pane active">
            
            <form action="user/send.htm" method="post" modelAttribute="users">
                <p class="text-muted text-center">
                   Bạn có Muốn Chúng Tôi Gửi Mật Khẩu về Email cho bạn
                   
                </p>
                <input type="hidden" placeholder="Email" class="form-control top" name="txtemail" />
                 ${message}
               
                 
                 <hr>
                <button class="btn btn-lg btn-primary btn-block">Đồng ý</button>
                   
            
              <input type="hidden" value="trungplqps05630@fpt.edu.vn" name="from"/>
              <input type="hidden" value="SendMail" name="subject" />
                     <c:forEach var="m" items="${user}">
                         
                         <input type="hidden" value="${m.email}" name="to" />
                          
                       <input type="hidden" value="${m.password}" name="body"/>  
                         
                     </c:forEach>
            </form>    
        </div>
    
    </div>
    <hr>
 
  </div>


    <!--jQuery -->
    <script src="assets/lib/jquery/jquery.js"></script>

    <!--Bootstrap -->
    <script src="assets/lib/bootstrap/js/bootstrap.js"></script>


</body>

</html>

