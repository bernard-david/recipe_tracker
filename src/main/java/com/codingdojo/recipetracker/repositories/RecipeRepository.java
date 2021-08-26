package com.codingdojo.recipetracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.recipetracker.models.Recipe;



@Repository
public interface RecipeRepository extends CrudRepository<Recipe, Long>{
	
	List<Recipe> findAll();
	
	List<Recipe> findAllById();

	List<Recipe> findByAgeOrderByCreated_atAsc();
	
}
