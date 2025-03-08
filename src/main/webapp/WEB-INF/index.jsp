<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Login/Register</title>
</head>
<body>
	<div class="container text-center" >
		<h1>Welcome Human</h1>
		<h4>Join Us</h4>
	<h2>Register</h2>
	<form:form action="/register" method="post" modelAttribute="newUser">
		<div>
			<form:label path="userName">User Name:</form:label>
			<form:errors path="userName" class="text-danger"></form:errors>
			<form:input class="w-100" path="userName"/>
		</div>
		<div>
			<form:label path="email">Email:</form:label>
			<form:errors path="email" class="text-danger"></form:errors>
			<form:input class="w-100" path="email"/>
		</div>
		<div>
			<form:label path="password">Password:</form:label>
			<form:errors path="password" class="text-danger"></form:errors>
			<form:input class="w-100" path="password" type="password"/>
		</div>
		<div>
			<form:label path="confirm">Confirm Password:</form:label>
			<form:errors path="confirm" class="text-danger"></form:errors>
			<form:input class="w-100" path="confirm" type="password"/>
		</div>
			<button>Submit</button>
	</form:form>
	</div>
	
	<div class="container text-center">
		<h2>Login</h2>
		<form:form action="/login" method="post" modelAttribute="newLogin">
		<div>
			<form:label path="email">Email:</form:label>
			<form:errors path="email" class="text-danger"></form:errors>
			<form:input class="w-100" path="email"/>
		</div>
		<div>
			<form:label path="password">Password:</form:label>
			<form:errors path="password" class="text-danger"></form:errors>
			<form:input class="w-100" path="password" type="password"/>
		</div>
			<button>Submit</button>
		</form:form>
	
	</div>
	
</body>
</html>