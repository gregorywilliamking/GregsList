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
		<h2>Edit Furniture Entry</h2>
		<div class="form-control">
		<p class="text-danger">
			<c:out value="${error}"/>
		</p>
		<form:form action="/update/furniture/${furniture.id}" method="post" modelAttribute="furniture">
			<input type="hidden" name="_method" value="put" /> 
			<div class="mt-3 mb-3 form-control">
				<form:label path="type">Furnture Type:</form:label>
				<form:input type="text" path="type" class="form-control"/>
				<form:errors class="text-danger" path="type" />
			</div>
			<div class="mt-3 mb-3 form-control">
				<form:label path="city">City:</form:label>
				<form:input type="text" path="city" class="form-control"/>
				<form:errors class="text-danger" path="city" />
			</div>
			<div class="mt-3 mb-3 form-control">
				<form:label path="phone">Phone Number:</form:label>
				<form:input type="number" path="phone" class="form-control"/>
				<form:errors class="text-danger" path="phone" />
			</div>
			<div class="mt-3 mb-3 form-control">
				<form:label path="description">Description:</form:label>
				<form:input type="text" path="description" class="form-control"/>
				<form:errors class="text-danger" path="description" />
			</div>
			<button class="btn btn-success">Submit</button>
		</form:form>
		</div>
	</div>

</body>
</html>