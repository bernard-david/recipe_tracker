package com.codingdojo.recipetracker.repositories;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import com.codingdojo.recipetracker.models.Recipe;

public interface RecipeRepository extends CrudRepository<Recipe, Long>{
	
	List<Recipe> findAll();
	
	
	
}
