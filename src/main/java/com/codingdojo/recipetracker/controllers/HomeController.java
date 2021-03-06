package com.codingdojo.recipetracker.controllers;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.recipetracker.models.Ingredient;
import com.codingdojo.recipetracker.models.LoginUser;
import com.codingdojo.recipetracker.models.Recipe;
import com.codingdojo.recipetracker.models.User;
import com.codingdojo.recipetracker.services.IngredientService;
import com.codingdojo.recipetracker.services.RecipeService;
import com.codingdojo.recipetracker.services.UserService;

@Controller
public class HomeController {
    
    @Autowired
    private UserService userServ;
    @Autowired
    private RecipeService recipeServ;
    @Autowired
    private IngredientService ingredientServ;
    
    public Long userSessionId(HttpSession session) {
    	if(session.getAttribute("user_id") == null)
    		return null;
    	return (Long)session.getAttribute("user_id");
    }
    
    
//    ------------------------------------------------------------------------------
//    Main Home Page
//    ------------------------------------------------------------------------------
    
    @GetMapping("/home")
    public String homePage(Model model, HttpSession session) {
    	Long userId = this.userSessionId(session);
    	if(userId == null) {
    		return "redirect:/";
    	}
    	User user = userServ.getUser(userId);
    	model.addAttribute("user", user);
    	List<Recipe> otherRecipe = recipeServ.findRecipeNotInUser(userId);
    	List<Recipe> recipeOrderedByDesc = recipeServ.getRecipeDescOrder();
    	model.addAttribute("recent", recipeOrderedByDesc);
    	model.addAttribute("otherRecipe", otherRecipe);
        return "/home/index.jsp";
    }
    
//    ------------------------------------------------------------------------------
    
    
//    ------------------------------------------------------------------------------
//    New Recipe Page
//    ------------------------------------------------------------------------------
    
    @GetMapping("/new-recipe")
    public String newRecipePage(Model model, HttpSession session, @ModelAttribute("newRecipe") Recipe newRecipe) {
    	Long userId = this.userSessionId(session);
    	if(userId == null) {
    		return "redirect:/";
    	}
    	model.addAttribute("user",userServ.getUser(userId));
        return "/recipes/newrecipe.jsp";
    }
    
    @PostMapping("/recipes/create")
    public String createRecipe(@Valid @ModelAttribute("newRecipe") Recipe newRecipe, 
            BindingResult result, Model model, HttpSession session, @ModelAttribute("newIngredient") Ingredient newIngredient) {
        if(result.hasErrors()) {
            return "/recipes/newrecipe.jsp";
        }
        
        Recipe r = recipeServ.createRecipe(newRecipe);
        session.setAttribute("recipe_id", r.getId());
        return "redirect:/new-ingredient";
    }
    
    
//    ------------------------------------------------------------------------------
//    New Ingredients
//    ------------------------------------------------------------------------------
    
    @GetMapping("/new-ingredient")
    public String newIngredients(Model model, HttpSession session, @ModelAttribute("newIngredient") Ingredient newIngredient) {
    	Long userId = this.userSessionId(session);
    	if(userId == null) {
    		return "redirect:/";
    	}
        return "/recipes/newingredients.jsp";
    }
    
    @PostMapping("recipes/ingredient")
    public String createIngredient(@Valid @ModelAttribute("newIngredient") Ingredient newIngredient, 
            BindingResult result, Model model, HttpSession session) {
        if(result.hasErrors()) {
            return "/recipes/newingredients.jsp";
        }
        Recipe recipe = recipeServ.getRecipe((Long) session.getAttribute("recipe_id"));
        newIngredient.setRecipe(recipe);
        ingredientServ.createIngredient(newIngredient);
        recipe.getIngredients().add(newIngredient);
        recipeServ.createRecipe(recipe);
        return "redirect:/new-ingredient";
    }
    
    
    
//    ------------------------------------------------------------------------------
    
    
//    ------------------------------------------------------------------------------
//    Show Recipe
//    ------------------------------------------------------------------------------
    
