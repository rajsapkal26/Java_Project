package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class Login extends HttpServlet {
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");	
		PrintWriter out = response.getWriter();		
		
try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
			Statement st = con.createStatement();
			ResultSet rs;
		
			
			rs = st.executeQuery("select * from admin");
			
			while(rs.next()) {
				rs.getInt("a_id");
			String stored_username = rs.getString("a_username");
			String  stored_password = rs.getString("a_password");
			
			if(stored_username.equals(username) && stored_password.equals(password) ) {
				  HttpSession session = request.getSession();
				  session.setAttribute("username", username);
				response.sendRedirect("admin/Admin_Dashboard.jsp");
			}else {
				
				response.sendRedirect("admin/Admin_login.jsp");
				
				
			}}
			
			}catch (Exception e) {
			out.println(e);
		}	
	}

}
