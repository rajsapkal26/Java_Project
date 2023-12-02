package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.ldap.Rdn;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Remove_emp")
public class Remove_emp extends HttpServlet {
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		String designation = request.getParameter("designation");
		String mobile = request.getParameter("mobile");
		String aadhar = request.getParameter("aadhar");
		
		PrintWriter out = response.getWriter();
		

    try {
       
        Class.forName("com.mysql.cj.jdbc.Driver");

     
        String url = "jdbc:mysql://localhost:3306/register";
        String username = "root";
        String password = "Raj#9011";
        Connection con = DriverManager.getConnection(url, username, password);


        Statement st = con.createStatement();

        ResultSet rs;      
		/*
		 * rs = st.
		 * executeQuery("SELECT * FROM employees e, city c, state s WHERE (e.e_name LIKE '%"
		 * + name + "%'  OR e.e_designation LIKE '%" + designation +
		 * "%' OR e.e_mobile LIKE '%" + mobile + "%' OR e.e_aadhar LIKE '%" + aadhar +
		 * "%' ) AND e.c_id = c.c_id   AND c.s_id = s.s_id");
		 */
        int removed_emp = 0;
        
        rs = st.executeQuery("SELECT * FROM employees e, city c, state s, department d WHERE (e.e_name like '%" + name + "%'  OR e.e_designation like '%" + designation + "%' OR e.e_mobile like '%" + mobile + "%' OR e.e_aadhar like '%" + aadhar + "%' )and e.e_status = '"+removed_emp+"' AND e.c_id = c.c_id   AND c.s_id = s.s_id AND e.d_id=d.d_id");


		while(rs.next()) {
			
			  out.println("<tr><td>"+rs.getInt("e_id")+"</td><td>"+rs.getString("e_name")+
			  "</td><td>"+rs.getDate("e_birthdate")+"</td><td>"+rs.getInt("e_age")+
			  "</td><td>"+rs.getString("e_gender")+"</td><td>"+rs.getString("e_mobile")+
			 "</td><td>"+rs.getString("e_mail")+"</td><td>"+rs.getString("e_aadhar")+
			  "</td><td>"+rs.getString("e_pan")+"</td><td>"+rs.getString("e_address")+
			  
			  "</td><td>"+rs.getString("d_name")+"</td><td>"+rs.getString("e_designation")+"</td><td>"+rs.getInt("e_salary")+
			  "</td><td>"+rs.getString("s_name")+"</td><td>"+rs.getString("c_name")+
			  "</td><td><a class='btn btn-danger text-white fw-bold' href='../Remove?e_id="+rs.getInt("e_id")+"'>Remove</a></td><tr>");
			 	}
		
		
		
}catch (Exception e) {
	out.println(e);
}
	}}
