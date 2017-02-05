<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Publish Category</h3>
	<form action="/category/publish" method="GET">
		Category: <input type="text" name="category" required autofocus />
		<input type="hidden" name=userId value=<%=request.getParameter("userId")%>>
		<input type="hidden" name=title value=<%=request.getParameter("title")%>>
		<button type="submit">Publish</button>
	</form>
</body>
</html>