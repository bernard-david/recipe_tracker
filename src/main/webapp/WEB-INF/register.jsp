<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<title>Recipe Tracker</title>
</head>
<body>
	<div class="container">
		
			
		<form:form action="/register" method="post" modelAttribute="newUser" class="position-absolute top-50 start-50 translate-middle">
	        <div class="form-group mb-2">
	            
	            <form:input path="userName" placeholder="User Name" class="form-control" />
	            <form:errors path="userName" class="text-danger" />
	        </div>
	        <div class="form-group mb-2">
	            <form:input path="email" placeholder="Email" class="form-control" />
	            <form:errors path="email" class="text-danger" />
	        </div>
	        <div class="form-group mb-2">
	            <form:password path="password" placeholder="Password" class="form-control" />
	            <form:errors path="password" class="text-danger" />
	        </div>
	        <div class="form-group mb-2">
	            <form:password path="confirm" placeholder="Confirm Password" class="form-control" />
	            <form:errors path="confirm" class="text-danger" />
	        </div>
	        <input type="submit" value="Register" class="btn btn-primary" />
    	</form:form>
    </div>
	
	
</body>
</html>