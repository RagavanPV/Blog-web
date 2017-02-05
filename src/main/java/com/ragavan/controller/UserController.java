package com.ragavan.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ragavan.exception.ServiceException;
import com.ragavan.model.Role;
import com.ragavan.model.User;
import com.ragavan.service.RoleService;
import com.ragavan.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {
	private User user = new User();

	private UserService userService = new UserService();

	@GetMapping
	public String index(ModelMap modelMap) {
		List<User> userList = userService.listService();
		modelMap.addAttribute("USER_LIST", userList);
		return "userlist.jsp";
	}

	@GetMapping("/save")
	public String store(@RequestParam("userName") String name, @RequestParam("password") String password,
			@RequestParam("emailId") String emailid) {
		user.setUserName(name);
		user.setPassword(password);
		user.setEmailId(emailid);
		try {
			userService.saveService(user);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "redirect:../";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("id") int id) {
		user.setId(id);
		try {
			userService.deleteService(id);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "redirect:../users";
	}

	@GetMapping("/update")
	public String update(ModelMap modelMap, @RequestParam("id") int id) {
		user.setId(id);
		RoleService roleService = new RoleService();
		List<Role> roleList = roleService.listService();
		modelMap.addAttribute("ROLE_LIST", roleList);
		return "../updateuser.jsp";
	}

	@GetMapping("/updateUser")
	public String update(@RequestParam("userName") String name, @RequestParam("password") String password,
			@RequestParam("emailId") String emailid, @RequestParam("role") int roleId) {
		user.setUserName(name);
		user.setPassword(password);
		user.setEmailId(emailid);
		Role role = new Role();
		role.setId(roleId);
		user.setRoleId(role);
		try {
			userService.updateService(user);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "redirect:../users";
	}

	@GetMapping("/login")
	public String store(@RequestParam("userName") String name, @RequestParam("password") String password) {
		user.setUserName(name);
		user.setPassword(password);
		boolean result = false;
		int roleid = 0;
		try {
			roleid = userService.functionGetRoleId(name);
			result = userService.functionLoginService(user);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		if (result) {
			if (roleid == 1) {
				return "redirect:../users";

			} else {
				return "redirect:../articles/user?userName=" + name;
			}
		} else
			return "redirect:../?success=0";
	}
}
