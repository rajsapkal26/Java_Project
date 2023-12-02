package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/State_city")
public class State_city extends HttpServlet {
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String select = request.getParameter("main");
		PrintWriter out = response.getWriter();
try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
			Statement st = con.createStatement();
			ResultSet rs;
		
			if(select.equals("success")) {
				rs = st.executeQuery("select * from state");
				
				while(rs.next()) {
				
					out.println("<option value='"+rs.getString("s_name")+"'>"+rs.getString("s_name")+"</option>");
					
				}
		
			}else {
				out.println("error");
			}
					}catch (Exception e) {
			out.println(e);
		}	
	
	}}
		
		
	


