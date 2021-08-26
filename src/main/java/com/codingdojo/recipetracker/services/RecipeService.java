package com.codingdojo.recipetracker.services;

import java.util.List;
import java.util.Optional;

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
	
	public List<Recipe> getRecipeDescOrder(){
		List<Recipe> recipe = this.recipeRepo.findAllByOrderByCreatedAtDesc();
		return recipe;
	}
	
//	public Optional<Recipe> getOtherRecipe(User user){
//		Optional<Recipe> recipe = this.recipeRepo.findAllByCreatorNotContains(user);
//		System.out.println(recipe);
//		if(recipe.isPresent()) {
//			return recipe;
//		} else {
//  			return null;
//  		}
//	}
	
	public List<Recipe> findRecipeNotInUser(Long id) {
		return recipeRepo.findByCreatorNotContaining(id);
	}
	
	
	public Recipe createRecipe(Recipe newRecipe) {
		return recipeRepo.save(newRecipe);
	}
	
}