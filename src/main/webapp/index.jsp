<html>
<head>
<title>Blog Management System</title>
</head>
<body>
	<h2>Blog Management System</h2>
	<h3>New User</h3>
	<form action="users/save" method="GET">
		UserName: <input type="text" name="userName" required autofocus />
		Password : <input type="password" name="password" required />
		EmailId: <input type="email" name="emailId" required autofocus />
		<button type="submit">Submit</button>
	</form>
	<a href="/articles">View Articles</a>
	<br>
	<h3>Login User</h3>
	<form action="users/login" method="GET">
		UserName: <input type="text" name="userName" required autofocus />
		Password : <input type="password" name="password" required />
		<button type="submit">Submit</button>
	</form>
	<%if(request.getParameter("success")!=null) {%>
		Invalid Login
				<%}%>
</body>
</html>
