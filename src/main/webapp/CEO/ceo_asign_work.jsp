<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/asign_work_style.css">
  <link rel="stylesheet" href="../css/bg_color_style.css">
<title>Ceo Asign Work</title>
</head>
<body>


<%

	String manager_id = request.getParameter("manager_id");

	
 
    Class.forName("com.mysql.cj.jdbc.Driver");

 
    String url = "jdbc:mysql://localhost:3306/register";
    String username_1 = "root";
    String password = "Raj#9011";
    Connection con = DriverManager.getConnection(url, username_1, password);


    Statement st = con.createStatement();

 

%>

<div class="section">

<div class="container">

<header>Asign Work</header>
<form name="form" id="form"  action="" method="post">
<div class="form first">
  <div class="details personal">
    

    <div class="fields">
    
    
     <div class="input-field">
        <label for="id">Manager ID</label>
        <input type="text" readonly value ="<%= manager_id %>" name="m_id"  />
      </div>
    

      <div class="input-field">
        <label for="Name"> Work Title</label>
        <input type="text" value ="" name="title" />
      </div>

      

      <div class="input-field">
        <label for="description"> Work Description</label>
       <input type="text" value ="" name="description"/>
      </div>

	 <div class="input-field">
        <label for="date"> Deadline </label>
       <input type="date" value ="" name="deadline"/>
      </div>



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


			String m_id  = request.getParameter("m_id");
        	String title = request.getParameter("title");
        	String description = request.getParameter("description");
        	String deadline = request.getParameter("deadline");
        	
   
        	if (m_id != null && !m_id.isEmpty() && title != null && !title.isEmpty()) {
        	st.executeUpdate("insert into manager_work (mw_title, mw_description, m_id, mw_deadline) values ('"+title+"', '"+description+"', "+m_id+", '"+deadline+"')");
        	
        	response.sendRedirect("Ceo_Dashboard.jsp");
        	
        	}
%>



   
 
</body>
</html>