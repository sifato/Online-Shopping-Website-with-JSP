<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder" %>


<jsp:useBean id="loginUser" class="entity.Users"></jsp:useBean>

<jsp:useBean id="userDAO" class="dao.UsersDAO"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:setProperty property="*" name="loginUser"/>
<%
		
		String[] isUseCookie = request.getParameterValues("isUseCookie");
		if (isUseCookie != null && isUseCookie.length > 0) {
			
			String username = URLEncoder.encode(loginUser.getUsername(), "utf-8");
			String password = URLEncoder.encode(loginUser.getPassword(), "utf-8");
			
			Cookie usernameCookie = new Cookie("username", username);
			Cookie passwordCookie = new Cookie("password", password);
			usernameCookie.setMaxAge(3600 * 24 * 10);  		
			passwordCookie.setMaxAge(3600 * 24 * 10);

			
			response.addCookie(usernameCookie);
			response.addCookie(passwordCookie);
		} else {
			
			Cookie[] cookies = request.getCookies();
			if (cookies != null && cookies.length > 0) {
				
				for (Cookie c : cookies) {
					if (c.getName().equals("username")
							|| c.getName().equals("password")) {
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}
			}
		}
	%>

<%
	request.setCharacterEncoding("utf-8");
	if(userDAO.isUserLogin(loginUser)){
		
		session.setAttribute("username", loginUser.getUsername());
		session.setAttribute("password", loginUser.getPassword());
		
		request.getRequestDispatcher("login_success.jsp").forward(request, response);
	}else{
		
		response.sendRedirect("login_failure.jsp");
	}
%>
