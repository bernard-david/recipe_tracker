package com.codingdojo.recipetracker.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.recipetracker.models.Ingredient;
import com.codingdojo.recipetracker.models.Recipe;
import com.codingdojo.recipetracker.repositories.IngredientRepository;

@Service
public class IngredientService {
	
	private IngredientRepository ingredientRepo;

	public IngredientService(IngredientRepository ingredientRepo) {
		this.ingredientRepo = ingredientRepo;
	}
	
	public List<Ingredient> getIngredient() {
		return this.ingredientRepo.findAll();
	}
	
	public Ingredient getIngredient(Long id) {
		return this.ingredientRepo.findById(id).orElse(null);
	}
	
	public void createIngredient(Ingredient newIngredient) {
		
		ingredientRepo.save(newIngredient);
	}
	
}