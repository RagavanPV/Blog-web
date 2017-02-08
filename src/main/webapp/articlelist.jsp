<%@page import="org.omg.PortableInterceptor.USER_EXCEPTION"%>
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
<script>
	$(document).ready(function() {
		$('select').material_select();
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="center">
		<div class="col s12 m12">
			<h3>Article List JSP</h3>
			<c:if test="${userId==null}">
				<div class="input-field col s12 m4">
					<div class="container" id="register">
						<div class="row">
							<form action="../articles/viewbycategory" method="GET">
								<div class="col s12 md4">
									<select name="category" id="category">
										<option value="" disabled selected>Choose your Category</option>
										<c:forEach var="c" items="${CATEGORY_LIST}" varStatus="i">
											<option value="${c.name}">${c.name}</option>
										</c:forEach>
									</select>
									<button type="submit" class="btn waves-effect waves-light">View
										By Category</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</c:if>

			<div class="container" id="register">
			
				<c:forEach var="c" items="${ARTICLE_LIST}" varStatus="i">
				<div class="card-panel teal">
          <span class="white-text">
					<h2>${c.title}</h2>
					<small>Published By-${c.userId.userName}</small>
					<br>
					<small>Published On-${c.publishedDate}</small>
					<br>
						<font style="font-size:30px">${c.content}</font>
						<c:if test="${update!=0}">
						<br><a href="../articles/update?id=${c.id}">Update</a>
						<a href="delete?id=${c.id}">Delete</a>
					</c:if>
					<c:if test="${update==0&&userId!=null}">
					<div class="col s2 md2">
						<form action="../comment/save" method="GET">
							Comment: <input type="text" name="comment" required autofocus />
							<input type="hidden" name="id" value="${c.id}"> <input
								type="hidden" name="userId" value="${userId}">
							<button type="submit">Comment</button>
						</form>
						<a href="comments?articleId=${c.id}">View Comments</a>
						</div>
					</c:if>
					
					</span>
</div><br>
				</c:forEach>

			</div>
			<c:if test="${userId!=null}">
				<a href="../category/list?userId=${userId}">View Category</a>
			</c:if>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>