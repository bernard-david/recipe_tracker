<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a href="/">My Account</a>
		<a href="/recipes">My Recipes</a>
		<a href="/logout">logout</a>
	</nav>
	<div>
		<a href="/new-recipe" class="btn btn-primary">Create Recipe</a>
	</div>
	<h1>Recently Added</h1>
	<c:forEach items="${ recent }" var="i">
		${i.name }
	</c:forEach>
	
	<h1>Other User Recipes</h1>
	<c:forEach items="${ otherRecipe }" var="i">
		${i.name }
	</c:forEach>
	</div>
</body>
</html>