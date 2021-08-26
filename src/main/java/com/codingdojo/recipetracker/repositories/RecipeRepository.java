package com.codingdojo.recipetracker.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.recipetracker.models.Recipe;
import com.codingdojo.recipetracker.models.User;



@Repository
public interface RecipeRepository extends CrudRepository<Recipe, Long>{
	
	List<Recipe> findAll();
	
	@Query(value="SELECT * FROM Recipes order by created_at desc limit 5", nativeQuery=true)
	List<Recipe> findAllByOrderByCreatedAtDesc();
	
//	Optional<Recipe> findAllByCreatorNotContains(User user);
	List<Recipe> findByCreatorNotContains(User user);

}
