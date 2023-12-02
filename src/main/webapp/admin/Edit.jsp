<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
 <link rel="stylesheet" href="../css/edit_style.css"> 
  <link rel="stylesheet" href="../css/bg_color_style.css"> 
<title>Admin</title>
</head>
<body>


  

<section class="section">

  <div class="container-fluid container_1">
  
  
  <%
String successMessage = (String) request.getSession().getAttribute("successMessage");
if (successMessage != null) {
%>
<div class="success-message" style="color:green; font-weight: bolder; font-size:20px">
    <%= successMessage %>
</div>
<%
request.getSession().removeAttribute("successMessage"); // Clear the message to avoid displaying it again on refresh
}
%>
  
  
    
    
    <div class="d-lg-flex justify-content-between flex">
<header>Update Employees Details</header>
	<div>
     <a href="Admin_Dashboard.jsp"> <i class="fa-solid fa-chevron-left"></i> Go To Admin Dashborad</a>
  	</div>
  </div>
    
    <form name="form" id="form" action="" method="post">
      <div class="row">
        <div class="col-md-6 col-lg-3 col-12">
          <div class="input-field">
            <label for="Name">Search by Full Name</label>
            <input type="text" placeholder="Search by Full Name" id="input1" name="Name" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-lg-3 col-12">
          <div class="input-field">
            <label for="Mobile-Number">Search by Mobile Number</label>
            <input type="number" placeholder="Search by Mobile Number" id="input2" name="Mobile-Number" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-lg-3 col-12">
          <div class="input-field">
            <label for="Designation">Search by Designation</label>
            <input type="text" placeholder="Search by Designation" id="input3" name="Designation" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-lg-3 col-12">
          <div class="input-field">
            <label for="Aadhar-Number">Search by Aadhar Number</label>
            <input type="number" placeholder="Search by Aadhar Number" id="input4" name="Aadhar-Number" class="form-control">
          </div>
        </div>
        
      </div>
      
      <div class="row mt-3 ">
        
        <div class="col-md-8">
          <button type="button" id="btn" class="btn btn-primary mb-2">Search</button>
          
        </div>
      </div>
    </form>
  </div>
      
  <div class="table-container mt-5">
    <div class="table-responsive">
      <table class="table table-bordered text-white border-info align-middle table-colorful">

        <thead>
          <tr class="table-secondary">
            <th>Sr.No.</th>
            <th>Name</th>
            <th>Date Of Birth</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Mobile No.</th>
			<th>Email</th>
			<th>Aadhar No.</th>
			<th>Pan</th>
			<th>Address</th>
			<th>Department</th>
			<th>Designation</th>
			<th>Salary</th>
			<th>State</th>
			<th>City</th>
			<th>Update</th>
          </tr>
        </thead>
        
        <tbody id="tbody">
          <!-- Table body content -->
        </tbody>
        
      </table>
    </div>
  </div>
  
</section> 


<%
    String username = (String) session.getAttribute("username");
    if (session != null && username == null || username.isEmpty()) {
        response.sendRedirect("Admin_login.jsp");
    } else {
    
    }
    %>



<script
  src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../js/employee_edit_script.js"></script>
	
</body>
</html>