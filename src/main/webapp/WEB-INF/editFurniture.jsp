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
		<a href="/homepage">Dashboard</a>
		<p class="text-danger">
			<c:out value="${error}"/>
		</p>
		<form:form action="/update/furniture/${furniture.id}" method="post" modelAttribute="furniture">
			<input type="hidden" name="_method" value="put" /> 
			<div>
				<form:label path="type">Furnture Type:</form:label>
				<form:input type="text" path="type" />
				<form:errors class="text-danger" path="type" />
			</div>
			<div>
				<form:label path="city">City:</form:label>
				<form:input type="text" path="city" />
				<form:errors class="text-danger" path="city" />
			</div>
			<div>
				<form:label path="phone">Phone Number:</form:label>
				<form:input type="number" path="phone" />
				<form:errors class="text-danger" path="phone" />
			</div>
			<div>
				<form:label path="description">Description:</form:label>
				<form:input type="text" path="description" />
				<form:errors class="text-danger" path="description" />
			</div>
			<button class="btn btn-success">Submit</button>
		</form:form>
	</div>

</body>
</html>