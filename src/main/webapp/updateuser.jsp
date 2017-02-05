<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blog Management System</title>
</head>
<body>
<h3>Update User</h3>
	<form action="updateUser" method="GET">
		UserName: <input type="text" name="userName" required autofocus />
		Password : <input type="password" name="password" required />
		EmailId: <input type="email" name="emailId" required autofocus />
		Role :<select name="role" id="role">
		<c:forEach var="c" items="${ROLE_LIST}" varStatus="i">
					<option value="${c.id}">${c.roleName}</option>
				</c:forEach>
		</select>
		<button type="submit">Update</button>
	</form>
</body>
</html>