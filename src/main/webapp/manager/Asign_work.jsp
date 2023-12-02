<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.servlet.http.HttpSession" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/asign_work_style.css">
  <link rel="stylesheet" href="../css/bg_color_style.css"> 

<title>Asign Work</title>
</head>
<body>


<%

int m_id = (int)  session.getAttribute("one");
String e_id = request.getParameter("e_id");		



try {
	
 
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
        <label for="id">Employee ID</label>
        <input type="text" readonly value ="<%= e_id %>" name="e_id"  />
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


			String e_id2 = request.getParameter("e_id");
        	String title = request.getParameter("title");
        	String description = request.getParameter("description");
        	String deadline = request.getParameter("deadline");
        	int w_status = 0;
   
        	if (e_id != null && !e_id.isEmpty() && title != null && !title.isEmpty()) {
        	st.executeUpdate("insert into work (w_title, w_description, e_id, m_id, w_deadline, w_status) values ('"+title+"', '"+description+"', "+e_id2+", "+m_id+", '"+deadline+"', "+w_status+")");
        	
        	response.sendRedirect("Managers_Dashboard.jsp");
        	
    }
%>


 <%       
          }catch (Exception e) {
        out.println(e); 
   } %>
   
   <script
  src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
   
   <script src="../js/asign_work_script.js"></script>

</body>
</html>