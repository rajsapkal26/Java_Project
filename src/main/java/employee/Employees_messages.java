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
import javax.servlet.http.HttpSession;


@WebServlet("/Employees_messages")
public class Employees_messages extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String message = request.getParameter("message");

		HttpSession session = request.getSession();
		Integer m_id = (Integer) session.getAttribute("manager_id");
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
		
		st.executeUpdate(" insert into messages (mes_messages, e_id, w_id, m_id, mes_status) values ('"+message+"', "+emp_id+", "+wor_id+", "+m_id+", "+employee_msg+") ");
		
		 response.sendRedirect ("employee/Employees_message.jsp?emp_id="+emp_id+"&wor_id="+wor_id+"");  
		
		
		}catch (Exception e) {
			out.println(e);
		}
		
		
	}

}
