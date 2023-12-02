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


@WebServlet("/Registration")
public class Registration extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String birth_date = request.getParameter("birth_date");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String aadhar = request.getParameter("aadhar");
		String pan = request.getParameter("pan");
		String designation = request.getParameter("designation");
		String department = request.getParameter("department");
		String salary = request.getParameter("salary");
		String address = request.getParameter("address");
		String c_id = request.getParameter("city");
		int status = 0;
		int promote_status = 0;
		
		PrintWriter out = response.getWriter();	
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");	
		Statement st = con.createStatement();
		Statement mt = con.createStatement();
		
		ResultSet countResult = mt.executeQuery("select count(*) as t from employees");

        int count = 0;  
        if (countResult.next()) {
            count = countResult.getInt("t"); 
        }

        count++; 

        String countString = Integer.toString(count);
	    
	    System.out.println(countString);
		
		
		
		
		
		
		st.executeUpdate("INSERT INTO employees (e_name, e_birthdate, e_age, e_gender, e_mobile, e_mail, e_aadhar, e_pan, e_address, e_designation, e_salary, c_id, e_status, e_username, e_password, d_id, promote_status) VALUES ('" + name + "', '" + birth_date + "', " + age + ", '" + gender + "', '" + mobile + "', '" + email + "', '" + aadhar + "', '" + pan + "', '" + address + "', '" + designation + "', " + salary + ", " + c_id + ", '"+ status +"', '" + email + "','" + name  + age  +  countString +"', '"+department+"',"+promote_status+")");
		

		
		
		   request.getSession().setAttribute("successMessage", "Employee Add successfully!.");
	        
	        response.sendRedirect(request.getContextPath() + "/admin/Registration.jsp");
		
		
		}catch (Exception e) {
			out.println(e);
		}
		
	}

}
