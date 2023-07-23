package cn.stopshop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.stopshop_model.Cart;
import cn.stopshop.connection.DbCon;
import cn.stopshop.lsg.Orderlsg;
import cn.stopshop_model.*;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			
			 SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			 Date date = new Date();
			 
			 ArrayList<Cart>  cart_list = (ArrayList<Cart>)  request.getSession().getAttribute("cart-list");
			 User auth = (User) request.getSession().getAttribute("auth");
			 
			 if(cart_list !=null && auth!= null) {
				 
				 for(Cart c:cart_list) {
					 Order order = new Order();
					 order.setId(c.getId());
					 order.setUid(auth.getId());
					 order.setQuantity(c.getQuantity());
					 order.setDate(formatter.format(date));
					 
					 Orderlsg olsg = new Orderlsg(DbCon.getConnection());
					 boolean result = olsg.insertOrder(order);
					 if(!result) break;
				 }
				 cart_list.clear();
				 response.sendRedirect("orders.jsp");
				 
				 
			 }else {
				 if(auth == null) response.sendRedirect("login.jsp");
				 response.sendRedirect("cart.jsp");
			 }
			
			}catch(Exception e) {
			e.printStackTrace();
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
