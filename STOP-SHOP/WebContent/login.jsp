
<%@page import="java.util.*"%>
<%@page import="cn.stopshop_model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	User auth = (User)request.getSession().getAttribute("auth");
	if (auth !=null){
		
		response.sendRedirect("index.jsp");
		
	}
	 ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	   if(cart_list != null) {
	    	request.setAttribute("cart_list", cart_list);
	    }
	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="added/navbar.jsp"%>
<title>STOP-SHOP Login</title>
<%@include file="added/head.jsp" %>
</head>
<body> 
<div class="container">
<div class="card w-50 mx-auto my-5">
<div class="card-header text-center text-white" style="background-color: #00AA9E;" >User Login</div>
<div class="card-body">
<form action="users-login" method="post">

<div class="form-group">
<label>Email Address</label>
<input type="email" class="form-control" name="login-email" placeholder="Enter your Email">
</div>

<div class="form-group">
<label>Password</label>
<input type="password" class="form-control" name="login-password" placeholder="******">
</div>
<div class="text-center">
<button type="submit" class="btn btn-warning">Login</button></div>

</form>
</div>
</div>
</div>

 
<%@include file="added/foot.jsp" %>
</body>
</html>