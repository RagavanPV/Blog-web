package com.ragavan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String index(ModelMap modelMap, HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		if (userSession.getRoleId().getId() == 1) {
			List<User> userList = userService.listService();
			modelMap.addAttribute("USER_LIST", userList);
			return "userlist.jsp";
		} else {
			System.out.println(userSession.getUserName());
			return "redirect:/";
		}
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("id") int id, HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		if (userSession.getRoleId().getId() == 1) {
			user.setId(id);
			try {
				userService.deleteService(id);
			} catch (ServiceException e) {
				e.printStackTrace();
			}
			return "redirect:../users";
		} else {
			return "redirect:/";
		}
	}

	@GetMapping("/update")
	public String update(ModelMap modelMap, @RequestParam("id") int id, HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		if (userSession.getRoleId().getId() == 1) {
			user.setId(id);
			RoleService roleService = new RoleService();
			List<Role> roleList = roleService.listService();
			modelMap.addAttribute("ROLE_LIST", roleList);
			System.out.println(userSession.getUserName());
			return "../updateuser.jsp";
		} else {
			return "redirect:/";
		}
	}

	@GetMapping("/updateUser")
	public String update(@RequestParam("userName") String name, @RequestParam("password") String password,
			@RequestParam("emailId") String emailid, @RequestParam("role") int roleId, HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		System.out.println(userSession.getUserName());
		if (userSession.getRoleId().getId() == 1) {
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
			System.out.println(userSession.getUserName());
			return "redirect:../users";
		} else {
			return "redirect:/";
		}
	}

	@PostMapping("/save")
	public String store(@RequestParam("userName") String name, @RequestParam("password") String password,
			@RequestParam("emailId") String emailid, ModelMap modelMap) {
		user.setUserName(name);
		user.setPassword(password);
		user.setEmailId(emailid);
		int result = 0;
		try {
			result = userService.saveService(user);

		} catch (ServiceException e) {
			modelMap.addAttribute("REGISTER_ERROR", e.getMessage());
		}
		if (result == 1) {
			return "redirect:../";
		} else
			return "redirect:../?registersuccess=0";
	}

	@PostMapping("/login")
	public String store(HttpSession httpSession, @RequestParam("userName") String name,
			@RequestParam("password") String password) {
		User userLogin=new User();
		userLogin.setUserName(name);
		userLogin.setPassword(password);
		boolean result = false;
		int roleid = 0;
		int userid=0;
		try {
			roleid = userService.functionGetRoleId(name);
			result = userService.functionLoginService(userLogin);
			userid=userService.functionGetUserId(name);
			if (result) {
				Role role = new Role();
				role.setId(roleid);
				userLogin.setRoleId(role);
				userLogin.setId(userid);
				userLogin.setEmailId(userService.functionGetUserEmail(userid));
			}
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		if (result) {
			if (roleid == 1) {
				httpSession.setAttribute("LOGGED_USER", userLogin);
				return "redirect:../users";

			} else {
				httpSession.setAttribute("LOGGED_USER", userLogin);
				return "redirect:../articles/user?userName=" + name;
			}
		} else
			return "redirect:../?success=0";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession httpSession = request.getSession(false);
		Object user = httpSession.getAttribute("LOGGED_USER");
		if (user != null) {
			httpSession.invalidate();
			return "redirect:/";
		} else {
			return "redirect:/";
		}
	}
}
