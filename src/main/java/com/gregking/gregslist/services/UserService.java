package com.gregking.gregslist.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.gregking.gregslist.models.LoggedInUser;
import com.gregking.gregslist.models.User;
import com.gregking.gregslist.repositories.UserRepository;


@Service
public class UserService {
	@Autowired
    private UserRepository userRepo;
    
    public User register(User newUser, BindingResult result) {
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
    	if(potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "That account already exists. Please log in.");
    	}
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm", "Matches", "Passwords do not match.");
    	}
    	if(result.hasErrors()) {
    		return null;    		
    	}
    	String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashedPassword);
    	return userRepo.save(newUser);
    }
    
    
    public User login(LoggedInUser newLoginObject, BindingResult result) {
    	Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
    	if(!potentialUser.isPresent()) {
    		result.rejectValue("email","Matches", "Email not found. Please Register.");
    		return null;
    	}
    	User user = potentialUser.get();
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    		result.rejectValue("password","Matches", "Invalid login.");
    	}
    	if(result.hasErrors()) {
    		return null;
    	}else {
    		return user;
    	}
    	
    }
    
    public User getLoggedInUser(Long id) {
    	Optional<User> potentialUser = userRepo.findById(id);
    	if(potentialUser.isPresent()) {
    		return potentialUser.get();
    	}
    	return null;
    }

}
