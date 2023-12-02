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
import javax.servlet.http.HttpSession;


@WebServlet("/Ceo_manager_search")
public class Ceo_manager_search extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String name = request.getParameter("name");
		String department = request.getParameter("department");
		
		
		PrintWriter out = response.getWriter();
		

    try {
       
        Class.forName("com.mysql.cj.jdbc.Driver");

     
        String url = "jdbc:mysql://localhost:3306/register";
        String username = "root";
        String password = "Raj#9011";
        Connection con = DriverManager.getConnection(url, username, password);


        Statement st = con.createStatement();

        ResultSet rs;      
		
        
 
        rs = st.executeQuery("select * from manager  WHERE m_username like '%" + name + "%'  or m_department like '%" + department + "%' ");

        
		while(rs.next()) {
			
			  out.println("<tr><td>"+rs.getInt("m_id")+"</td><td>"+rs.getString("m_username")+
			  "</td><td>"+rs.getString("m_department")+"</td><td>"+rs.getString("m_designation")+"</td><tr>");
			 	}
       

}catch (Exception e) {
	out.println(e);
}
	

		
	}

}
