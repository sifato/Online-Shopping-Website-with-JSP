<%@page import="entity.Items"%>
<%@page import="dao.ItemsDAO"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Details</title>
 <link type="text/css" href="css/HelloLoginv4.css" rel="stylesheet" />
    <script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>
    <style type="text/css">
		div{
		  float:left;
		  margin-left: 30px;
		  margin-right:30px;
		  margin-top: 5px;
		  margin-bottom: 5px;
		}
		div dd{
		  margin:0px;
		  font-size:10pt;
		}
		div dd.dd_name{
		  color:blue;
		}
		div dd.dd_city{
		  color:#000;
		}
		div #cart{
		 margin:0px auto;
		 text-align:right; 
		}
		span{
		 padding:0 2px;border:1px #c0c0c0 solid;cursor:pointer;
		}
		a{
		  text-decoration: none; 
		}
	</style>
	<script type="text/javascript">
      function selflog_show(id) { 
         var num =  document.getElementById("number").value; 
         J.dialog.get({id: 'haoyue_creat',title: 'Successful shopping',width: 600,height:400, link: '<%=path%>/servlet/CartServlet?id='+id+'&num='+num+'&action=add', cover:true});
      }
      function add(){
         var num = parseInt(document.getElementById("number").value);
         if(num<100){
            document.getElementById("number").value = ++num;
         }
      }
      function sub(){
         var num = parseInt(document.getElementById("number").value);
         if(num>1){
            document.getElementById("number").value = --num;
         }
      }
    </script>
  </head>
  
  <body> 
  
  <div align="center"> 
  
  	<h1> details</h1><hr>
  	<p style= "text-align:center"><a href="index.jsp">Home page</a>  <a href="index.jsp">Dress list</a></p><hr/>
  	<center>
  		<table width="1090" height="600" cellpadding="0" cellspacing="0" border="0" >
  			<tr>
  			
  			<%
  				Items item = new ItemsDAO().getItemsById(Integer.parseInt(request.getParameter("id")));
  				if(item!=null){
  			 %>
	  				<td width="70%" valign="top">
	  					<table align="center">
	  						<tr>
	  							<td rowspan="4"><img src="images/<%=item.getPicture()%>" width="200" height="160"/></td>
	  						</tr>
	  						<tr>
	  							<td><b><%=item.getName() %></b></td>
	  						</tr>
	  						</table>
	  						<p>
	  						<tr>
	  							<td>price：<font color="red"><b><%=item.getPrice() %></b></font></td>
	  						</tr>
	  						<tr>
	  							<td>
		  							 quantity：<span id="sub" onclick="sub();">-</span>
		  							<input type="text" id="number" name="number" value="1" size="2"/>
		  							<span id="add" onclick="add();">+</span>
	  							</td>
	  						</tr>
	  						</p>
	  					
	  					<div id="cart">
               				<table>
               				<p style= "text-align:center"><a href="javascript:selflog_show(<%=item.getId()%>)">add to cart</a></p>
               				<p style= "text-align:center"><a href="servlet/CartServlet?action=show">Show cart</a></p>
            		 	</table>
            		 	</div>
	  				</td>
  			<%
  				}	
  			 %>
  			 <!-- Cookie -->
  			 <%
  			 	String list = "";
  			 	
  			 	Cookie[]cookies = request.getCookies();
  			 	if(cookies!=null&&cookies.length>0){
	  			 	for(Cookie c:cookies){
	  			 		if(c.getName().equals("ListViewCookie")){
	  			 			list = c.getValue();
	  			 		}
	  			 		
	  			 		String[] arr = list.split(",");
	  			 		
	  			 		if(Arrays.binarySearch(arr, request.getParameter("id"))<0){
	  			 			list += request.getParameter("id") + ",";
	  			 		}
	  			 		
	  			 		if(arr!=null&&arr.length>1000){
	  			 			list = "";
	  			 		}

	  			 	}
	  			 }
  			  %>
  			  
  			  
  			  
  			</tr>
  		</table>
  	</center>
  	</div>
  </body>
</html>
