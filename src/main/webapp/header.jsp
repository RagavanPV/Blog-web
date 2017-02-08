<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<%@page import="com.ragavan.model.User"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">

<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

</head>
<body>
<%
	User userSession = (User) session.getAttribute("LOGGED_USER");
	boolean isLoggedIn = userSession != null;
	String userName=userSession!=null?userSession.getUserName():"";
	int userId = userSession != null ? userSession.getId(): 0;
	int roleId=userSession!=null?userSession.getRoleId().getId():0;
%>
	<center>
		<h2>Blog Management System</h2>
	</center>
	<nav>
		<div class="nav-wrapper">
			<a href="/" class="brand-logo">Blog</a> 
			<a href="#"	data-activates="mobile-demo" class="button-collapse"><i	class="material-icons">menu</i></a>
			<% if(roleId!=0 && roleId!=1){ %>
			<ul class="right hide-on-med-and-down">
				<li><a href="/articles/other?userId=<%=userId%>">View other Article</a></li>
			</ul>
			<ul class="side-nav" id="mobile-demo">
				<li><a href="/articles/other?userId=<%=userId%>">View other Article</a></li>
			</ul>
			<%} %>
			<% if(roleId==2){ %>
			<ul class="right hide-on-med-and-down">
				<li><a href="../publisharticle.jsp?userId=<%=userId%>">Publish Article</a></li>
			</ul>
			<ul class="side-nav" id="mobile-demo">
				<li><a href="../publisharticle.jsp?userId=<%=userId%>">Publish Article</a></li>
			</ul>
			<%} %>
			<%
				if (isLoggedIn) {
					
			%>
			<ul class="right hide-on-med-and-down">
				<li><a href="../users/logout">Logout</a></li>
			</ul>
			<ul class="side-nav" id="mobile-demo">
				<li><a href="../users/logout">Logout</a></li>
			</ul>
			<%
				}else{
					
			%>
			<ul class="right hide-on-med-and-down">
				<li><a href="/articles">View Articles</a></li>
			</ul>
			<ul class="side-nav" id="mobile-demo">
				<li><a href="/articles">View Articles</a></li>
			</ul>
				<% } %>
		</div>
	</nav>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".button-collapse").sideNav();
		});
	</script>
</body>
</html>