<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>please log in</title>
<link type="text/css" href="css/HelloLoginv4.css" rel="stylesheet" />
</head>

<body>
<div style="background:;">
<div align="center"> 
	<%
  		
  		String username = "";
  		String password = "";
  		
  		request.setCharacterEncoding("utf-8");
  		Cookie[]cookies = request.getCookies();
  		if(cookies!=null&&cookies.length>0){
  			for(Cookie c:cookies){
  				if (c.getName().equals("username")) {
					username = URLDecoder.decode(c.getValue(), "utf-8");
				}
				if (c.getName().equals("password")) {
					password = URLDecoder.decode(c.getValue(), "utf-8");
				}
  			}
  		}
  	 %>
  	 
	<h1>Login</h1>
	<div id="container">
		
		<div id="content">
			<form action="dologin.jsp" method="post" name="loginForm">
				<p class="main">
					<label>username：</label>
					<input type="text" name="username" value="<%=username %>" />
					</p>
					<p>
					<label>password：</label>
					<input type="password" name="password" value="<%=password %>"/>
				</p>
				<p class="space">	
					<input type="submit" value="Log in" class="login" style="cursor: pointer; align: center;"/>
					<input type="checkbox" checked="checked" name="isUseCookie">
		Remember me in ten days&nbsp;&nbsp;<a href="reg.jsp">register</a><br /> 
				</p>
			</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
