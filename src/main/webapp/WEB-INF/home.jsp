<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <h1 class="main-header">Welcome, <c:out value="${user.userName}" />!</h1>
    <h3 class="sub-header">Explore our Recipes or Add Your Own</h3>
    <div class="button-group">
        <a href="/recipe/new" class="btn add-btn">Add Recipe</a>
        <a href="/logout" class="btn logout-btn">Logout</a>
    </div>

    <table class="recipe-table">
        <thead>
            <tr>
                <th>Recipe Type</th>
                <th>Name</th>
                <th>Prep Time</th>
                <th>Cook Time</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="recipe" items="${recipes}">
                <tr>
                    <td>
                        <a href="/recipe/${recipe.id}">
                            <c:out value="${recipe.recipeType}" />
                        </a>
                    </td>
                    <td><c:out value="${recipe.recipeName}" /></td>
                    <td><c:out value="${recipe.prepTime}" /></td>
                    <td><c:out value="${recipe.cookTime}" /></td>
                    <td>
                    <c:if test="${recipe.user.id == userId }">
                        <a href="/recipe/${recipe.id}/update" class="btn edit-btn">Edit</a>
                        <form action="/recipe/${recipe.id}/delete" method="post" style="display:inline;">
                            <input type="hidden" name="_method" value="DELETE" />
                            <button type="submit" class="btn delete-btn">Delete</button>
                        </form>
                    </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
