package ceo;

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


@WebServlet("/Show_emps_to_ceo")
public class Show_emps_to_ceo extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String main = request.getParameter("main");
		String m_id = request.getParameter("m_id");
		PrintWriter out	 = response.getWriter();
		
		try {
			

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con;
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
			Statement st = con.createStatement();
			
			ResultSet rs;
			
			
			if(main.equals("success")) {
				
			rs = st.executeQuery("select * from employees e, manager m, department d where m.m_id = "+m_id+" and m.d_id = d.d_id and d.d_id=e.d_id");
			while(rs.next()) {
				
				out.println("<tr><td>"+rs.getInt("e_id")+"</td><td>"+rs.getString("e_name")+"</td><td>"+rs.getDate("e_birthdate")+"</td><td>"+rs.getInt("e_age")+"</td><td>"+rs.getString("e_gender")+"</td><td>"+rs.getString("e_mobile")+"</td><td>"+rs.getString("e_mail")+"</td><td>"+rs.getString("d_name")+"</td><td>"+rs.getString("e_designation")+"</td></tr>");
			}
			
			}
			
			
		}catch (Exception e) {
			out.println(e);
		}
		
	}

}
