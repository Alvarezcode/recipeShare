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
    <title>Update Recipe</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <h1 class="main-header">Update Your Recipe</h1>

    <div class="button-group">
        <a href="/home" class="btn home-btn">Home</a>
        <a href="/logout" class="btn logout-btn">Logout</a>
    </div>

    <div class="form-container">
        <form:form action="/recipe/${recipe.id}/update" method="post" modelAttribute="recipe">
            <input type="hidden" name="_method" value="PUT" />

            <label for="recipeType">Recipe Type:</label><br/>
            <select id="recipeType" name="recipeType">
                <option value="">--Select--</option>
                <option value="indian"
                    <c:if test="${recipe.recipeType == 'indian'}">selected</c:if>>Indian</option>
                <option value="mexican"
                    <c:if test="${recipe.recipeType == 'mexican'}">selected</c:if>>Mexican</option>
                <option value="chinese"
                    <c:if test="${recipe.recipeType == 'chinese'}">selected</c:if>>Chinese</option>
                <option value="italian"
                    <c:if test="${recipe.recipeType == 'italian'}">selected</c:if>>Italian</option>
                <option value="japanese"
                    <c:if test="${recipe.recipeType == 'japanese'}">selected</c:if>>Japanese</option>
                <option value="greek"
                    <c:if test="${recipe.recipeType == 'greek'}">selected</c:if>>Greek</option>
                <option value="thai"
                    <c:if test="${recipe.recipeType == 'thai'}">selected</c:if>>Thai</option>
                <option value="american"
                    <c:if test="${recipe.recipeType == 'american'}">selected</c:if>>American</option>
            </select>
            <br/>
            <form:errors path="recipeType" cssClass="error-msg"/>
            <br/><br/>

            <label for="recipeName">Name:</label><br/>
            <input type="text" id="recipeName" name="recipeName"
                   value="<c:out value='${recipe.recipeName}'/>">
            <br/>
            <form:errors path="recipeName" cssClass="error-msg"/>
            <br/><br/>

            <label for="prepTime">Prep Time:</label><br/>
            <input type="text" id="prepTime" name="prepTime"
                   value="<c:out value='${recipe.prepTime}'/>">
            <br/>
            <form:errors path="prepTime" cssClass="error-msg"/>
            <br/><br/>

            <label for="cookTime">Cook Time:</label><br/>
            <input type="text" id="cookTime" name="cookTime"
                   value="<c:out value='${recipe.cookTime}'/>">
            <br/>
            <form:errors path="cookTime" cssClass="error-msg"/>
            <br/><br/>

            <label for="description">Description:</label><br/>
            <!-- On same line to avoid whitespace -->
            <textarea id="description" name="description" rows="3" cols="30"><c:out value="${recipe.description}" /></textarea>
            <br/>
            <form:errors path="description" cssClass="error-msg"/>
            <br/><br/>

            <label for="ingredients">Ingredients:</label><br/>
            <textarea id="ingredients" name="ingredients" rows="3" cols="30"><c:out value="${recipe.ingredients}" /></textarea>
            <br/>
            <form:errors path="ingredients" cssClass="error-msg"/>
            <br/><br/>

            <label for="directions">Directions:</label><br/>
            <textarea id="directions" name="directions" rows="3" cols="30"><c:out value="${recipe.directions}" /></textarea>
            <br/>
            <form:errors path="directions" cssClass="error-msg"/>
            <br/><br/>

            <button type="submit" class="btn submit-btn">Update</button>
        </form:form>
    </div>
</body>
</html>
