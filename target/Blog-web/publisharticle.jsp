<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
  <script type="text/javascript"src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<a href="/articles">View Articles</a><br>
<div class="row center">	
	       <div class="col s12 md12">

<h3>Publish Article</h3>
<div class="container" id="register" >
	<form action="/articles/publish" method="GET">
		<input type="text" placeholder="Title" name="title" required autofocus />
		<input type="text" placeholder="Content" name="content" required />
		<input type="hidden" name=userId value=<%=request.getParameter("userId")%>>
		<button type="submit" class="btn waves-effect waves-light">Publish</button>
	</form>
	</div>
	</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>