<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Successfully added to shopping cart</title>
	</head>
	<body>
		 <center>
		     <img src="images/add_cart_success.jpg"/><hr />
		     <% 
		         String id = request.getParameter("id");
		         String num = request.getParameter("num");
		     %>
		          
	    </center>
	</body>
</html>
