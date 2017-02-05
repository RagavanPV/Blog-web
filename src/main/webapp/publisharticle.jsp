<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="/articles">View Articles</a><br>
<h3>Publish Article</h3>
	<form action="/articles/publish" method="GET">
		Title: <input type="text" name="title" required autofocus />
		Content : <input type="text" name="content" required />
		<input type="hidden" name=userId value=<%=request.getParameter("userId")%>>
		<button type="submit">Publish</button>
	</form>
	
</body>
</html>