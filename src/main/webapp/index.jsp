

<html>
<head>
<title>Blog Management System</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row center">
		<div class="col s6 md6">
			<div class="container" id="register">
				<h3>New User</h3>
				<form action="users/save" method="POST">
					<div class="input-field col s12">
						<input type="text" id="userName" name="userName" required
							autofocus /> <label for="userName">UserName</label>
					</div>
					<div class="input-field col s12">
						<input type="password" id="password" name="password" required minlength=5 maxlength=10/>
						<label for="password">Password</label>
					</div>
					<div class="input-field col s12">
						<input type="email" id="EmailId" name="emailId" required /> <label
							for="EmailId">Email Id</label>
					</div>

					<button type="submit" class="btn waves-effect waves-light">Register</button>
				</form>
				<%
					if (request.getParameter("registersuccess") != null) {
				%>
				<a>User Name or Email Id already exists</a>
				<%
					}
				%>

			</div>
		</div>
		<div class="col s6 md6">
			<div class="container" id="options">
				<h3>Login User</h3>
				<form action="users/login" method="POST">
					<div class="input-field col s12">
						<input type="text" id="userName" name="userName" required /> <label
							for="userName">UserName</label>
					</div>
					<div class="input-field col s12">
						<input type="password" id="password" name="password" required />
						<label for="password">Password</label>
					</div>
					<button type="submit" class="btn waves-effect waves-light">Login</button>
				</form>
				<%
					if (request.getParameter("success") != null) {
				%>
				<a>Invalid Login!</a>
				<%
					}
				%>
			</div>
		</div>
		<%if(request.getParameter("activate")!=null){
			if (Integer.parseInt(request.getParameter("activate")) == 0) {
		%>
		<a>Please active your mail</a>
		<%
			}
		%>
		<%
			if (Integer.parseInt(request.getParameter("activate")) == 1) {
		%>
		<a>Activation Successfull</a>
		<%
			}}
		%>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
</body>
</html>
