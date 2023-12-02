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


@WebServlet("/Emp_promotion")
public class Emp_promotion extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String e_id = request.getParameter("e_id");
		PrintWriter out = response.getWriter();		
		
		try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement st = con.createStatement();
		
		st.executeUpdate("update employees set promote_status = 2 where e_id = "+e_id+"");
		
		out.println("updated");
		
		
		}catch (Exception e){
			out.println(e);
		}
	}

}
