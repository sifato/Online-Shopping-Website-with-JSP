<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Login failed!</title>
<link type="text/css" href="css/HelloLoginv4.css" rel="stylesheet" />
</head>

<body>
	<div id="container">
		<div class="logo">
			<img src="assets/logo.png" />
		</div>
		<div id="content">
			<h1>Login failed, wrong username or password!</h1>
			<a href="login.jsp">Click here to return to the login page to log in again</a>
		</div>
	</div>
</body>
</html>
