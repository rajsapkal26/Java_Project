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


String w_id = request.getParameter("w_id");	

Integer e_id_emp = (Integer) session.getAttribute("e_id_emp");
Integer manager_id = (Integer) session.getAttribute("manager_id");
int newStatus = 0;


if (e_id_emp != null && manager_id != null) {
	 int managerId = e_id_emp.intValue();
	int manager = manager_id.intValue();

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
    

    <div class="fields">
    
    
     <div class="input-field">
        <label for="id">Employee ID</label>
        <input type="text" value ="<%= e_id_emp %>" name="e_id"  />
      </div>
      
      <div class="input-field">
        <label for="id">Work ID</label>
        <input type="text" value ="<%= w_id %>" name="e_id"  />
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
int w_status = 1;

			rs = mt.executeQuery("select * from work_submit where e_id = "+e_id_emp+" and w_id = "+w_id+"");       		
        	
        	if (e_id_emp != null  && date != null && !date.isEmpty() && !rs.next() ) {
        	st.executeUpdate("insert into work_submit ( ws_date, ws_description, w_id, e_id, ws_status, m_id) values ('"+date+"', '"+description+"', "+w_id+", "+e_id_emp+", '"+ws_status+"', "+manager_id+")");
        	st.executeUpdate("update work set w_status = "+w_status+" where w_id = "+w_id+" ");
        	
        	response.sendRedirect("Employees_Dashboard.jsp");
        	} 
        	
        	
        	
        		
%>

 <%       
          }catch (Exception e) {
        out.println(e); 
   } %>
   
   <div><input type="text" value="<%= manager_id %>"/></div>
   
   <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
   

</body>
</html>