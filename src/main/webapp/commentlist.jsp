<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>View Comments</h2>
<table>
		<tr>
			<td>id</td>
			<td>Article_id</td>
			<td>User_id</td>
			<td>Comment Text</td>
		</tr>
		<c:forEach var="c" items="${COMMENT_LIST}" varStatus="i">
			<tr>
				<td>${c.id}</td>
				<td>${c.articleId.id}</td>
				<td>${c.userId.id}</td>
				<td>${c.commentText}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>