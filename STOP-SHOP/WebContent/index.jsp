<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="cn.stopshop.lsg.Productlsg"%>
<%@page import="cn.stopshop.connection.DbCon"%>
<%@page import="cn.stopshop_model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
	
}
    Productlsg pl = new Productlsg(DbCon.getConnection());
    List<Product> product = pl.getAllProducts();
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
   if(cart_list != null) {
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
		<div class="card-header my-3 text-white"  style="background-color: #00AA9E;">
			All Products</div>
			<div class="row">
			<%
			if( !product.isEmpty()){
				for(Product p:product){%>
					<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
				<img class="card-img-top" src="Project-Images/<%= p.getImage() %>"alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title"><%= p.getName() %></h5>
					<h6 class="price">Price: &#8377;<%= p.getPrice() %></h6>
					<h6 class="category">Category: <%= p.getCategory() %></h6>
					<div class="mt-3 d-flex justify-content-between">
					<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-warning">Add to Cart</a>
					<a href="order-now?quantity=1&id=<%= p.getId() %>" class="btn btn-dark">Buy Now</a></div>
				</div>
			</div>
			</div>
			<%}
			}
			%>
				
			</div>
		
	</div>

	<%@include file="added/foot.jsp"%>
</body>
</html>