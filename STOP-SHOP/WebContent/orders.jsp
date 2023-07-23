<%@page import="cn.stopshop.lsg.Orderlsg"%>
<%@page import="java.util.*"%>
<%@page import="cn.stopshop.connection.DbCon"%>
<%@page import="cn.stopshop_model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
List<Order>  orders = null;
if (auth != null) {
	request.setAttribute("auth", auth);
	  orders = new Orderlsg(DbCon.getConnection()).userOrders(auth.getId());
} else {
    response.sendRedirect("login.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>

<title>Welcome to STOP-SHOP!</title>
<%@include file="added/head.jsp"%>
</head>
<body>
	<%@include file="added/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>

				</tr>
			</thead>
			<tbody>
			<%
			if(orders != null) {
				for(Order o:orders) {%>
				<tr>
				<td><%= o.getDate() %> </td>
				<td><%= o.getName() %> </td>
				<td><%= o.getCategory() %> </td>
				<td><%= o.getQuantity() %> </td>
				<td>&#8377;<%= o.getPrice() %> </td>
				<td><a class="btn btn-sm btn-danger"  href="cancel-order?id=<%= o.getOrderId() %>"> Cancel</a></tr>
					</tr>
				<%}
			}
			%>
			</tbody>
      </table>
	</div>


	<%@include file="added/foot.jsp"%>
</body>
</html>