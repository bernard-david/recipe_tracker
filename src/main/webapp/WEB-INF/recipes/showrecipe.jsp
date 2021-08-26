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
<a href="/home">Home</a><br/>
<a href="/recipes"/>Go Back</a>
<div class="container" style="display: flex;  gap:2em; margin">
	<div>
		<img src="${recipe.picture}" alt="recipe image" width="auto" height="300"><br/><br/>
		<button class="btn btn-primary">Like</button>
		<button class="btn btn-primary">Share</button>
		<button class="btn btn-primary">Edit</button>	
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