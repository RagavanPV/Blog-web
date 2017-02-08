package com.ragavan.controller;

import org.apache.commons.mail.EmailException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ragavan.exception.ServiceException;
import com.ragavan.model.Article;
import com.ragavan.model.Comment;
import com.ragavan.model.User;
import com.ragavan.service.ArticleService;
import com.ragavan.service.CommentService;
import com.ragavan.service.UserService;
import com.ragavan.util.MailUtil;

@Controller
@RequestMapping("/comment")
public class CommentController {
	Comment comment = new Comment();
	CommentService commentService = new CommentService();

	@GetMapping("/save")
	public String store(@RequestParam("comment") String comments, @RequestParam("id") int articleId,
			@RequestParam("userId") int userId) {
		Article article = new Article();
		ArticleService articleService=new ArticleService();
		UserService userService = new UserService();
		User user = new User();
		article.setId(articleId);
		user.setId(userId);
		String authorEmail=articleService.getEmailByArticleId(articleId);
		user.setEmailId(authorEmail);
		comment.setArticleId(article);
		comment.setCommentText(comments);
		comment.setUserId(user);
		try {
			user.setUserName(userService.functionGetUserName(userId));
			commentService.saveService(comment);
			MailUtil.sendSimpleMail(comment);
		} catch (ServiceException | EmailException e) {
			e.printStackTrace();
		}
		return "redirect:../articles/other?userId=" + userId;
	}
}
