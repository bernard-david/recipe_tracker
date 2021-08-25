<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Add a Recipe</title>
</head>
<body>
	<h1>Add a Recipe</h1>
	<div class="container">
		<form:form action="recipes/create" method="post" modelAttribute="newRecipe">
			<div class="form-group">
		            <label>Content:</label>
		            <form:input path="name" class="form-control" />
		            <form:errors path="name" class="text-danger" />
		    </div>
		</form:form>
	</div>
</body>
</html>