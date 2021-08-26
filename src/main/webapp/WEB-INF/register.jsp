<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Recipe</title>
</head>
<body>
	
	<div class="position-absolute top-50 start-50 translate-middle">
		<div class="text-center">
			<h1>Welcome to Recipe Tracker</h1>
			<h4>Register</h4>
		</div>
		<form:form action="/register" method="post" modelAttribute="newUser">
	        <div class="form-group">
	            <label>User Name:</label>
	            <form:input path="userName" class="form-control" />
	            <form:errors path="userName" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Email:</label>
	            <form:input path="email" class="form-control" />
	            <form:errors path="email" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Password:</label>
	            <form:password path="password" class="form-control" />
	            <form:errors path="password" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Confirm Password:</label>
	            <form:password path="confirm" class="form-control" />
	            <form:errors path="confirm" class="text-danger" />
	        </div>
	        <br />
	        <input type="submit" value="Register" class="btn btn-primary" />
    	</form:form>
    	<br />
    	<p class="text-center">Already have an account? <a href="/">Login</a></p>
	</div>
    
    
</body>
</html>