<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
 
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h3>Publish Category</h3>
<div class="row center">	
	       <div class="col s12 md12">
	       <div class="container" id="register" >
		<div id="tag" class="chips chips-autocomplete"></div>
		<button type="submit" onclick="show()" class="btn waves-effect waves-light">Publish</button>
	</div>
	</div>
	</div>
	<div id="feedback"></div>
	<jsp:include page="footer.jsp"></jsp:include>
	 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
	<script> 
	$(document).ready(function() {
		  $('.chips-autocomplete').material_chip({
		    autocompleteData: {
		      'Apple': null,
		      'Microsoft': null,
		      'Google': null
		    }
		  });
		  });

  function show(){
  	var data = {};
  	var categoryList=$('#tag').material_chip('data');
  	data.category = categoryList;
  	data.title='<%=request.getParameter("title")%>';
  	console.log(categoryList);

  	$.post("/category/post", { list : JSON.stringify(data) }, function(data){
  		$('#feedback').html(data);
  	});
  	/*var data = $('#tag').material_chip('data');
  	console.log(data.length);
  	console.log(JSON.stringify(data));*/
  	}</script>
	
</body>
</html>