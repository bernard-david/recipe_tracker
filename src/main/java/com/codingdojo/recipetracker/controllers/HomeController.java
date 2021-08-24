package com.codingdojo.recipetracker.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.recipetracker.models.LoginUser;
import com.codingdojo.recipetracker.models.User;
import com.codingdojo.recipetracker.services.UserService;

@Controller
public class HomeController {
    
    @Autowired
    private UserService userServ;
    
    public Long userSessionId(HttpSession session) {
    	if(session.getAttribute("user_id") == null)
    		return null;
    	return (Long)session.getAttribute("user_id");
    }
    
    
    @GetMapping("/home")
    public String homePage(Model model, HttpSession session) {
    	Long userId = this.userSessionId(session);
    	if(userId == null) {
    		return "redirect:/";
    	}
        return "/home/index.jsp";
    }
    
    
    @GetMapping("/")
    public String loginPage(Model model) {
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    
    
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
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
   	 	return "redirect:/";
    }
    
}
