package employee;

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


@WebServlet("/Re_asign_work")
public class Re_asign_work extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String w_id = request.getParameter("work_id");		
		String emp_id = request.getParameter("emp_id");
		String date  = request.getParameter("date");
		
		PrintWriter out  = response.getWriter();		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement st = con.createStatement();
		
		
		st.executeUpdate("update work set e_id = "+emp_id+", w_deadline = '"+ date +"'  where w_id = "+w_id+"");
		
		 

		
		response.sendRedirect("manager/Managers_Dashboard.jsp"); 
		
		}catch (Exception e) {
			out.println(e);
			}
		
		
	}

}
