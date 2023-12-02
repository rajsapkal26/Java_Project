<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/manager_dashboard_style.css">
  <link rel="stylesheet" href="../css/bg_color_style.css"> 
 
<title>Manager Dashboard</title>
</head>
<body>


	<%


    String username = (String) session.getAttribute("username");
    if (session != null && (username == null || username.isEmpty())) {
        response.sendRedirect("Manager_login.jsp");
    } else {
    
    }
    
    
    Integer managerid = (Integer) session.getAttribute("managerid");
    Integer d_id = (Integer) session.getAttribute("d_id");
    String work_id = request.getParameter("work_id");
    int newStatus = 0;
    int complete_status = 1;
    int incomplete_status = 2;

    		if (managerid != null && d_id != null) {
       		 int managerId = managerid.intValue();
        	int departmentId = d_id.intValue();
       	
        
    		} else {
        
    		}
    
    %>


	

	<%

		

			try{	
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement st = con.createStatement();
		ResultSet rs;
		
		int process = 0;
		
		rs = st.executeQuery("select * from manager_work mw where  mw.m_id = "+managerid+" ");
				

%>


 <div class="log_out_btn">
	 <div>
	 <header class="fs-1">Manager Dashboard</header>
	 </div>
	 <div>
	  <a class="btn btn-secondary btn-block fw-bold text-light" href="../Company_info/Home.jsp">Log Out</a>
	 </div>
  	</div>

  <div class="table-container mt-5">
  <header>Projects From CEO</header>
    <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>Work ID</th>
            <th>Title of Work</th>
            <th>Description of Work</th>
			<th>Deadline</th>
			<th>Submit</th>
			<th>Unable to Do</th>
			 
			
          </tr>
        </thead>
        
        <tbody >
        
        <% while(rs.next()){ 
        	
        	
        	%>
        <tr>
          <th><%= rs.getInt("mw_id") %></th>
            <th><%= rs.getString("mw_title") %></th>
            <th><%= rs.getString("mw_description") %></th>
			<th><%= rs.getDate("mw_deadline") %></th>
			<th><a href="Submit_work_manager.jsp?mw_id=<%= rs.getInt("mw_id") %>" class="btn btn-info">Click</a></th>
			<th><a href="Unable_to_do_manager.jsp?mw_id=<%= rs.getInt("mw_id") %>" class="btn btn-warning">Click</a></th>
          
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

<!--  Projects from CEO end --------------------------- -->




<%


			try{	
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con;
		
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement st = con.createStatement();
		
		ResultSet rs;
		
		
		
		rs = st.executeQuery("select * from employees e, department d, manager m where  "+ d_id +" = d.d_id and m.d_id= d.d_id and d.d_id = e.d_id and e_status = "+newStatus+"");

%>


	
  <div class="table-container mt-5">
    <header>Employees List</header>
  
    <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>E.ID</th>
            <th>Name</th>
            <th>Date Of Birth</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Mobile No.</th>
			<th>Email</th>
			<th>Department</th>
			<th>Designation</th>
			<th>Assign Work</th>
          </tr>
        </thead>
        
        <tbody >
        
        <% while(rs.next()){ 
        	
        	session.setAttribute("one", rs.getInt("m_id"));
    		
    		
        	%>
        <tr>
          <th><%= rs.getInt("e_id") %></th>
            <th><%= rs.getString("e_name") %></th>
            <th><%= rs.getDate("e_birthdate") %></th>
			<th><%= rs.getInt("e_age") %></th>
			<th><%= rs.getString("e_gender") %></th>
			<th><%= rs.getString("e_mobile") %></th>
			<th><%= rs.getString("e_mail") %></th>
			<th><%= rs.getString("d_name") %></th>
			<th><%= rs.getString("e_designation") %></th>
			<th><a href="Asign_work.jsp?e_id=<%= rs.getInt("e_id") %>" class="btn btn-primary">Assign</a></th>
         
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
  
  <hr>
  
  <!-- Employees List End ------------------------  -->
  
  
  
  
  
  	<!-- Employees Promotion List -->

	<%

		

			try{	
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement st = con.createStatement();
		ResultSet rs;
		
		int process = 0;
		
		
		rs = st.executeQuery("SELECT ws.e_id, e.e_name, e.e_designation, d.d_name,e.promote_status, COUNT(*) as emp " +
                "FROM work_submit ws, employees e, department d " +
                "WHERE ws.ws_status = 1 AND e.e_id = ws.e_id AND d.d_id = e.d_id and ws.m_id = "+managerid+" " +
                "GROUP BY ws.e_id " +
                "HAVING COUNT(*) >= 5");
		
/* 		rs = st.executeQuery("select * from manager_work mw where  mw.m_id = "+managerid+" ");
 */				

%>




  <div class="table-container mt-5">
  
  
  
    <%
String successMessage = (String) request.getSession().getAttribute("successMessage");
if (successMessage != null) {
%>
<div class="success-message" style="color:green; font-weight: bolder; font-size:20px">
    <%= successMessage %>
</div>
<%
request.getSession().removeAttribute("successMessage"); 
}
%>
  
  
  <header>Employees for Promotion List</header>
    <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>Employee ID</th>
            <th>E. Name</th>
            <th>Designation</th>
			<th>Department</th>
			<th>Work count</th>
			<th>Send For Promotion to CEO</th>
			
          </tr>
        </thead>
        
        <tbody >
        
        <% while(rs.next()){ 
        	
        	
        	Integer promoted_status = 1;
        	Integer Promoted_status2 = 2;
        	Integer status = rs.getInt("promote_status");
        	
        	%>
        <tr>
          <th><%= rs.getInt("e_id") %></th>
            <th><%= rs.getString("e_name") %></th>
            <th><%= rs.getString("e_designation") %></th>
			<th><%= rs.getString("d_name") %></th>
			<th><%= rs.getString("emp") %></th>
			<%-- <th><a href="../Send_emp_to_ceo?e_id=<%= rs.getInt("e_id") %>" class="btn btn-primary">Send</a></th>
			<th><a href="Submit_work.jsp?w_id=<%= rs.getInt("w_id") %>" class="btn btn-info">Click</a></th>
			<th><a href="Unable_to_do.jsp?w_id=<%= rs.getInt("w_id") %>" class="btn btn-warning">Click</a></th>
          --%>
          
          
         <th>
  <% if (promoted_status.equals(status) || Promoted_status2.equals(status))  { %>
    <span class="btn btn-warning" style="color: gray; cursor: not-allowed;">Already Send</span>
  <% } else { %>
    <a href="../Send_emp_to_ceo?e_id=<%= rs.getInt("e_id") %>"
       class="btn btn-warning"
       type="submit">
      Send
    </a>
  <% } %>
</th> 
          
          
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
  
  
  
  
  <!-- complete seciton------------------------ -->
    
  <div class="d-lg-flex justify-content-center">
  
      <div class="table-container mt-5 ">
    <header>Complete Works</header>
     <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>E.ID</th>
            <th>Work ID</th>
            <th>Name</th>
			<th>Work Title</th>
			<th>Work Description</th>
			<th>Submit Date</th>
			
          </tr>
        </thead>
        
        <tbody >
        
        <%
        
        try{
        
       		 Connection con2;
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");

        	Statement complete = con2.createStatement();
        	ResultSet completers;
        
    		completers  = complete.executeQuery("select * from work_submit ws, work w, employees e, manager m, department d where "+ d_id +" = d.d_id and m.d_id= d.d_id and d.d_id = e.d_id and ws.ws_status = "+complete_status+" and w.w_id = ws.w_id and e.e_id = ws.e_id and m.m_id = ws.m_id and w.m_id ");	
			
        while(completers.next()){ 
        	
        
    		
        	%>
        <tr>
          <th><%= completers.getInt("e_id") %></th>
            <th><%= completers.getInt("w_id") %></th>
            <th><%= completers.getString("e_name") %></th>
			<th><%= completers.getString("w_title") %></th>
			<th><%= completers.getString("ws_description") %></th>
			<th><%= completers.getDate("ws_date") %></th>
			
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
    
      <!-- complete section end------------------------ -->
    
    
    
    
    <!-- incomplete section------------------------ -->  
    
          <div class="table-container mt-5 ">
     <header>Incomplete Works</header>
      <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>E.ID</th>
            <th>Work ID</th>
            <th>Name</th>
			<th>Work Title</th>
			<th>Work Description</th>
			<th> Date</th>
			<th> Assign to Another Employee </th>
			
          </tr>
        </thead>
        
        <tbody >
        
        <%
        
        try{
        
       		 Connection con3;
		con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");

        	Statement incomplete = con3.createStatement();
        	ResultSet incompleters;
        
    		incompleters  = incomplete.executeQuery("select * from work_submit ws, work w, manager m, employees e, department d where "+ d_id +" = d.d_id and m.d_id = d.d_id and d.d_id = e.d_id and ws.ws_status = "+incomplete_status+" and w.w_id = ws.w_id and e.e_id = ws.e_id  ");	

        while(incompleters.next()){ 
        	
        	
        	  int w_status = incompleters.getInt("w_status");
        	  int w_id = incompleters.getInt("w_id");
        	
        	%>
        <tr>
          <th><%= incompleters.getInt("e_id") %></th>
            <th><%= incompleters.getInt("w_id") %></th>	
            <th><%= incompleters.getString("e_name") %></th>
			<th><%= incompleters.getString("w_title") %></th>
			<th><%= incompleters.getString("ws_description") %></th>
			<th><%= incompleters.getDate("ws_date") %></th>
<%-- 			<th>  <a href="Managers_Dashboard.jsp?work_id=<%= incompleters.getInt("w_id") %>"    class="btn btn-warning"  type="submit" >Asign</a> </th>
 --%>			
			
<th>
  <% if (w_status == 1) { %>
    <span class="btn btn-warning" style="color: gray; cursor: not-allowed;">Work is completed</span>
  <% } else { %>
    <a href="Managers_Dashboard.jsp?work_id=<%= w_id %>"
       class="btn btn-warning"
       type="submit">
      Assign
    </a>
  <% } %>
</th>






	
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
    </div>
    
    <hr>
    
        <!-- incomplete section end------------------------ -->  
    
    
    
        <!-- re-asign work section ------------------------ -->  
    
      <div class="table-container mt-5">
    
       <form action ="../Re_asign_work" method="post">
       
       <div class="fields">
      <div class="input-field">
       <label>Work ID</label>
        <input type="text" readonly  value="<%= work_id %>" class="p-2" name= "work_id" /> 
      </div>
    
    <div class="input-field">
           <label>Enter Employee Id for Re-Assign Work</label>
        <input type="text" placeholder="Enter Employee Id" class="p-2" name = "emp_id" />
      </div>
    
    <div class="input-field">
       <label>Deadline</label>
        <input type="date" class="p-2" name = "date" />
      </div>
        </div>
        
      <div>
        <button type="submit" class="btn btn-primary">Re-Assign Work</button> 
      </div>
      </form>
    </div>
    
    <hr>
    
    
     <!-- re-asign work section complete  ------------------------ -->  
    
    
    
    
    <!--  Search Employee ------------------------ -->
    
    
<section class="section">

  <div class="container-fluid container_1">
 
<header>Search Employees</header>
  
    
    
    <form name="form" id="form" action="" method="post">
      <div class="row">
        <div class="col-md-6 col-lg-3">
          <div class="input-field">
            <label for="Name">Search by Full Name</label>
            <input type="text" placeholder="Search by Full Name" id="input1" name="name" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="input-field">
            <label for="Mobile-Number">Search by Mobile Number</label>
            <input type="text" placeholder="Search by Mobile Number" id="input2" name="mobile" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="input-field">
            <label for="Designation">Search by Designation</label>
            <input type="text" placeholder="Search by Designation" id="input3" name="designation" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="input-field">
            <label for="Aadhar-Number">Search by Aadhar Number</label>
            <input type="text" placeholder="Search by Aadhar Number" id="input4" name="aadhar" class="form-control">
          </div>
        </div>
        
      </div>
      
      <div class="row mt-3 ">
        
        <div class="col-md-8">
          <button type="button" id="btn_m" class="btn btn-primary mb-2">Search</button>
          
        </div>
      </div>
    </form>
  </div>
      
  <div class="table-container mt-5">
    <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>E.ID</th>
            <th>Name</th>
            <th>Date Of Birth</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Mobile No.</th>
			<th>Email</th>
			<th>Department</th>
			<th>Designation</th>
          </tr>
        </thead>
        
        <tbody id="tbody">
          <!-- Table body content -->
        </tbody>
        
      </table>
    </div>
  </div>
  
</section> 
    
   <hr>
   
   
   
   
   <!-- in process work -----------------------------  -->
   
   
   	<%		try{	
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con3;
		
		con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement st  = con3.createStatement();
		
		ResultSet process_work;
		
		int process = 0;
		
		process_work = st.executeQuery("select * from employees e, department d, work w where  w.e_id = e.e_id and d.d_id = "+d_id+" and e.d_id = d.d_id and w.w_status = "+ process +" and e_status = "+newStatus+"");

%>
   
  <div class="table-container mt-5">
       <header>In Process Works</header>
  
    <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>E.ID</th>
            <th>Work ID</th>
            <th>Name</th>
			<th>Work Title</th>
			<th>Work Description</th>
			<th>Deadline</th>
			<th>Start Chat</th>
          </tr>
        </thead>
        
        <tbody >
        
        <% while(process_work.next()){ %>
   	
        <tr>
          <th><%= process_work.getInt("e_id") %></th>
          <th><%= process_work.getInt("w_id") %></th>
            <th><%= process_work.getString("e_name") %></th>
            <th><%= process_work.getString("w_title") %></th>
			<th><%= process_work.getString("w_description") %></th>
			<th><%= process_work.getDate("w_deadline") %></th>
	
			<th><a href="Manager_message.jsp?employeeid=<%=process_work.getInt("e_id")%>&workid=<%=process_work.getInt("w_id")%>" class="btn btn-primary">Massage</a></th>
         
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
    
    

  <script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>  
<script src ="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../js/managers_dashboard_script.js"></script>

</body>
</html>