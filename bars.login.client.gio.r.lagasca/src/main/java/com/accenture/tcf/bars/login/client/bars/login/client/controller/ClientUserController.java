package com.accenture.tcf.bars.login.client.bars.login.client.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.accenture.tcf.bars.login.client.bars.login.client.BarsLoginServerProxy;
import com.accenture.tcf.bars.login.client.bars.login.client.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ClientUserController {
	
	@Autowired
	BarsLoginServerProxy proxy;
	
	@GetMapping("/")
	public String home() {
		return "index";
	}
	
	@GetMapping("/userlist")
	public List<User> getAllUsers() {
		return proxy.getAllUsers();
	}
	
	/*@PostMapping("/users/{username}/{password}")
	public ModelAndView getMe(@PathVariable String username, @PathVariable String password) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("client");
		mav.addObject(blsp.loginUser(username, password));
		return mav;
	}*/
	
	@PostMapping("/users/{username}/{password}")
	public String Login(@PathVariable String username, @PathVariable String password) {
		return proxy.login(username, password).toString();
	}
	
	@PostMapping("/users/{username}/{password")
	public ModelAndView login(@PathVariable String username, @PathVariable String password) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("client");
		mav.addObject(proxy.login(username, password));
		return mav;
	}
	
	@PostMapping("/users")
	public ModelAndView createUser(@RequestBody User user) {
		log.info("{}", user);
		ModelAndView mav = new ModelAndView();
		mav.addObject(proxy.createUser(user));
		mav.setViewName("client");
		return mav;
	}
	
	@GetMapping("/users/{id}")
	public User getUserById(@PathVariable int id) {
		return proxy.getUserById(id);		
	}
	
	@PutMapping("/users/{id}")
	public User updateUser(@PathVariable int id, @RequestBody User userDetails) {
		return proxy.updateUser(id, userDetails);
	}
	
	@DeleteMapping("/users/{id}")
	public User deleteUser(@PathVariable int id) {
		return proxy.deleteUser(id);
	}
	

}
	