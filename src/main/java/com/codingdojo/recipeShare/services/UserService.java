package com.codingdojo.recipeShare.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.recipeShare.models.LoginUser;
import com.codingdojo.recipeShare.models.User;
import com.codingdojo.recipeShare.repositories.UserRepository;



@Service
public class UserService {
	@Autowired
	UserRepository userRepo;
// TO-DO: Write register and login methods!
	public User register(User newUser, BindingResult result) {
		Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
		if(potentialUser.isPresent()) {
			result.rejectValue("email", "Matches", "email already exist");
		}
		// TO-DO: Additional validations!
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "passwords do not match");
		}
		if(result.hasErrors()) {
			
			return null;
		}
		
		String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashedPassword);
		return userRepo.save(newUser);
			
		
	}

	public User login(LoginUser newLoginObject, BindingResult result) {
		Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "Matches","email not found!!! please register valid email");
			return null;
		}
		User user = potentialUser.get();
		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "invalid login try again!!");
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
	
	 public List<User> allUsers() {
	        return (List<User>) userRepo.findAll();
	    }

	 public User findOneUser(Long id) {
	    	Optional<User> potentialUser = userRepo.findById(id);
	    	if(potentialUser.isPresent()) {
	    		return potentialUser.get();
	    	}
	    	return null;
		}
}
