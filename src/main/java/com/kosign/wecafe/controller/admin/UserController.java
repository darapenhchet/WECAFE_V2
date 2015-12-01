package com.kosign.wecafe.controller.admin;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.services.UserService;

@Controller
public class UserController {

	@Inject
	UserService userService;
	@RequestMapping(value="/admin/userlist")
	public String getAllUsers(Map<String, Object> model){
		model.put("users", userService.getAllUsers());
		return "admin/userlist";
	}
	
	@RequestMapping(value="/admin/useradd")
	public String useradd(Map<String, Object> model){
		model.put("roles", userService.getAllUserRoles());
		return "admin/useradd";
	}
	
	@RequestMapping(value="/admin/users/add", method=RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody Boolean addNewUser(@RequestBody User user){
		//System.out.println("==============================================================================================");
		//System.out.println("==============================="+userService.saveUser(user)+"=================================");
		///System.out.println("==============================================================================================");
		//return "redirect:admin/useradd";
		System.out.println("NEW USER...");
		return userService.saveUser(user);
	}
	
	@RequestMapping(value="/admin/user/{id}")
	public String updateUserView(@PathVariable("id") Long id, Map<String, Object> model){
		User user = userService.findUserById(id);
		System.out.println(user.getFirstName());
		model.put("user", user);
		model.put("roles", userService.getAllUserRoles());
		return "admin/userupdate";
	}
	
	@RequestMapping(value="/admin/users/update", method=RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody Boolean updateUser(@RequestBody User user){
		//System.out.println("==============================================================================================");
		//System.out.println("==============================="+userService.saveUser(user)+"=================================");
		///System.out.println("==============================================================================================");
		//return "redirect:admin/useradd";
		return userService.updateUser(user);
	}
	
	@RequestMapping(value="/admin/users/delete/{id}", method=RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody Boolean deleteUser(@RequestBody @PathVariable("id") Long id){
		//System.out.println("==============================================================================================");
		//System.out.println("==============================="+userService.saveUser(user)+"=================================");
		///System.out.println("==============================================================================================");
		//return "redirect:admin/useradd";
		return userService.deleteUser(id);
	}
	
	
	
	
	@RequestMapping(value = "/admin/users/status/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody boolean changeProductStatus(@RequestBody @PathVariable("id") Long id) {
		System.out.println("ID=" + id);
		return userService.updateUserStatus(id);
	}
	
}
