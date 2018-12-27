package com.accenture.tcf.bars.login.client.bars.login.client;


import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;


import feign.Headers;



@FeignClient(name="netflix-zuul-api-gateway-server")
@RibbonClient(name="bars-login-server-gio-r-lagasca")
public interface BarsLoginServerProxy {
	
	@GetMapping("/bars-login-server-gio-r-lagasca/users")
	public List<User> getAllUsers();
	
	@GetMapping("/bars-login-server-gio-r-lagasca/users/{id}")
	User getUserById(@PathVariable int id);
	
	@PostMapping("/bars-login-server-gio-r-lagasca/users")
	@Headers("Content-Type: application/json")
	User createUser(@RequestBody User user);
	
	@PutMapping("/bars-login-server-gio-r-lagasca/users/{id}")
	User updateUser(@PathVariable int id, @RequestBody User userDetails);
	
	@DeleteMapping("/bars-login-server-gio-r-lagasca/users/{id}")
	User deleteUser(@PathVariable int id);

	@PostMapping("bars-login-server-gio-r-lagasca/users/{username}/{password")
	User login(@PathVariable String username, @PathVariable String password);
}
