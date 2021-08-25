package com.codingdojo.recipetracker.controllers;

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

import com.codingdojo.recipetracker.models.LoginUser;
import com.codingdojo.recipetracker.models.Recipe;
import com.codingdojo.recipetracker.models.User;
import com.codingdojo.recipetracker.services.RecipeService;
import com.codingdojo.recipetracker.services.UserService;

@Controller
public class HomeController {
    
    @Autowired
    private UserService userServ;
    @Autowired
    private RecipeService recipeServ;
    
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
        return "/recipes/newrecipe.jsp";
    }
    
    @PostMapping("/recipes/create")
    public String createRecipe(@Valid @ModelAttribute("newRecipe") Recipe newRecipe, 
            BindingResult result, Model model, HttpSession session) {
        if(result.hasErrors()) {
            return "/recipes/newrecipe.jsp";
        }
        
        return "redirect:/new-recipe";
    }
    
    
//    ------------------------------------------------------------------------------
    
    
//    ------------------------------------------------------------------------------
//    Show Recipe
//    ------------------------------------------------------------------------------
    
    @GetMapping("/recipe/{id}")
    public String newRecipePage(@PathVariable("id") Long id,Model model, HttpSession session) {
    	Long userId = this.userSessionId(session);
    	if(userId == null) {
    		return "redirect:/";
    	}
    	model.addAttribute("recipe", recipeServ.getRecipe(id));
        return "/recipes/showrecipe.jsp";
    }
    
//    ------------------------------------------------------------------------------
    
    
    
    
    
    
    
    
    
    
    
    
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