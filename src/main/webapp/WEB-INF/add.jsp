<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Recipe</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <h1 class="main-header">Make Something Good</h1>
    
    <div class="button-group">
        <a href="/home" class="btn home-btn">Home</a>
        <a href="/logout" class="btn logout-btn">Logout</a>
    </div>

    <div class="form-container">
        <form:form action="/recipe/new" method="post" modelAttribute="recipe">

            <label for="recipeType">Recipe Type:</label><br/>
            <select id="recipeType" name="recipeType">
                <option value="">--Select--</option>
                <option value="indian">Indian</option>
                <option value="mexican">Mexican</option>
                <option value="chinese">Chinese</option>
                <option value="italian">Italian</option>
                <option value="japanese">Japanese</option>
                <option value="greek">Greek</option>
                <option value="thai">Thai</option>
                <option value="american">American</option>
            </select>
            <br/>
            <form:errors path="recipeType" cssClass="error-msg"/>
            <br/><br/>

            <label for="recipeName">Name:</label><br/>
            <input type="text" id="recipeName" name="recipeName">
            <br/>
            <form:errors path="recipeName" cssClass="error-msg"/>
            <br/><br/>

            <label for="prepTime">Prep Time:</label><br/>
            <input type="text" id="prepTime" name="prepTime">
            <br/>
            <form:errors path="prepTime" cssClass="error-msg"/>
            <br/><br/>

            <label for="cookTime">Cook Time:</label><br/>
            <input type="text" id="cookTime" name="cookTime">
            <br/>
            <form:errors path="cookTime" cssClass="error-msg"/>
            <br/><br/>

            <label for="description">Description:</label><br/>
            <textarea id="description" name="description" rows="3" cols="30"></textarea>
            <br/>
            <form:errors path="description" cssClass="error-msg"/>
            <br/><br/>

            <label for="ingredients">Ingredients:</label><br/>
            <textarea id="ingredients" name="ingredients" rows="3" cols="30"></textarea>
            <br/>
            <form:errors path="ingredients" cssClass="error-msg"/>
            <br/><br/>

            <label for="directions">Directions:</label><br/>
            <textarea id="directions" name="directions" rows="3" cols="30"></textarea>
            <br/>
            <form:errors path="directions" cssClass="error-msg"/>
            <br/><br/>

            <button type="submit" class="btn submit-btn">Submit</button>
        </form:form>
    </div>
</body>
</html>
