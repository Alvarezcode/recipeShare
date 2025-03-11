package com.codingdojo.recipeShare.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.codingdojo.recipeShare.models.Recipe;
import com.codingdojo.recipeShare.models.User;
import com.codingdojo.recipeShare.services.RecipeService;
import com.codingdojo.recipeShare.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {

    @Autowired
    UserService userService;

    @Autowired
    RecipeService recipeService;

    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        List<Recipe> recipes = recipeService.allRecipes();
        model.addAttribute("recipes", recipes);
        model.addAttribute("user", userService.getLoggedInUser(userId));
        return "home.jsp";
    }

    @GetMapping("/recipe/new")
    public String newRecipe(@ModelAttribute("recipe") Recipe recipe, HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        model.addAttribute("user", userService.getLoggedInUser(userId));
        return "add.jsp";
    }

    @PostMapping("/recipe/new")
    public String createRecipe(@Valid @ModelAttribute("recipe") Recipe recipe, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "add.jsp";
        }
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        User user = userService.findOneUser(userId);
        recipe.setUser(user);
        recipeService.createRecipe(recipe);
        return "redirect:/home";
    }

    @GetMapping("/recipe/{id}")
    public String viewRecipe(@PathVariable("id") Long recipeId, HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        Recipe recipe = recipeService.findRecipe(recipeId);
        if (recipe == null) {
            return "redirect:/home";
        }
        model.addAttribute("recipe", recipe);
        model.addAttribute("user", userService.getLoggedInUser(userId));
        return "show.jsp";
    }

    @GetMapping("/recipe/{id}/update")
    public String editRecipe(@PathVariable("id") Long recipeId, HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        Recipe recipe = recipeService.findRecipe(recipeId);
        if (recipe == null || !recipe.getUser().getId().equals(userId)) {
            return "redirect:/home";
        }
        model.addAttribute("recipe", recipe);
        return "update.jsp";
    }

    @PutMapping("/recipe/{id}/update")
    public String updateRecipe(@PathVariable("id") Long recipeId, @Valid @ModelAttribute("recipe") Recipe recipe,
                               BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "update.jsp";
        }
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        Recipe existingRecipe = recipeService.findRecipe(recipeId);
        if (existingRecipe == null || !existingRecipe.getUser().getId().equals(userId)) {
            return "redirect:/home";
        }
        recipe.setUser(existingRecipe.getUser());
        recipeService.updateRecipe(recipe);
        return "redirect:/home";
    }

    @DeleteMapping("/recipe/{id}/delete")
    public String deleteRecipe(@PathVariable("id") Long recipeId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        Recipe recipe = recipeService.findRecipe(recipeId);
        if (recipe == null || !recipe.getUser().getId().equals(userId)) {
            return "redirect:/home";
        }
        recipeService.deleteRecipe(recipeId);
        return "redirect:/home";
    }
}
