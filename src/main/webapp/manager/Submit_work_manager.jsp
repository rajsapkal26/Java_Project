<%@page import="com.mysql.cj.x.protobuf.MysqlxExpr.Identifier"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/submit_work_style.css">
<link rel="stylesheet" href="../css/bg_color_style.css">  

<title>Submit Work</title>
</head>
<body>



<%


String mw_id = request.getParameter("mw_id");	


Integer managerid = (Integer) session.getAttribute("managerid");



if (managerid != null) {

	int manager = managerid.intValue();

} else {

}


try {
	

   
    Class.forName("com.mysql.cj.jdbc.Driver");

 
    String url = "jdbc:mysql://localhost:3306/register";
    String username_1 = "root";
    String password = "Raj#9011";
    Connection con = DriverManager.getConnection(url, username_1, password);


    Statement st = con.createStatement();
   	Statement mt = con.createStatement();
   	ResultSet rs;

  
	String date = request.getParameter("date");
	String description = request.getParameter("description");
	String deadline = request.getParameter("deadline");
	int ws_status = 1;
	
		

%>


<div class="section">

<div class="container">

<header>Submit Work</header>
<form name="form" id="form"  action="" method="post">
<div class="form first">
  <div class="details personal">
    <span class="title">
      Personal Details :-
    </span>

    <div class="fields">
    
    
     <div class="input-field">
        <label for="id">Manager ID</label>
        <input type="text" value ="<%= managerid %>" name="e_id"  />
      </div>
      
      <div class="input-field">
        <label for="id">Work ID</label>
        <input type="text" value ="<%= mw_id %>" name="e_id"  />
      </div>
    

      <div class="input-field">
        <label for="date"> </label>
        <input type="date" value ="" name="date" />
      </div>
 

      <div class="input-field">
        <label for="description"> Work Description</label>
       <input type="text" value ="" name="description"/>
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
int mws_status = 1;

			rs = mt.executeQuery("select * from manager_work_submit where m_id = "+managerid+" and mw_id = "+mw_id+"");       		
        	
        	if (managerid != null  && date != null && !date.isEmpty() && !rs.next() ) {
        	st.executeUpdate("insert into manager_work_submit ( mws_date, mws_description, mw_id, mws_status, m_id) values ('"+date+"', '"+description+"', "+mw_id+", '"+mws_status+"', "+managerid+")");
        	st.executeUpdate("update manager_work set mw_status = "+mws_status+" where mw_id = "+mw_id+" ");
        	} 
        	
        		
%>

 <%       
          }catch (Exception e) {
        out.println(e); 
   } %>
   
   <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
   

</body>
</html>