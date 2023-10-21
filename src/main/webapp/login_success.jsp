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
<title>login successful</title>
<link type="text/css" href="css/HelloLoginv4.css" rel="stylesheet" />

</head>

<body>

	<div id="container">
		
		
		<div id="content">
			
			<a href="index.jsp"> Home page<br> What you want to buy?</a>
		</div>
	</div>
	
</body>
</html>
