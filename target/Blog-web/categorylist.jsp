<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
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
	<jsp:include page="header.jsp"></jsp:include>
	<h3>Category List JSP</h3>
	<div class="col s12 m12">
		<div class="container" id="register">
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
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>