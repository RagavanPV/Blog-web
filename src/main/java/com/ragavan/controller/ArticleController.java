package com.ragavan.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ragavan.exception.ServiceException;
import com.ragavan.model.Article;
import com.ragavan.model.Category;
import com.ragavan.model.Comment;
import com.ragavan.model.User;
import com.ragavan.service.ArticleService;
import com.ragavan.service.CategoryService;
import com.ragavan.service.CommentService;
import com.ragavan.service.UserService;

@Controller
@RequestMapping("/articles")
public class ArticleController {
	private Article article = new Article();

	private ArticleService articleService = new ArticleService();

	@GetMapping
	public String index(ModelMap modelMap) {
		List<Article> articleList;
		articleList = articleService.listService();
		CategoryService categoryService = new CategoryService();
		List<Category> categoryList = categoryService.listCategoryService();
		modelMap.addAttribute("CATEGORY_LIST", categoryList);
		modelMap.addAttribute("update", 0);
		modelMap.addAttribute("ARTICLE_LIST", articleList);
		return "articlelist.jsp";
	}

	@GetMapping("viewbycategory")
	public String indexByCategory(ModelMap modelMap, @RequestParam("category") String category) {
		CategoryService categoryService = new CategoryService();
		List<Article> articleList = categoryService.viewByCategoryService(category);
		modelMap.addAttribute("update", 0);
		modelMap.addAttribute("ARTICLE_LIST", articleList);
		return "../articlelist.jsp";
	}

	@GetMapping("comments")
	public String indexComments(ModelMap modelMap, @RequestParam("articleId") int articleId,HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		if (userSession.getRoleId().getId() != 1) {
		CommentService commentService = new CommentService();
		List<Comment> commentList = commentService.listByArticleIdService(articleId);
		modelMap.addAttribute("update", 0);
		modelMap.addAttribute("COMMENT_LIST", commentList);
		return "../commentlist.jsp";}
		else
			return "redirect:/";
	}

	@GetMapping("/other")
	public String indexOtherUsers(ModelMap modelMap, @RequestParam("userId") int userId,HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		if (userSession.getRoleId().getId() != 1) {
		List<Article> articleList = null;
		try {
			articleList = articleService.listOtherUserService(userId);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("userId", userId);
		modelMap.addAttribute("update", 0);
		modelMap.addAttribute("ARTICLE_LIST", articleList);
		return "../articlelist.jsp";}
		else
			return "redirect:/";
	}

	@GetMapping("/user")
	public String index(ModelMap modelMap, @RequestParam("userName") String name,HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		if (userSession.getRoleId().getId() != 1) {
		UserService userService = new UserService();
		List<Article> articleList = null;
		int roleId = 0;
		int userId = 0;
		try {
			roleId = userService.functionGetRoleId(name);
			userId = userService.functionGetUserId(name);
			articleList = articleService.listByUserService(userService.functionGetUserId(name));
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("roleId", roleId);
		modelMap.addAttribute("userId", userId);
		modelMap.addAttribute("update", 1);
		modelMap.addAttribute("ARTICLE_LIST", articleList);
		return "../articlelist.jsp";}
		else
			return "redirect:/";
	}

	@GetMapping("/publish")
	public String publish(@RequestParam("title") String name, @RequestParam("content") String content,
			@RequestParam("userId") int userId,HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		if (userSession.getRoleId().getId() == 2) {
		article.setTitle(name);
		article.setContent(content);

		User user = new User();
		user.setId(userId);
		article.setUserId(user);
		try {

			articleService.publishArticleService(article, user);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "../publishcategory.jsp";}
		else
			return "redirect:/";
	}

	@GetMapping("/update")
	public String update(@RequestParam("id") int id,HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		if (userSession.getRoleId().getId() != 1) {
		article.setId(id);
		article.getId();
		return "../updatearticle.jsp";}
		else
			return "redirect:/";
	}

	@GetMapping("/updateArticle")
	public String update(@RequestParam("title") String title, @RequestParam("content") String content,
			@RequestParam("articleId") int articleId,HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		if (userSession.getRoleId().getId() != 1) {
		article.setTitle(title);
		article.setContent(content);
		article.setId(articleId);
		String userName = articleService.getUserIdByArticleId(articleId);
		try {
			articleService.updateByIdService(article);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "redirect:../articles/user?userName=" + userName;}
		else
			return "redirect:/";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("id") int id,HttpSession httpSession) {
		User userSession = (User) httpSession.getAttribute("LOGGED_USER");
		if (userSession.getRoleId().getId() != 1) {
		article.setId(id);
		String userName = articleService.getUserIdByArticleId(id);
		try {
			articleService.deleteArticleService(article);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "redirect:../articles/user?userName=" + userName;}
		else
			return "redirect:/";
	}

}
