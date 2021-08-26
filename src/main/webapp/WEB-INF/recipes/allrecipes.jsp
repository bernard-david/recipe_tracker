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
<title>My Recipes</title>
</head>
<body>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
		    <a class="navbar-brand" href="#">Recipe Tracker</a>
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
	<div class="container">
	<br />
	<h1>My Recipes</h1>
	<div class="d-flex gap-3 flex-wrap">
		<c:forEach items="${user.recipes}" var="recipe">
			<div class="card" style="width: 18rem;">
				<a href="/recipe/${recipe.id}"><img src="${recipe.picture}" class="card-img-top" alt="" /></a>
				<div class="card-body">
					<h4><a href="/recipe/${recipe.id}"><c:out value="${recipe.name}"/></a></h4>
					<p><c:out value="${recipe.category}"/></p>
					<p>Diet Requirement: <c:out value="${recipe.dietRequirement}"/></p>
				</div>
			</div>
		</c:forEach>
	</div>
	
	
	</div>
</body>
</html>