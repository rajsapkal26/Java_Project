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
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/manager_message_style.css"> 
<title>Employees Messaging</title>
</head>
<body>


		<% 
		
		

		String emp_id = request.getParameter("emp_id");
		String wor_id = request.getParameter("wor_id");
		Integer m_id = (Integer) session.getAttribute("manager_id");
		
		
		%>	
	


  <div class=" container_1">
 
<header>Messaging</header>
  
    
    
    
    
       
       
       <div class="row">
       
        <div id ="m_message" class="col-lg-6">  </div>
        
        <div id ="e_message" class="col-lg-6"></div>
        
        </div>
        
   

</div>

 
      <div class="fixed">
          
           <form name="form" id="form" action="../Employees_messages?emp_id=<%=emp_id%>&wor_id=<%=wor_id%>" method="post">
       
        <div class="">
         <div class="input-group mb-3 input-field">
  			<input type="text" class="form-control" name="message" id="message" placeholder="Message.........." aria-label="Recipient's username" aria-describedby="button-addon2">
 			 <button class="btn btn-primary" id="btn_m" type="submit" id="button-addon2">Send Message</button>
		</div>
		</div>
        </form>
        
      </div>
			


	
<div class="d-none">
  
  <input value="<%= emp_id %>" id="employeeid" />
    <input value="<%= wor_id %>" id="workid" />
        <input value="<%= m_id %>" id="managerid" />
    
  
  </div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="../js/employee_message_script.js" ></script>
</body>
</html>