<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Login H.Company</title>
	<base href="${pageContext.servletContext.contextPath}/">
	
	<script src="js/jquery.min.js"></script>
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/login.css" rel="stylesheet"/>
	<script src="js/bootstrap.min.js"></script>
        <script src="js/main_1.js"></script>
        <style>
            .formdk{text-align: center;
           background-color: white;
            
            padding: 5px;}
            form{
                margin-left: 440px;
                margin-right: 440px;
            }
        </style>
</head>

<header>
Tạo tài khoản H.Company
${message}
</header>
<div class="formdk">
	<form:form action="user/register.htm" modelAttribute="user">
	<div class="form-group">
		<label>Username</label>
		<form:input path="id" cssClass="form-control"/>
	</div>
	
	<div class="form-group">
		<label>Password</label>
		<form:input path="password" cssClass="form-control"/>
	</div>
	
	<div class="form-group">
		<label>Fullname</label>
		<form:input path="fullname" cssClass="form-control"/>
	</div>
	
	<div class="form-group">
		<label>Email</label>
		<form:input path="email" cssClass="form-control"/>
	</div>
	
	<div class="form-group">
		<label>Photo</label>
		<form:input path="photo" cssClass="form-control"/>
	</div>
	
	<div class="form-group">
            <button class="btn btn-default">Register</button></hr>
                <a href="user/login.htm">Quay lại login</a>
                 
	</div>
       
         

               
</form:form>

</div>

<p class="copyright">
	H.Company 2018
</p> 