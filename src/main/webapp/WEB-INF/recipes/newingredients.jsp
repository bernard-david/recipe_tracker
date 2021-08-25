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
<title>Add Ingredients</title>
</head>
<body>
	<div class="container">
	<h1>Add an Ingredient</h1>
		<form:form action="recipes/ingredient" method="post" modelAttribute="newIngredient">
			<div class="form-group">
		            <label>Name:</label>
		            <form:input path="name" class="form-control" />
		            <form:errors path="name" class="text-danger" />
		    </div>
		    <div class="form-group">
		            <label>Measurement:</label>
		            <form:input path="measurement" class="form-control" />
		            <form:errors path="measurement" class="text-danger" />
		    </div>
		    <div class="form-group">
		            <label>Quantity:</label>
		            <form:input type="number" path="quantity" class="form-control" />
		            <form:errors path="quantity" class="text-danger" />
		    </div>
		    <div class="form-group">
		            <label>Brand (optional):</label>
		            <form:input path="brand" class="form-control" />
		            <form:errors path="brand" class="text-danger" />
		    </div>
		    <input type="submit" value="Finish" class="btn btn-primary" />
		</form:form>
	</div>
</body>
</html>