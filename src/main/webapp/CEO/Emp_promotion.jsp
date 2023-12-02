<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/asign_work_style.css">
  <link rel="stylesheet" href="../css/bg_color_style.css">
<title>Employees Promoiton</title>
</head>
<body>


<%

		String e_id  = request.getParameter("e_id");

 
    Class.forName("com.mysql.cj.jdbc.Driver");

 
    String url = "jdbc:mysql://localhost:3306/register";
    String username_1 = "root";
    String password = "Raj#9011";
    Connection con = DriverManager.getConnection(url, username_1, password);


    Statement st = con.createStatement();

 

%>

<div class="section">

<div class="container">

<header>Employee Promotion</header>
<form name="form" id="form"  action="" method="post">
<div class="form first">
  <div class="details personal">
    

    <div class="fields">
    
    
     <div class="input-field">
        <label for="id">Employee ID</label>
        <input type="text" readonly value ="<%= e_id %>" name="e_id"  />
      </div>
    

      <div class="input-field">
        <label for="designation">Promoted Designation</label>
        <input type="text" value ="" name="designation" />
      </div>

      

      <div class="input-field">
        <label for="salary">Salary Increment</label>
       <input type="number" value ="" name="salary"/>
      </div>

	<!--  <div class="input-field">
        <label for="date"> Deadline </label>
       <input type="date" value ="" name="deadline"/>
      </div> -->



    </div>
  </div>

 
  <div>
    <button type="submit">Submit</button>
  </div>
  
</div>
</form>
</div>

</div>
<%


		
        	String designation = request.getParameter("designation");
        	String salary = request.getParameter("salary");
        	
        		
        		
        	if (designation != null && salary != null) {

        	int promoted = 2;

        	st.executeUpdate("update employees set e_designation = '"+designation+"', e_salary = "+salary+", promote_status = "+promoted+" where e_id = "+e_id+"");
        	
        	   response.sendRedirect("Ceo_Dashboard.jsp");
        	    }
        	
        	
%>





</body>
</html>