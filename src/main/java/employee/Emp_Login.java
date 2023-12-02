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


@WebServlet("/Emp_Login")
public class Emp_Login extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");	
		PrintWriter out = response.getWriter();		
		
try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
			Statement st = con.createStatement();
			ResultSet rs;
		
			
			rs = st.executeQuery("select * from employees where e_username = '"+username+"' and e_password = '"+password+"'");
			
			if(rs.next()) {
				
			String stored_username = rs.getString("e_username");
			String  stored_password = rs.getString("e_password");
			

			 int e_id_emp = rs.getInt("e_id"); 
			 HttpSession session = request.getSession();
			 session.setAttribute("username", username);
			 session.setAttribute("e_id_emp", e_id_emp); 
			 
			
			if (stored_username.equals(username) && stored_password.equals(password)) {
				response.sendRedirect("employee/Employees_Dashboard.jsp ");
		
			} else {
			
					out.println("invalid");
			}
			
			}else {
				request.getSession().setAttribute("successMessage", "Username Or Password Wrong!.");

		        
		        response.sendRedirect(request.getContextPath() + "/employee/Employee_login.jsp");
			
			}
			
			}catch (Exception e) {
			out.println(e);
		}	
	}

}
