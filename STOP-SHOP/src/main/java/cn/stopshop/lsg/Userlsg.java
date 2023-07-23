package cn.stopshop.lsg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.stopshop_model.User;

public class Userlsg {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public Userlsg(Connection con) {
		
		this.con = con;
	}
	 public User userLogin (String email,String password) {
		 User user = null;
		 try {
			 query = "select * from user where email=? and password=?";
			 pst = this.con.prepareStatement(query);
			 pst.setString(1, email);
			 pst.setString(2, password);
			 rs  =pst.executeQuery();
			 
			 if (rs.next()) {
				 user = new User();
				 user.setId(rs.getInt("id"));
				 user.setName(rs.getString("name"));
				 user.setEmail(rs.getString("email"));
			 }
			 
		 }
		   catch (Exception e) {
			 e.printStackTrace();
			 System.out.print(e.getMessage());
			 
		 }
		 
		 
		 return user;
		 
	 }
	

}
