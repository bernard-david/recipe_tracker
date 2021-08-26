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
<title>${recipe.name}</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
		    <a class="navbar-brand" href="/home">Recipe Tracker</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
			    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				      <div class="navbar-nav">
				        <a class="nav-link active" aria-current="page" href="/home">Dashboard</a>
				        <a class="nav-link" href="/new-recipe">New Recipe</a>
				        <a class="nav-link" href="/logout">Logout</a>
				      </div>
				</div>
		    </div>
		</div>
</nav>
<br />
<div class="container" style="display: flex;  gap:2em; margin">
	<div>
		<img src="${recipe.picture}" alt="recipe image" width="auto" height="300"><br/><br/>
		<c:choose>
			<c:when test="${!user.recipeLikes.contains(recipe)}">
				<a href="/like/${recipe.id}" class="btn btn-primary">Like</a>
			</c:when>
			<c:otherwise>
				<a href="/unlike/${recipe.id}" class="btn btn-info">UnLike</a>
			</c:otherwise>
		</c:choose>
		<a href="/recipe/edit/${recipe.id}" class="btn btn-primary">Edit</a>	
	</div>
	<div>
		<h1>${recipe.name}</h1>
		<p>By: ${recipe.creator.userName}</p>
		<div style="display: flex;  gap:2em;">
			<p>Prep time: ${recipe.prepTime} minutes</p>
			<p>Cook time: ${recipe.cookTime} minutes</p>
			<c:if test="${recipe.under30 == true}">
			<p>Under 30: Yes</p>
			</c:if>
			<c:if test="${recipe.under30 == false}">
			<p>Under 30: No</p>
			</c:if>	
		</div>
		<p>created at: ${recipe.createdAt}</p>
		<h4>description:</h4>
		<p> ${recipe.description}</p>
		<h4>steps:</h4>
		<p>${recipe.steps}</p>
		<h4>ingredients:</h4>
		<c:forEach items="${recipe.ingredients}" var="ingredient">
			<p> ${ingredient.quantity} ${ingredient.measurement} ${ingredient.name}  |  Brand: ${ingredient.brand}</p>		
		</c:forEach>
	</div>
</div>

</body>
</html>