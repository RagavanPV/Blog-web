package com.ragavan.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ragavan.exception.ServiceException;
import com.ragavan.model.Article;
import com.ragavan.model.Category;
import com.ragavan.model.User;
import com.ragavan.service.CategoryService;
import com.ragavan.service.UserService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	CategoryService categoryService = new CategoryService();

	@GetMapping("/list")
	public String index(ModelMap modelMap, @RequestParam("userId") int userId) {
		List<Category> categoryrList = categoryService.listByUserIdService(userId);
		modelMap.addAttribute("CATEGORY_LIST", categoryrList);
		return "../categorylist.jsp";
	}

	@GetMapping("/publish")
	public String publish(@RequestParam("category") String category, @RequestParam("userId") int userId,
			@RequestParam("title") String title) {
		UserService service = new UserService();
		String userName = null;
		Category cate = new Category();
		cate.setName(category);
		User user = new User();
		user.setId(userId);
		cate.setUserId(user);
		Article article = new Article();
		article.setTitle(title);
		article.setUserId(user);
		try {
			userName = service.functionGetUserName(userId);
			categoryService.insertCategory(article, cate);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "../articles/user?userName=" + userName;
	}

}
