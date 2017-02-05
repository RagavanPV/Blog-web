<%@page import="org.omg.PortableInterceptor.USER_EXCEPTION"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="/">Home</a>
	<a href="/articles/other?userId=${userId}">View Articles</a>
	<h3>Article List JSP</h3>
	<c:if test="${roleId == 2 }">
		<a href="../publisharticle.jsp?userId=${userId}">Publish Article</a>
	</c:if>
	<c:if test="${userId==null}">
		<form action="../articles/viewbycategory" method="GET">
			Category:<select name="category" id="category">
				<c:forEach var="c" items="${CATEGORY_LIST}" varStatus="i">
					<option value="${c.name}">${c.name}</option>
				</c:forEach>
			</select>
			<button type="submit">View By Category</button>
		</form>
	</c:if>

	<table>
		<tr>
			<td>id</td>
			<td>UserName</td>
			<td>Article Title</td>
			<td>Article content</td>
			<td>Published Date</td>
			<td>Modified Date</td>
			<td>Status</td>
		</tr>
		<c:forEach var="c" items="${ARTICLE_LIST}" varStatus="i">
			<tr>
				<td>${c.id}</td>
				<td>${c.userId.id}</td>
				<td>${c.title}</td>
				<td>${c.content}</td>
				<td>${c.publishedDate}</td>
				<td>${c.modifiedDate}</td>
				<td>${c.status}</td>
				<c:if test="${update!=0}">
					<td><a href="../articles/update?id=${c.id}">Update</a></td>
					<td><a href="delete?id=${c.id}">Delete</a></td>
				</c:if>
				<c:if test="${update==0&&userId!=null}">
					<td><form action="../comment/save" method="GET">
							Comment: <input type="text" name="comment" required autofocus />
							<input type="hidden" name="id" value="${c.id}"> <input
								type="hidden" name="userId" value="${userId}">
							<button type="submit">Comment</button>
						</form></td>
					<td><a href="comments?articleId=${c.id}">View Comments</a></td>	
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<a href="../category/list?userId=${userId}">View Category</a>
</body>
</html>