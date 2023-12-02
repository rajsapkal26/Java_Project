package manager;

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


@WebServlet("/Manager_messages_entry")
public class Manager_messages_entry extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();
		/* Integer managerid = (Integer) session.getAttribute("managerid"); */
		Integer d_id = (Integer) session.getAttribute("d_id");
		String employeeid = request.getParameter("employeeid");
		String workid = request.getParameter("workid");
		String managerid = request.getParameter("managerid");
		
		PrintWriter out = response.getWriter();
				
				
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con;
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
			Statement st  = con.createStatement();
			
			int manager_msg = 2;
		
		
			
		ResultSet rs;
	
			 rs = st.executeQuery("select * from messages where e_id = '"+employeeid+"' and w_id = '"+workid+"' and m_id = '"+managerid+"' and mes_status = "+manager_msg+"");

		 while(rs.next()) {
			 
				out.println(" <br> <div class=\"bg-warning m-2 p-2 rounded-2 text-white fs-4\" >"+rs.getString("mes_messages")+"</div>");
					 
		 }
		 
	
		 
		}catch (Exception e) {
			out.println(e);
		}
		
	}

}
