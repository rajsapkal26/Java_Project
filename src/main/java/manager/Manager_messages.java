package manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class Manager_messages extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		Integer managerid = (Integer) session.getAttribute("managerid");
		Integer d_id = (Integer) session.getAttribute("d_id");
		
		String message = request.getParameter("message");
		String employeeid = request.getParameter("employeeid");
		String workid = request.getParameter("workid");
		
		PrintWriter out = response.getWriter();
		
		try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con;
		
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement st  = con.createStatement();
		
		int manager_msg = 2;
		
		
		
		
		
		st.executeUpdate(" insert into messages (mes_messages, e_id, w_id, m_id, mes_status) values ('"+message+"', "+employeeid+", "+workid+", "+managerid+", "+manager_msg+") ");
		
		
		
		response.sendRedirect ("manager/Manager_message.jsp?employeeid="+employeeid+"&workid="+workid+"");
		
		 
		 
		}catch (Exception e) {
			out.println(e);
		}
	}

}
