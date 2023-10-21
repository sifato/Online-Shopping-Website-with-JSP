<%@page import="entity.Items"%>
<%@page import="dao.ItemsDAO"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Welcome to Toy store</title>
<link type="text/css" href="css/HelloLoginv4.css" rel="stylesheet" />
	<style type="text/css">
	div {
		float: center;
		margin: 00px;
	}

	div dd {
		margin: 0px;
		font-size: 10pt;
	}

	div dd.dd_name {
		color: blue;
	}

	div dd.dd_city {
		color: #000;
	}
	</style>
</head>
<% 
	String userinfo = "";
	if(session.getAttribute("username")!=null){
		userinfo = session.getAttribute("username").toString();
	}else{
		userinfo = "<a href='login.jsp'>login</a>";
	}
 %>
<body>
 <div style="background:;">
 
	<p style="text-align: center;font-size:40px;">Marvel Toy Store</p>
	<%=userinfo %>&nbsp;&nbsp;&nbsp;<a href='login.jsp'>login</a><a href="reg.jsp">Register</a><hr>
	<center>
		<table width="1450" height="80" cellpadding="0" cellspacing="0"
			border="0">
			<tr>
				<td>
					
					<%
  						ItemsDAO itemsDAO = new ItemsDAO();
  						ArrayList<Items>list = itemsDAO.getAllItems();
  						if(list!=null&&list.size()>0){
  							
  							for(Items item:list){
  	 				%>
								<div>
									<dl>
										<dt>
											<a href="details.jsp?id=<%=item.getId() %>">
												<img src="images/<%=item.getPicture() %>" width="190" height="150" border="1"/>
											</a>
										</dt>
										<dd class="dd_name"><%=item.getName() %></dd>
										<dd class="dd_price">price：<%=item.getPrice() %></dd>
									</dl>
								</div>
					<%
							}
				  		}
				  	%>
				  	
				</td>
			</tr>
		</table>
	</center>
	</div>
</body>
</html>