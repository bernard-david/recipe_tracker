<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	<title>Recipe Tracker</title>
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
	<div class="container">
	<h1>Welcome, <c:out value="${user.userName}"/></h1>
	<h3>Recently Added</h3>
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  
  <div class="carousel-inner">
  
    <c:forEach items="${ recent }" var="i">
		  	<c:if test="${recent[0] == i}">
		    <div class="carousel-item active" data-bs-interval="10000" style="height:400px;">
		    	<a href="/recipe/${i.id}">
		      <img src="${i.picture}" class="d-block w-100" alt="${i.name}">
		      </a>
		      <div class="carousel-caption d-none d-md-block">
		        <h5>${i.name}</h5>
		        <p>${i.description}</p>
		      </div>
		    </div>
		    </c:if>
		    <c:if test="${recent[0] != i }">
		    
		    <div class="carousel-item" data-bs-interval="10000" style="height:400px;">
		    <a href="/recipe/${i.id}">
		      <img src="${i.picture}" class="d-block w-100" alt="${i.name}">
		      </a>
		      <div class="carousel-caption d-none d-md-block">
		        <h5>${i.name}</h5>
		        <p>${i.description}</p>
		      </div>
		    </div>
		    </c:if>
	</c:forEach>
    
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
	
	
	
	<h3>Other User Recipes</h3>
	<div class="d-flex gap-3 flex-wrap">
	<c:forEach items="${ otherRecipe }" var="i">
		<div class="card" style="width: 18rem;">
				<a href="/recipe/${i.id}"><img src="${i.picture}" class="card-img-top" alt="" /></a>
				<div class="card-body">
					<h4><a href="/recipe/${i.id}"><c:out value="${i.name}"/></a></h4>
					<p><c:out value="${i.category}"/></p>
					<p>Diet Requirement: <c:out value="${i.dietRequirement}"/></p>
				</div>
			</div>
	</c:forEach>
	</div>
	</div>
</body>
</html>