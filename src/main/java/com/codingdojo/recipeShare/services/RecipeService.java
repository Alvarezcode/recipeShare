package com.codingdojo.recipeShare.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.recipeShare.models.Recipe;
import com.codingdojo.recipeShare.repositories.RecipeRepository;

@Service
public class RecipeService {
	@Autowired
	RecipeRepository recipeRepository;
	
	public RecipeService(RecipeRepository recipeRepository) {
		this.recipeRepository = recipeRepository;
	}
	
	public List<Recipe> allRecipes() {
		return recipeRepository.findAll();
		
	}
	
	public Recipe createRecipe(Recipe recipe) {
		return recipeRepository.save(recipe);
	}
	
	//retrieves a recipe 
	public Recipe findRecipe(Long id) {
		Optional<Recipe> optionalRecipe = recipeRepository.findById(id);
		if(optionalRecipe.isPresent()) {
			return optionalRecipe.get();
		}else {
			return null;
		}
		
	}
	//deletes a recipe
	public void deleteRecipe(Long id) {
		recipeRepository.deleteById(id);
	}
	//edit recipe
	public void updateRecipe(Recipe recipe) {
		recipeRepository.save(recipe);
	}

}
