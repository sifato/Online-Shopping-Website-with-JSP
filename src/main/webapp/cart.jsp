<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@page import="entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>shopping cart</title>
	<link type="text/css" href="css/HelloLoginv4.css" rel="stylesheet" />
    <script language="javascript">
	    function delcfm() {
	        if (!confirm("Are you sure you want to delete?")) {
	            window.event.returnValue = false;
	        }
	    }
   </script>
  </head>
  
  <body>
  <div align="center"> 
  
   	<h1> shopping cart</h1>
   	<a href="index.jsp">Home page</a>  <a href="index.jsp">Product list</a>
   	<hr> 
   	<div id="shopping">
   		<form>	
   		
			<table>
				<tr>
					<th style= color:#135294>name</th>
					<th style= color:#135294>Unit price</th>
					<th style= color:#135294>total price</th>
					<th style= color:#135294> quantity</th>
					<th style= color:#135294>action</th>
				</tr>
				<% 
				   
				   	Cart cart = (Cart)request.getSession().getAttribute("cart");
				   	if(cart!=null){
				%>
				
				    <% 
				        HashMap<Items,Integer> goods = cart.getGoods();
				        Set<Items> items = goods.keySet();
				        Iterator<Items> iterator = items.iterator();
				         
				        while(iterator.hasNext()){
				            Items i = iterator.next();
				    %> 
							<tr name="products" id="product_id_1">
								<td class="thumb"><img src="images/<%=i.getPicture()%>" /><a href=""><%=i.getName()%></a></td>
								<td class="number"><%=i.getPrice() %></td>
								<td class="price" id="price_id_1">
									<span><%=i.getPrice()*goods.get(i) %></span>
									<input type="hidden" value="" />
								</td>
								<td class="number"><%=goods.get(i)%></td> 
			                    <td class="delete">
								  <a href="servlet/CartServlet?action=delete&id=<%=i.getId()%>" onclick="delcfm();">delete</a>
								</td>
							</tr>
				    <% 
				         }
				    %>
				
			</table>
			
			<div class="total"><span id="total">total：<%=cart.getTotalPrice() %>$</span></div>
			  	<% 
			    	}
			 	%>
			<div class="button"><input type="submit" value="" /></div>
		</form>
	</div>
	</div>
  </body>
</html>
