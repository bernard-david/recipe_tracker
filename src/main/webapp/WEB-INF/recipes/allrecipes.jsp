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
	<div class="container">
	<h1>My Recipes</h1>
	<c:forEach items="${recipes}" var="recipe">
		<div class="card" style="width: 18rem;">
			<h4><c:out value="${recipe.name}"/></h4>
			<p><c:out value="${recipe.category}"/></p>
			<p><c:out value="${recipe.dietRequirement}"/></p>
			<p><c:out value="${recipe.description}"/></p>
			<p>
				<c:choose>
					<c:when test="${recipe.under30}">
						Yes
					</c:when>
					<c:otherwise>
						No
					</c:otherwise>
				</c:choose>
			</p>
			<p><c:out value="${recipe.prepTime}"/> minutes</p>
			<p><c:out value="${recipe.cookTime}"/> minutes</p>
		</div>
	</c:forEach>
	
	</div>
</body>
</html>