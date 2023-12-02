package ceo;

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


@WebServlet("/Send_emp_to_ceo")
public class Send_emp_to_ceo extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
String e_id = request.getParameter("e_id");
		
		int newStatus = 1;
		
PrintWriter out = response.getWriter();	
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");	
		Statement st = con.createStatement();
//		ResultSet rs;
		
		st.executeUpdate("UPDATE employees SET promote_status = "+ newStatus +"  WHERE e_id="+e_id+"");
		
		   request.getSession().setAttribute("successMessage", "Employee Send successfully!.");

	        
	        response.sendRedirect(request.getContextPath() + "/manager/Managers_Dashboard.jsp");
		

		
		}catch (Exception e) {
			out.println(e);
		}
		
		
	}

}
