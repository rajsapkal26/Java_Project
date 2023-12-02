package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Update")
public class Update extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		HttpSession session  = request.getSession();
		String e_id = (String)session.getAttribute("e_id");
		
		String name = request.getParameter("name");
		String birth_date = request.getParameter("birth_date");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String aadhar = request.getParameter("aadhar");
		String pan = request.getParameter("pan");
		String designation = request.getParameter("designation");
		String salary = request.getParameter("salary");
		String address = request.getParameter("address");
		/*
		 * String city = request.getParameter("city"); String state =
		 * request.getParameter("state");
		 */
		
		PrintWriter out = response.getWriter();	
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");	
		Statement st = con.createStatement();
		
		
		st.executeUpdate("UPDATE employees SET e_name='"+name+"', e_birthdate='"+birth_date+"', e_age="+age+", e_gender='"+gender+"', e_mobile='"+mobile+"', e_mail='"+email+"', e_aadhar='"+aadhar+"', e_pan='"+pan+"', e_address='"+address+"', e_designation='"+designation+"', e_salary="+salary+" WHERE e_id='"+e_id+"'");
		
	
	
	    request.getSession().setAttribute("successMessage", "Employee details updated successfully!.");

        
        response.sendRedirect(request.getContextPath() + "/admin/Edit.jsp");
		
		
		}catch (Exception e) {
			out.println(e);
		}
		
	}
		
		
	}


