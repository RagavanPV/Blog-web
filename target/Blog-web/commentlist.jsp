<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
</head>
<body>
	<h2>View Comments</h2>
	<div class="row center">
		<div class="col s12 md12">
			<div class="container" id="register">
				<table class="highlight">
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
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>