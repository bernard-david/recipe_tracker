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
<title>Edit ${recipe.name}</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
		    <a class="navbar-brand" href="/home">Recipe Tracker</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
			    <div class="collapse navbar-collapse " id="navbarNavAltMarkup">
				      <div class="navbar-nav">
				        <a class="nav-link active" aria-current="page" href="/home">Dashboard</a>
				        <a class="nav-link" href="/new-recipe">New Recipe</a>
				        <a class="nav-link" href="/recipes">My Recipes</a>
				        <a class="nav-link" href="/logout">Logout</a>
				      </div>
				</div>
		    </div>
		</div>
	</nav>
	<br />
<div class="container">
<h1>Edit <c:out value="${recipe.name}"/></h1>
<form:form action="/recipe/update/${recipe.id}" method="post" modelAttribute="recipe">
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
		    	<form:errors path="under30" class="text-danger" />
		    	Yes<form:radiobutton path="under30" value="${true}"/>
		    	No<form:radiobutton path="under30" value="${false}"/>
		    </div>
		    <div class="form-group">
		            <label>Prep Time (in minutes):</label>
		            <form:input type="number" path="prepTime" class="form-control" />
		            <form:errors path="prepTime" class="text-danger" />
		    </div>
		    <div class="form-group">
		            <label>Cook Time (in minutes):</label>
		            <form:input type="number" path="cookTime" class="form-control" />
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
		    			<form:option value="None"/>
		            	<form:option value="Gluten Free"/>
		            	<form:option value="Vegan"/>
		            	<form:option value="Vegetarian"/>
		            	<form:option value="Dairy Free"/>
		            	<form:option value="Paleo"/>
	            </form:select>
	            <form:errors path="prepTime" class="text-danger" />
		    </div>
		    <br />
		    <form:hidden path="creator" value="${user.id}"/>
		    <h4>Ingredients</h4>
		    <c:forEach items="${recipe.ingredients}" var="ingredient">
		    	<p>${ingredient.name} ${ingredient.quantity} ${ingredient.measurement} ${ingredient.brand } <a href="/ingredient/${ingredient.id}/delete">Delete</a></p>
		    </c:forEach>
		    <input type="submit" value="Update" class="btn btn-primary" />
		</form:form>
</div>

</body>
</html>