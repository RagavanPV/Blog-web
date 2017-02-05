<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Article</title>
</head>
<body>
<h2>Update Article</h2>
<form action="updateArticle" method="GET">
		Title: <input type="text" name="title" required autofocus />
		Content : <input type="text" name="content" required />
		<input type="hidden" name="articleId" value=<%=request.getParameter("id")%>>
		<button type="submit">Update</button>
	</form>

</body>
</html>