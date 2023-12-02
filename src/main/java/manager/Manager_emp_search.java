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


@WebServlet("/Manager_emp_search")
public class Manager_emp_search extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String designation = request.getParameter("designation");
		String mobile = request.getParameter("mobile");
		String aadhar = request.getParameter("aadhar");
		
		PrintWriter out = response.getWriter();
		
		
		HttpSession session = request.getSession();
		int d_id = (int) session.getAttribute("d_id");
		

    try {
       
        Class.forName("com.mysql.cj.jdbc.Driver");

     
        String url = "jdbc:mysql://localhost:3306/register";
        String username = "root";
        String password = "Raj#9011";
        Connection con = DriverManager.getConnection(url, username, password);


        Statement st = con.createStatement();

        ResultSet rs;      
		
        
      int removed_emp = 0;
 
        rs = st.executeQuery("select * from employees e, department d, manager m WHERE (e.e_name like '%" + name + "%'  or e.e_designation like '%" + designation + "%' or e.e_mobile like '%" + mobile + "%' or e.e_aadhar like '%" + aadhar + "%' )and e.e_status = '"+removed_emp+"' AND  "+ d_id +" = d.d_id and m.d_id= d.d_id and d.d_id = e.d_id");

        
		while(rs.next()) {
			
			  out.println("<tr><td>"+rs.getInt("e_id")+"</td><td>"+rs.getString("e_name")+
			  "</td><td>"+rs.getDate("e_birthdate")+"</td><td>"+rs.getInt("e_age")+
			  "</td><td>"+rs.getString("e_gender")+"</td><td>"+rs.getString("e_mobile")+
			 "</td><td>"+rs.getString("e_mail")+"</td><td>"+rs.getString("d_name")+"</td><td>"+rs.getString("e_designation")+"</td><tr>");
			 	}
       

}catch (Exception e) {
	out.println(e);
}
	

}

		
	}


