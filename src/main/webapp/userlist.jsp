<%@page import="org.omg.PortableInterceptor.USER_EXCEPTION"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<a href="/">Home</a>
	<h3>User List JSP</h3>
	<table>
		<tr>
			<td>id</td>
			<td>UserName</td>
			<td>Password</td>
			<td>EmailId</td>
			<td>RoleId</td>
		</tr>
		<c:forEach var="c" items="${USER_LIST}" varStatus="i">
			<tr>
				<td>${c.id}</td>
				<td>${c.userName}</td>
				<td>${c.password}</td>
				<td>${c.emailId}</td>
				<td>${c.roleId.id}</td>
				<td><a href="users/update?id=${c.id}">Update</a></td>
				<td><a href="users/delete?id=${c.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>