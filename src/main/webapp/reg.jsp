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
<title>User registration</title>
<link type="text/css" href="css/HelloLoginv4.css" rel="stylesheet" />
</head>

<body>

<div align="center"> 
	<h1>Registration</h1>
	<div id="container">
		
		<div id="content">
			<form action="doreg.jsp" method="post" name="regForm">
				<p class="main">
					<label>username：</label>
					<input type="text" name="username" />
					</p>
					<p>
					<label>password：</label>
					<input type="password" name="password" />
				</p>
				<p class="space">	
			 <div style=align:"center"><input type="submit" value="register" class="login" style="cursor: pointer;"/></div>
				</p>
				<h6><a href="login.jsp">  Already have an account?</a></h6>
				
			</form>
		</div>
		</div>
	</div>
	
</body>
</html>
