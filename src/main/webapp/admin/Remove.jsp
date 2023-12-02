<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/remove_style.css">
<link rel="stylesheet" href="../css/bg_color_style.css">  
<title>Admin</title>
</head>
<body>


<%


    String username = (String) session.getAttribute("username");
    if (session != null && username == null || username.isEmpty()) {
        response.sendRedirect("Admin_login.jsp");
    } else {
    
    }
    %>


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
  
    
    <div class="flex d-lg-flex d-md-flex justify-content-between">
 <header>Remove Employees</header>
	<div>
     <a href="Admin_Dashboard.jsp"> <i class="fa-solid fa-chevron-left"></i> Go To Admin Dashborad</a>
  	</div>
  </div>
    <form name="form" id="form" action="" method="post">
      <div class="row">
        <div class="col-md-6 col-lg-3">
          <div class="input-field">
            <label for="Name">Search by Full Name</label>
            <input type="text" placeholder="Search by Full Name" id="input1" name="Name" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="input-field">
            <label for="Mobile-Number">Search by Mobile Number</label>
            <input type="number" placeholder="Search by Mobile Number" id="input2" name="Mobile-Number" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="input-field">
            <label for="Designation">Search by Designation</label>
            <input type="text" placeholder="Search by Designation" id="input3" name="Designation" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
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
      <table class="table table-bordered border-info text-white align-middle table-colorful">

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
			<th>Remove</th>
          </tr>
        </thead>
        
        <tbody id="tbody">
          <!-- Table body content -->
        </tbody>
        
      </table>
    </div>
  </div>
  
</section> 

<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/employee_script.js"></script>
	
</body>
</html>
    