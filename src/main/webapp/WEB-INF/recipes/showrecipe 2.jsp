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
<title>${recipen.name}</title>
</head>
<body>
<div class="container">
	<div>
		<img src="${recipe.picture}" alt="recipe image" width="500" height="600">
		<button>Like</button>
		<button>Share</button>
		<button>Edit</button>	
	</div>
	<div>
		<h1>${recipe.name}</h1>
		<p>By: {recipe.creator.user_name}</p>
	</div>
</div>

</body>
</html>