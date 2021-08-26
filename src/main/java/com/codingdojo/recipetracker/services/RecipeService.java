package com.codingdojo.recipetracker.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.recipetracker.models.Recipe;
import com.codingdojo.recipetracker.models.User;
import com.codingdojo.recipetracker.repositories.RecipeRepository;

@Service
public class RecipeService {
	
	private RecipeRepository recipeRepo;

	public RecipeService(RecipeRepository recipeRepo) {
		this.recipeRepo = recipeRepo;
	}
	
	public List<Recipe> getRecipe() {
		return this.recipeRepo.findAll();
	}
	
	public Recipe getRecipe(Long id) {
		return this.recipeRepo.findById(id).orElse(null);
	}
	
	public List<Recipe> getRecipeAscOrder(){
		List<Recipe> recipe = this.recipeRepo.findAllByOrderByCreatedAtAsc();
		return recipe;
	}
	

	
	
	public Recipe createRecipe(Recipe newRecipe) {
		return recipeRepo.save(newRecipe);
	}
	
}