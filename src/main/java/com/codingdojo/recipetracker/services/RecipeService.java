package com.codingdojo.recipetracker.services;

import java.util.List;

import com.codingdojo.recipetracker.models.Recipe;
import com.codingdojo.recipetracker.repositories.RecipeRepository;

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
	
}