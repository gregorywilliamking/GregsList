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
		<h1 class="text-end text-primary">GregsList</h1>
		<h2 class="text-center">Register</h2>
		<div class="form">
			<form:form action="/register/user" method="post"
				modelAttribute="newUser">
				<div class="form-control mb-3">
					<form:label path="firstName">First Name</form:label>
					<form:errors class="text-danger" path="firstName" />
					<form:input path="firstName" class="form-control"/>
				</div>
				<div class="form-control mb-3">
					<form:label path="lastName">Last Name</form:label>
					<form:errors class="text-danger" path="lastName" />
					<form:input path="lastName" class="form-control"/>
				</div>
				<div class="form-control mb-3">
					<form:label path="email" class="form-label">Email</form:label>
					<form:errors class="text-danger" path="email" />
					<form:input path="email" class="form-control"/>
				</div>
				<div class="form-control mb-3">
					<form:label path="password">Password</form:label>
					<form:errors class="text-danger" path="password" />
					<form:input path="password" type="password" class="form-control"/>
				</div>
				<div class="form-control mb-3">
					<form:label path="confirm">Confirm Password</form:label>
					<form:errors class="text-danger" path="confirm" />
					<form:input path="confirm" type="password" class="form-control"/>
				</div>
				<div class="text-end">
					<button class="btn btn-success mx-auto">Register</button>
				</div>
			</form:form>
			<h2 class="mb-3 mt-3 text-center">Login</h2>
				<div class="form-control mb-3 mt-3">
					<form:form action="/login/user" method="post" modelAttribute="newLogin">
				<div class="form-control mb-3">
					<form:label path="email">Email</form:label>
					<form:errors class="text-danger" path="email" />
					<form:input path="email" class="form-control"/>
				</div>
				<div class="form-control mb-3">
					<form:label path="password">Password</form:label>
					<form:errors class="text-danger" path="password" />
					<form:input path="password" type="password" class="form-control" />
				</div>
				<div class="text-end">
					<button class="btn btn-success">Login</button>
				</div>
				</form:form>
				</div>
		</div>
	</div>

</body>
</html>