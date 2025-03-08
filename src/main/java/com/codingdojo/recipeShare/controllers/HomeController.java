package com.codingdojo.recipeShare.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

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
		if(userId == null) {
			return "redirect:/";
		}else {
			List<Recipe> recipes = recipeService.allRecipes();
			model.addAttribute("recipes", recipes);
			model.addAttribute("user", userService.getLoggedInUser(userId));
			return "home.jsp";
		}
	}
	
	@GetMapping("/recipe/new")
	public String newRecipe(@ModelAttribute("recipe") Recipe recipe, Model model, HttpSession session ) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		return "recipe.jsp";
	}
	
	@PostMapping("/recipe/new")
	public String createRecipe(@Valid @ModelAttribute("recipe") Recipe recipe, BindingResult result, Model model,
			HttpSession session) {
		if(result.hasErrors()) {
			return "recipe.jsp";
		}else {
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findOneUser(userId);
			recipe.setUser(user);
			recipeService.createRecipe(recipe);
			return "redirect:/home";
		}
	}
	
	@GetMapping("/recipe/{id}")
	public String showOne(@PathVariable("id") Long id, @ModelAttribute("user") User user, Model model,
			HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		model.addAttribute("user", user);
		model.addAttribute("recipe", recipeService.findRecipe(id));
		return "show.jsp";
	}
	
	@GetMapping("/recipe/{id}/update")
	public String updateRecipe(@PathVariable("id") Long id, Model model, 
			HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		model.addAttribute("recipe", recipeService.findRecipe(id));
		return "update.jsp";
	}
	
	@PutMapping("/recipe/{id}/update")
	public String updateRecipe(@PathVariable("id") Long id, @Valid @ModelAttribute("recipe") Recipe recipe, BindingResult result, Model model, 
			HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("recipe", recipeService.findRecipe(id));
			return "update.jsp";
		}
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findOneUser(userId);
		recipe.setUser(user);
		recipeService.updateRecipe(recipe);
		return "redirect:/home";
	}
	
	@DeleteMapping("/recipe/{id}/delete")
	public String deleteRecipe(@PathVariable("id") Long id) {
		recipeService.deleteRecipe(id);
		return "redirect:/home";
	}

}