    @GetMapping("/recipe/{id}")
    public String RecipePage(@PathVariable("id") Long id,Model model, HttpSession session) {
    	Long userId = this.userSessionId(session);
    	if(userId == null) {
    		return "redirect:/";
    	}
    	model.addAttribute("recipe", recipeServ.getRecipe(id));
    	model.addAttribute("user", userServ.getUser(userId));
        return "/recipes/showrecipe.jsp";
    }
    
//    ------------------------------------------------------------------------------
    
    
    
//  ------------------------------------------------------------------------------
//  Show All Recipe
//  ------------------------------------------------------------------------------
  
  @GetMapping("/recipes")
  public String newRecipePage(Model model, HttpSession session) {
  	Long userId = this.userSessionId(session);
  	if(userId == null) {
  		User user = userServ.getUser(userId);
  		model.addAttribute("user", user);
  		return "redirect:/";
  	}
  	User user = userServ.getUser(userId);
  	model.addAttribute("user", user);
      return "/recipes/allrecipes.jsp";
  }
  

    
  
//------------------------------------------------------------------------------
// Edit Recipe
//------------------------------------------------------------------------------
    
  @GetMapping("/recipe/edit/{id}")
  public String editRecipe(@ModelAttribute("recipe") Recipe recipe, Model model, HttpSession session, @PathVariable("id") Long id) {
	  Long userId = this.userSessionId(session);
	  if(userId == null) {
	  		User user = userServ.getUser(userId);
	  		model.addAttribute("user", user);
	  		return "redirect:/";
	  	}
	  	User user = userServ.getUser(userId);
	  	model.addAttribute("user", user);
	  	model.addAttribute("recipe", recipeServ.getRecipe(id));
	  	session.setAttribute("updaterecipeId", id);
	  	return "/recipes/editrecipe.jsp";
  }
  
  @RequestMapping("/ingredient/{id}/delete")
  public String deleteIngredient(@PathVariable("id") Long ingredientId, HttpSession session) {
	  Long recipeId = (Long) session.getAttribute("updaterecipeId");
	  Recipe recipe = recipeServ.getRecipe(recipeId);
	  Ingredient ingredient = ingredientServ.getIngredient(ingredientId);
	  ingredientServ.deleteIngredient(ingredientId);
	  // for safe measure >>	  
	  recipe.getIngredients().remove(ingredient);
	  recipeServ.createRecipe(recipe);
	  return "redirect:/recipe/edit/" + recipe.getId();
  }
  
  @PostMapping("/recipe/update/{id}")
  public String updateRecipe(@Valid @ModelAttribute("recipe") Recipe recipe, BindingResult result, @PathVariable("id") Long id){
	  if(result.hasErrors()) {
			return "/recipes/editrecipe.jsp";
		}
	  else {
		  recipeServ.createRecipe(recipe);
		  
		  return "redirect:/recipes";
	  }
	  
  }
  
//------------------------------------------------------------------------------
    
//------------------------------------------------------------------------------
//		Like/Unlike routes
//------------------------------------------------------------------------------
  
  @GetMapping("/like/{id}")
  public String like(@PathVariable("id") Long recipeId, HttpSession session, Model model) {
	  Long userId = this.userSessionId(session);
	  recipeServ.add(recipeId, userId);
	  return "redirect:/recipe/{id}";
  }
  
  @GetMapping("/unlike/{id}")
  public String unlike(@PathVariable("id") Long recipeId, HttpSession session, Model model) {
	  Long userId = this.userSessionId(session);
	  recipeServ.remove(recipeId, userId);
	  return "redirect:/recipe/{id}";
  }
    
    
//    ------------------------------------------------------------------------------
//    Login Page
//    ------------------------------------------------------------------------------
    
    @GetMapping("/")
    public String loginPage(Model model) {
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/home";
    }
//    ------------------------------------------------------------------------------
    
    
//    ------------------------------------------------------------------------------
//    Registration
//    ------------------------------------------------------------------------------
    
    @GetMapping("/registerUser")
    public String registerPage(Model model) {
    	model.addAttribute("newUser", new User());
        return "register.jsp";
    }
    
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "register.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/home";
    }
    
//    ------------------------------------------------------------------------------
//    Logout
//    ------------------------------------------------------------------------------
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
   	 	return "redirect:/";
    }
    
}

//	  ------------------------------------------------------------------------------