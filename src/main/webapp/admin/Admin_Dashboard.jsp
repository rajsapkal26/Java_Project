<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/admin_dashboard_style.css"> 
  <link rel="stylesheet" href="../css/bg_color_style.css"> 


</head>
<body>


  <%
  

  
    String username = (String) session.getAttribute("username");
    if (username == null || username.isEmpty()  ) {
        response.sendRedirect("Admin_login.jsp");

    } else {
    
    }
    %> 


<div class="section position-relative">
  <div class="row align-items-center container_1">
    <div class="col-12 col-md-6 col-lg-3 ">
      <a class="btn btn-primary btn-block fw-bold text-light" href="Registration.jsp">Add Employee</a>
    </div>
    <div class="col-12 col-md-6 col-lg-3 ">
      <a class="btn btn-danger btn-block fw-bold text-light" href="Remove.jsp">Remove Employee</a>
    </div>
    <div class="col-12 col-md-6 col-lg-3 ">
      <a class="btn btn-warning btn-block fw-bold text-light" href="Edit.jsp">Edit Employee Details</a>
    </div>
    <div class="col-12 col-md-6 col-lg-3 ">
      <a class="btn btn-success btn-block fw-bold text-light" href="Show_Emp.jsp">Show Employee</a>
    </div>
    

  </div>
  
  <div class="log_out_btn">
        <a class="btn btn-secondary btn-block fw-bold text-light" href="../Company_info/Home.jsp">Log Out</a>
  </div>
  
</div>

</body>
</html>