<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/employee_dashboard_style.css">
  <link rel="stylesheet" href="../css/bg_color_style.css"> 
 
<title>Insert title here</title>
</head>
<body>



<%


    String username = (String) session.getAttribute("username");
    if (session != null && (username == null || username.isEmpty())) {
        response.sendRedirect("Employee_login.jsp");
    } else {
    
    }
    %>


<%

		Integer e_id_emp = (Integer) session.getAttribute("e_id_emp");
		int newStatus = 0;


		if (e_id_emp != null) {
   		 int managerId = e_id_emp.intValue();
   
    
		} else {
    
		}

			try{	
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement st = con.createStatement();
		ResultSet rs;
		
		int process = 0;
		
		rs = st.executeQuery("select * from employees e, manager m, work w where  "+ e_id_emp +" = w.e_id and e.e_id = w.e_id and e.d_id = m.d_id and w.w_status = "+process+" and e.e_status = "+newStatus+"");
				

%>

<div class="log_out_btn">
	 <div>
	 <header class="fs-1">Employee Dashboard</header>
	 </div>
	 <div>
	  <a class="btn btn-secondary btn-block fw-bold text-light" href="../Company_info/Home.jsp">Log Out</a>
	 </div>
  	</div>


  <div class="table-container mt-5">
  <header>Employee Dashboard</header>
    <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>Work ID</th>
           <th>Manager Name</th>
            <th>Title of Work</th>
            <th>Descrtiption of Work</th>
			<th>Deadline</th>
			<th>Start Chat</th>
			<th>submit</th>
			<th>Unable to Do</th>
			
			
          </tr>
        </thead>
        
        <tbody id="tbody">
        
        <% while(rs.next()){ 
        	
        	
    		session.setAttribute("e_id", rs.getInt("e_id"));
    		session.setAttribute("manager_id", rs.getInt("m_id"));
    		
        	%>
        <tr>
          <th><%= rs.getInt("w_id") %></th>
          <th><%= rs.getString("m_username") %></th>
            <th><%= rs.getString("w_title") %></th>
            <th><%= rs.getString("w_description") %></th>
			<th><%= rs.getDate("w_deadline") %></th>
			<th><a href="Employees_message.jsp?emp_id=<%=rs.getInt("e_id")%>&wor_id=<%=rs.getInt("w_id")%>" class="btn btn-primary">Massage</a></th>
			<th><a href="Submit_work.jsp?w_id=<%= rs.getInt("w_id") %>" class="btn btn-info">Click</a></th>
			<th><a href="Unable_to_do.jsp?w_id=<%= rs.getInt("w_id") %>" class="btn btn-warning">Click</a></th>
         
         <%  }
    	}catch (Exception e) {
			out.println(e);
		}	
          %>
         
          </tr>
        </tbody>
        
      </table>
    </div>
  </div>






</body>
</html>