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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/manager_message_style.css"> 
  <link rel="stylesheet" href="../css/bg_color_style.css"> 

<title>Manager Messaging</title>
</head>
<body>


		<% 

		String employeeid = request.getParameter("employeeid");
		String workid = request.getParameter("workid");
		Integer m_id = (Integer) session.getAttribute("managerid");

		
	
		%>		


  <div class=" container_1">
 

  

       <div class="row">
       
       <div id="e_message" class="col-lg-6">
       </div>
         <div id="m_message"  class="col-lg-6">
         </div>
       
       </div>
      
      

</div>

<div class=" fixed">
      
           <form name="form" id="form" action="../Manager_messages?employeeid=<%=employeeid%>&workid=<%=workid%>" method="post">
       
        <div class="">
          <div class="input-group mb-3 input-field">
  			<input type="text" class="form-control" name="message" id="message" placeholder="Message To Employee.........." aria-label="Recipient's username" aria-describedby="button-addon2">
 			 <button class="btn btn-primary" id="btn_m" type="submit" id="button-addon2">Send Message</button>
		</div>
        </div>
        
 
        </form>
        
      </div>




    
    
<div class="d-none">

<input value="<%= employeeid %>" id="employeeid" />
<input value="<%= workid %>" id="workid" />
<input value="<%= m_id %>" id="managerid" />

</div>
 
  
  
			
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="../js/manager_message_script.js" ></script>

</body>
</html>''