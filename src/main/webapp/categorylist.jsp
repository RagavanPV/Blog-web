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
	<h3>Category List JSP</h3>
	<table>
		<tr>
			<td>id</td>
			<td>CategoryName</td>
		</tr>
		<c:forEach var="c" items="${CATEGORY_LIST}" varStatus="i">
			<tr>
				<td>${c.id}</td>
				<td>${c.name }</td>
				<td><a href="../category/update?id=${c.id}">Update</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>