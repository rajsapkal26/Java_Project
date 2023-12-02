<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="../css/ceo_dashboard_style.css">
  <link rel="stylesheet" href="../css/bg_color_style.css"> 
<title>Ceo Dashboard</title>
</head>
<body>



<%


    String username = (String) session.getAttribute("username");
    if (session != null && (username == null || username.isEmpty())) {
        response.sendRedirect("Ceo_login.jsp");
    } else {
    
    }
    %>
    
    
    			
	<%	
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con;
		
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement st = con.createStatement();
		
		ResultSet rs;
		
		
		rs = st.executeQuery("select * from manager");

	%>
	
	 <div class="log_out_btn">
	 <div>
	 <header class="fs-1">CEO Dashboard</header>
	 </div>
	 <div>
	  <a class="btn btn-secondary btn-block fw-bold text-light" href="../Company_info/Home.jsp">Log Out</a>
	 </div>
  	</div>
	
  <div class="table-container mt-5">
  <header>Managers List</header>
    <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>M.ID</th>
            <th>Manager Name</th>
            <th>Department</th>
			<th>Assign Projects</th>
			<th>Show Employees</th>
          </tr>
        </thead>
        
        <tbody >
        
        <% while(rs.next()){ 
        	
      		int manager_id = rs.getInt("m_id");

    		
        	%>
        	    <div class="d-none"><input type="text" id="input" value="<%= manager_id %>" /></div>
        	
        
        <tr>
          <th><%= rs.getInt("m_id") %></th>
            <th><%= rs.getString("m_username") %></th>
            <th><%= rs.getString("m_department") %></th>
			<th><a href="ceo_asign_work.jsp?manager_id=<%= rs.getInt("m_id") %>" class="btn btn-primary">Assign</a></th>
         	<th><button id="show" onclick="showButtonClick(<%= rs.getInt("m_id")%>)" type="button" class="btn btn-primary">Show</button></th>
         
        </tr>
        
         <%  }  %>
         
          
        </tbody>
        
      </table>
    </div>
  </div>
  
  			
  
  <!--  Managers List End ------------------------------- -->
  
  
  <!-- Show Employees Start  -->
  


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
          </tr>
        </thead>
        
        <tbody id="t_body">
  
        </tbody>
        
      </table>
    </div>
  </div>
  
  <hr>
  
  
  <!-- Show Employees End------------------------------ -->
  
  
  
  
  
  <%	
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con2;
		
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement st2 = con2.createStatement();
		
		ResultSet rs2;
		
		int pomote_status = 1;
		Integer promoted_status =2;
		
		
		rs2 = st2.executeQuery("select * from employees e, department d, manager m where (e.promote_status = "+pomote_status+" or e.promote_status = "+promoted_status+") and e.d_id=d.d_id and m.d_id = d.d_id and e_status = 0 ");

	%>


	
  <div class="table-container mt-5">
  <header>Employees For Promotion</header>
    <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>E.ID</th>
            <th>Employee Name</th>
            <th>Manager Name</th>
            <th>Designation</th>
			<th>Department</th>
			<th>Promote</th>
          </tr>
        </thead>
        
        <tbody >
        
        <% while(rs2.next()){
        	
        	
        	Integer status = rs2.getInt("promote_status");
        	
        	%>
        <tr>
          <th><%= rs2.getInt("e_id") %></th>
            <th><%= rs2.getString("e_name") %></th>
            <th><%= rs2.getString("m_username") %></th>
            <th><%= rs2.getString("e_designation") %></th>
              <th><%= rs2.getString("d_name") %></th>
              
<%--             <th><a href="Emp_promotion.jsp?e_id=<%= rs2.getInt("e_id") %>" class="btn btn-primary">Promote</a></th>
 --%>              
       
         <th>
  <% if (promoted_status.equals(status)) { %>
    <span class="btn btn-warning" style="color: gray; cursor: not-allowed;">Promoted</span>
  <% } else { %>
    <a href="Emp_promotion.jsp?e_id=<%= rs2.getInt("e_id") %>"
       class="btn btn-primary"
       >
      Promote
    </a>
  <% } %>
</th> 
  
       
         <%  }  %>
         
          </tr>
        </tbody>
        
      </table>
    </div>
  </div>
  
  <!-- Employee Promotion End ----------------------------  -->
  
  
  


  
  <!-- complete seciton------------------------ -->
    
  <div class="d-lg-flex justify-content-center">
  
      <div class="table-container mt-5 ">
    <header>Complete Projects</header>
     <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>M.ID</th>
            <th>Project ID</th>
            <th>Manager Name</th>
			<th>Work Title</th>
			<th>Work Description</th>
			<th>Submit Date</th>
			
          </tr>
        </thead>
        
        <tbody >
        
        <%
        
        try{
        
       		 Connection con3;
		con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");

        	Statement complete = con3.createStatement();
        	ResultSet completers;
        	
        	int complete_status = 1;
        
    		completers  = complete.executeQuery("select * from manager_work_submit mws, manager_work mw, manager m where mws.mws_status = "+complete_status+" and mws.m_id = m.m_id and mws.mw_id = mw.mw_id ");	
			
        while(completers.next()){ 
        	
        
    		
        	%>
        <tr>
          <th><%= completers.getInt("m_id") %></th>
            <th><%= completers.getInt("mw_id") %></th>
            <th><%= completers.getString("m_username") %></th>
			<th><%= completers.getString("mw_title") %></th>
			<th><%= completers.getString("mw_description") %></th>
			<th><%= completers.getDate("mws_date") %></th>
			
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
     <header>Incomplete Projects</header>
      <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>M.ID</th>
            <th>Project ID</th>
            <th>Manager Name</th>
			<th>Work Title</th>
			<th>Work Description</th>
			<th> Date</th>
			<th> Assign Another Manager </th>
			
          </tr>
        </thead>
        
        <tbody >
        
        <%
        
        try{
        
       		 Connection con4;
		con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");

        	Statement incomplete = con4.createStatement();
        	ResultSet incompleters;
        	
        	int incomplete_status = 2;
        
    		incompleters  = incomplete.executeQuery("select * from manager_work_submit mws, manager_work mw, manager m where mws.mws_status = "+incomplete_status+" and mws.mw_id = mw.mw_id and mws.m_id = m.m_id  ");	

        while(incompleters.next()){ 
        	
        	
        	  int mw_status = incompleters.getInt("mw_status");
        	  int mw_id = incompleters.getInt("mw_id");
        	
        	%>
        	
        <tr>
          <th><%= incompleters.getInt("m_id") %></th>
            <th><%= incompleters.getInt("mw_id") %></th>	
            <th><%= incompleters.getString("m_username") %></th>
			<th><%= incompleters.getString("mw_title") %></th>
			<th><%= incompleters.getString("mw_description") %></th>
			<th><%= incompleters.getDate("mws_date") %></th>
<%-- 			<th>  <a href="Ceo_Dashboard.jsp?work_id=<%= incompleters.getInt("mw_id") %>"    class="btn btn-warning"  type="submit" >Asign</a> </th>
 --%>			
			
<th>
  <% if (mw_status == 1) { %>
    <span class="btn btn-warning" style="color: gray; cursor: not-allowed;">Work is completed</span>
  <% } else { %>
    <a href="Ceo_Dashboard.jsp?work_id=<%= mw_id %>"
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
    
    
    
    
    <%
    
    String work_id = request.getParameter("work_id");
    
    %>
        
        <!-- re-asign work section ------------------------ -->  
    
      <div class="table-container mt-5">
    
       <form action ="../Re_asign_work_manager" method="post">
       
       <div class="fields">
      <div class="input-field">
       <label>Work ID</label>
        <input type="text" readonly  value="<%= work_id %>" class="p-2" name= "work_id" /> 
      </div>
    
    <div class="input-field">
           <label>Enter Manager Id for Re-Asign Work</label>
        <input type="text" placeholder="Enter Employee Id" class="p-2" name = "manager_id" />
      </div>
    
    <div class="input-field">
       <label>Deadline</label>
        <input type="date" class="p-2" name = "date" />
      </div>
        </div>
        
      <div>
        <button type="submit" class="btn btn-primary">Re-Asign Work</button> 
      </div>
      </form>
    </div>
    
    <hr>
    
    
     <!-- re-asign work section complete------------------------ -->  
    
    
    
    
    
       <!--  Search Managers ------------------------ -->
    
    
<section class="section">

  <div class="container-fluid container_1">
 
<header>Search Managers</header>
  
    
    
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
            <label for="Designation">Search by Department</label>
            <input type="text" placeholder="Search by Department" id="input3" name="designation" class="form-control">
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
           <th>Manager.ID</th>
            <th>Manager Name</th>
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
   
   <!-- Search managers End  ------------------------------>
   
   
   
   
  <!-- in process work -----------------------------  -->
   
   
   	<%		try{	
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con4;
		
		con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","Raj#9011");
		Statement s4  = con4.createStatement();
		
		ResultSet process_work;
		
		int process = 0;
		
		process_work = st.executeQuery("select * from   manager_work mw, manager m where  mw.mw_status = "+ process +" and mw.m_id = m.m_id ");

%>
   
  <div class="table-container mt-5">
       <header>In Process Works</header>
  
    <div class="table-responsive">
      <table class="table table-bordered border-info text-white align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
           <th>M.ID</th>
            <th>Project ID</th>
            <th>Manager Name</th>
			<th>Work Title</th>
			<th>Work Description</th>
			<th>Deadline</th>
          </tr>
        </thead>
        
        <tbody >
        
        <% while(process_work.next()){ %>
   	
        <tr>
          <th><%= process_work.getInt("m_id") %></th>
          <th><%= process_work.getInt("mw_id") %></th>
            <th><%= process_work.getString("m_username") %></th>
            <th><%= process_work.getString("mw_title") %></th>
			<th><%= process_work.getString("mw_description") %></th>
			<th><%= process_work.getDate("mw_deadline") %></th>
	         
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
<script type="text/javascript" src="../js/ceo_dashboard_script.js"></script>


</body>
</html>