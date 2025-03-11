<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <title>Login/Register</title>
</head>
<body>

    <h1 class="auth-title">Recipe Share</h1>
    <h4 class="auth-subtitle">Join Us</h4>
    
    
    <div class="auth-container">
        <h2><strong>Register</strong></h2>
        <form:form action="/register" method="post" modelAttribute="newUser">
            <div class="auth-field">
                <form:label path="userName">User Name:</form:label>
                <form:errors path="userName" class="text-danger"/>
                <form:input path="userName"/>
            </div>

            <div class="auth-field">
                <form:label path="email">Email:</form:label>
                <form:errors path="email" class="text-danger"/>
                <form:input path="email"/>
            </div>

            <div class="auth-field">
                <form:label path="password">Password:</form:label>
                <form:errors path="password" class="text-danger"/>
                <form:input path="password" type="password"/>
            </div>

            <div class="auth-field">
                <form:label path="confirm">Confirm Password:</form:label>
                <form:errors path="confirm" class="text-danger"/>
                <form:input path="confirm" type="password"/>
            </div>

            <button type="submit" class="auth-submit-btn">Submit</button>
        </form:form>
    </div>
    
    
    <div class="auth-container">
        <h2><strong>Login</strong></h2>
        <form:form action="/login" method="post" modelAttribute="newLogin">
            <div class="auth-field">
                <form:label path="email">Email:</form:label>
                <form:errors path="email" class="text-danger"/>
                <form:input path="email"/>
            </div>

            <div class="auth-field">
                <form:label path="password">Password:</form:label>
                <form:errors path="password" class="text-danger"/>
                <form:input path="password" type="password"/>
            </div>

            <button type="submit" class="auth-submit-btn">Submit</button>
        </form:form>
    </div>

</body>
</html>
