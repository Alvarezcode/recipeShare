<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Recipe</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <h1 class="main-header"><c:out value="${recipe.recipeName}" /></h1>

    <div class="button-group">
        <a href="/home" class="btn home-btn">Home</a>
        <a href="/logout" class="btn logout-btn">Logout</a>
    </div>

    <div class="recipe-info">
        <span>Recipe: <c:out value="${recipe.recipeType}" /></span>
        <span>Prep Time: <c:out value="${recipe.prepTime}" /></span>
        <span>Cook Time: <c:out value="${recipe.cookTime}" /></span>
    </div>

    <hr class="separator">

    <div class="recipe-details">
        <h2>Description</h2>
        <p><c:out value="${recipe.description}" /></p>

        <h2>Ingredients</h2>
        <p><c:out value="${recipe.ingredients}" /></p>

        <h2>Directions</h2>
        <p><c:out value="${recipe.directions}" /></p>
    </div>
</body>
</html>
