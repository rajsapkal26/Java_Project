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


@WebServlet("/City")
public class City extends HttpServlet {

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String select = request.getParameter("main");
		PrintWriter out = response.getWriter();
		
		
		try {
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
			Statement st = con.createStatement();
			ResultSet rs;
			
			rs = st.executeQuery("select * from city inner join state on city.s_id=state.s_id and state.s_name= '" + select + "'");
			
			while(rs.next()) {
				
				out.println("<option value='"+rs.getInt("c_id")+"'>"+rs.getString("c_name")+"</option>");
				
			}
			
		}catch (Exception e) {
			out.println(e);
		}
		
	}

}
