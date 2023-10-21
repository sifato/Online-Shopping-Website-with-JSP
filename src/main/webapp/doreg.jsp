<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>

<jsp:useBean id="user" class="entity.Users"></jsp:useBean>

<jsp:useBean id="userDAO" class="dao.UsersDAO"></jsp:useBean>

<%request.setCharacterEncoding("utf-8"); %>

<jsp:setProperty property="*" name="user"/>


<%
	
	out.write(user.getUsername());
	if(userDAO.insertUsersInfoToDB(user)){
		response.sendRedirect("login.jsp");
	}else{
		out.write("The user already exists!");
		out.write("<br /><a href='reg.jsp'>Return to register again!</a>")	;
	}
 %>

