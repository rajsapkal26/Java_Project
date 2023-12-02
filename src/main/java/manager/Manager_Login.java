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


@WebServlet("/Manager_Login")
public class Manager_Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");	
		
		
		PrintWriter out = response.getWriter();		
				
try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
			Statement st = con.createStatement();
			
			ResultSet rs;
			
			
			
			  rs = st.executeQuery("select * from manager where m_username = '"+username+"' and m_password = '"+password+"'");
			 			
			
			
			if (rs.next()) {
				
				int m_id = rs.getInt("m_id");
				int d_id = rs.getInt("d_id");
				String department = rs.getString("m_department");
				String stored_username = rs.getString("m_username");
				String stored_password = rs.getString("m_password");
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("d_id", d_id);
				session.setAttribute("managerid", m_id);
				session.setAttribute("department", department);
				
			
				
				if (stored_username.equals(username) && stored_password.equals(password)) {
					response.sendRedirect("manager/Managers_Dashboard.jsp ");
			
				} else {
				
				    out.println("Login failed!"); 
					/* response.sendRedirect("manager/Manager_login.jsp"); */
				}
			 
			}else {
				 
				request.getSession().setAttribute("successMessage", "Username Or Password Wrong!.");

		        
		        response.sendRedirect(request.getContextPath() + "/manager/Manager_login.jsp");
			
			}
			
			}catch (Exception e) {
			
				out.println(e);
		}	
	}

}
