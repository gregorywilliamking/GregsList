package com.gregking.gregslist.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.gregking.gregslist.models.LoggedInUser;
import com.gregking.gregslist.models.User;
import com.gregking.gregslist.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	@Autowired
	UserService users;
	
    
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoggedInUser());
        return "index.jsp";
    }
    
    @PostMapping("/register/user")
    public String registerUser(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, HttpSession session, Model model) {
    	users.register(newUser, result);
    	if(result.hasErrors()) {
    		model.addAttribute("newLogin", new LoggedInUser());
    		return "index.jsp";
    	}else {
    		session.setAttribute("userId", newUser.getId());
    		return "redirect:/homepage";
    	}
    }
    
    @PostMapping("/login/user")
    public String loginUser(@Valid @ModelAttribute("newLogin") LoggedInUser newLogin, BindingResult result, HttpSession session, Model model) {
    	User user = users.login(newLogin, result);
    	if(result.hasErrors()) {
    		model.addAttribute("newUser", new User());
    		return "index.jsp";
    	}else {
    		session.setAttribute("userId", user.getId());
    		return "redirect:/homepage";
    	}
    }
    
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }


}
