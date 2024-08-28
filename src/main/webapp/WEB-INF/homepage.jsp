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
	<div class="container text-center">
		<div class="text-end">
			<h1 class="text-end text-primary">GregsList</h1>
			<a class="btn btn-dark" href="/logout">Logout</a>
		</div>
		<h2 class="text-success mt-3 mb-3">
			Welcome,
			<c:out value="${user.firstName}" />!
		</h2>

		<table class="table">
			<tr>
				<th>Furniture Type</th>
				<th>City</th>
				<th>Phone Number</th>
			</tr>
			<c:forEach var="furniture" items="${furnitures}">
				<tr>
					<td><a href="/view/furniture/${furniture.id}"> <c:out
								value="${furniture.type}" /></a></td>
					<td><c:out value="${furniture.city}"></c:out></td>
					<td><c:out value="${furniture.phone}"></c:out></td>
				</tr>
			</c:forEach>
		</table>
		<a href="/new/furniture" class="btn btn-primary">Add Furniture</a>
	</div>

</body>
</html>