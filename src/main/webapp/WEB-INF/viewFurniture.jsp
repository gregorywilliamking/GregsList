<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>GregsList</title>
</head>
<body>
	<div class="container">
		<div class="text-end">
			<h1 class="text-primary">GregsList</h1>
			<a class="btn btn-dark" href="/homepage">Home</a>
		</div>
		<h2 class="text-center p-2">
			<c:out value="${furniture.type}" />
		</h2>
		<div class="card mt-3 mb-3">
		<h3 class="mt-3 p-2">
			Furniture Type:
		</h3>
			<c:out value="${furniture.type}" />
		<h3 class="mt-3 mb-3">Added By:</h3>
			<c:out value="${furniture.user.firstName} ${furniture.user.lastName}" />
		<h3>
			City:
		</h3>
			<c:out value="${furniture.city}" />
		<h3 class="p-2">
			Phone Number:
		</h3>
			<c:out value="${furniture.phone}" />
		<h3>
			Description:
		</h3>
			<c:out value="${furniture.description}" />
		<c:if test="${userId == furniture.user.id}">
			<div>
				<a href="/edit/furniture/${furniture.id}" class="btn btn-warning mt-3 mb-3">Edit</a>
				<form action="/delete/furniture/${furniture.id}" method="post">
					<input type="hidden" name="_method" value="delete" /> <input
					type="submit" value="Delete" class="btn btn-danger" />
				</form>
			</div>
		</c:if>
		</div>
	</div>

</body>
</html>