package employee;

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
import javax.servlet.http.HttpSession;


@WebServlet("/Employee_message_entry")
public class Employee_message_entry extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String main = request.getParameter("main");
		
		HttpSession session = request.getSession();
		Integer m_id = (Integer) session.getAttribute("m_id");
		Integer d_id = (Integer) session.getAttribute("d_id");
		String emp_id = request.getParameter("emp_id")	;
		String wor_id = request.getParameter("wor_id");
		
		PrintWriter out = response.getWriter();
				
				
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con;
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
			Statement st  = con.createStatement();
			
			
		int employee_msg = 1;
		
		ResultSet rs;

		if(main.equals("success")) {
			
			 rs = st.executeQuery("select * from messages where e_id = "+emp_id+" and w_id = "+wor_id+" and m_id = "+m_id+" and mes_status = "+employee_msg+"");


		 while(rs.next()) {
			 
			 out.println("<div>"+rs.getString("mes_messages")+"</div>");			 
		 }
		 
		 }else {
			 out.print("data not available");
		 }
		 
		}catch (Exception e) {
			out.println(e);
		}

		
	}

}
