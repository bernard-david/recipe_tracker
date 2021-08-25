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
		            <label>Name:</label>
		            <form:input path="name" class="form-control" />
		            <form:errors path="name" class="text-danger" />
		    </div>
		    <div class="form-group">
		            <label>Description:</label>
		            <form:input path="description" class="form-control" />
		            <form:errors path="description" class="text-danger" />
		    </div>
		    <div class="form-group">
		            <label>Extra comments (optional):</label>
		            <form:input path="extraComments" class="form-control" />
		            <form:errors path="extraComments" class="text-danger" />
		    </div>
		    <div class="form-group">
		            <label>Picture (optional):</label>
		            <form:input path="picture" class="form-control" />
		            <form:errors path="picture" class="text-danger" />
		    </div>
		    <div class="form-group">
		    	<label>Under 30?</label>
		    	Yes<form:radiobutton path="under30" value="${true}"/>
		    	No<form:radiobutton path="under30" value="${false}"/>
		    </div>
		    <div class="form-group">
		            <label>Prep Time:</label>
		            <form:input path="prepTime" class="form-control" />
		            <form:errors path="prepTime" class="text-danger" />
		    </div>
		    <div class="form-group">
		            <label>Cook Time:</label>
		            <form:input path="cookTime" class="form-control" />
		            <form:errors path="cookTime" class="text-danger" />
		    </div>
		    <div class="form-group">
		            <label>Category:</label>
		            <form:select path="category" class="form-select">
		            	<form:option value="American"/>
		            	<form:option value="Italian"/>
		            	<form:option value="Jamaican"/>
		            	<form:option value="Japanese"/>
		            	<form:option value="Chinese"/>
		            	<form:option value="Indian"/>
		            </form:select>
		            <form:errors path="prepTime" class="text-danger" />
		    </div>
		    <div class="form-group">
		    	<label>Diet:</label>
		    	<form:select path="dietRequirement" class="form-select">
		            	<form:option value="Gluten Free"/>
		            	<form:option value="Vegan"/>
		            	<form:option value="Vegetarian"/>
		            	<form:option value="Dairy Free"/>
		            	<form:option value="Paleo"/>
	            </form:select>
	            <form:errors path="prepTime" class="text-danger" />
		    </div>
		    <form:hidden path="creator" value="${user.id}"/>
		    <input type="submit" value="Add Ingredients" class="btn btn-primary" />
		</form:form>
	</div>
</body>
</html>







