<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Blog Management System</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
<script>
	$(document).ready(function() {
		$('select').material_select();
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row center">
		<h3>Update User</h3>
		<div class="col s12 md12">
			<div class="container" id="update">
				<form action="updateRole" method="GET">
					<!-- <input type="text" placeholder="UserName" name="userName" required
						autofocus /> <input type="password" placeholder="password"
						name="password" required /> <input type="email"
						placeholder="Email Id" name="emailId" required autofocus /> --> <select
						name="role" id="role">
						<option value="" disabled selected>Choose your Role</option>
						<c:forEach var="c" items="${ROLE_LIST}" varStatus="i">
							<option value="${c.id}">${c.roleName}</option>
						</c:forEach>
					</select>
					<button type="submit" class="btn waves-effect waves-light">Update</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>