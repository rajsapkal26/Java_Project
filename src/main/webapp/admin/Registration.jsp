<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link rel="stylesheet" href="../css/registration_style.css">
<link rel="stylesheet" href="../css/bg_color_style.css"> 

</head>
<body>

<%



    String username = (String) session.getAttribute("username");
    if (session != null && username == null || username.isEmpty()) {
        response.sendRedirect("Admin_login.jsp");
    } else {
    
    }
    %>


<div class="section">

<div class="container">


<%
String successMessage = (String) request.getSession().getAttribute("successMessage");
if (successMessage != null) {
%>
<div class="success-message" style="color:green; font-weight: bolder; font-size:20px">
    <%= successMessage %>
</div>

<%
	request.getSession().removeAttribute("successMessage");

}
%>

<div class="d-lg-flex d-md-flex justify-content-between  flex">
<header>Registration</header>
	<div>
     <a href="Admin_Dashboard.jsp"> <i class="fa-solid fa-chevron-left"></i> Go To Admin Dashborad</a>
  	</div>
  </div>
<form name="form" id="myForm"  action="../Registration" method="post">
<div class="form first">
  <div class="details personal">
    <span class="title">
      Personal Details :-
    </span>

    <div class="fields">

      <div class="input-field">
        <label for="Name">Enter Full Name</label>
        <input type="text" placeholder="Enter Full Name" id="input1" name="name">
       
      </div>

      <div class="input-field">
        <label for="Birth-Date">Date of Birth</label>  
        <input type="date" name="birth_date" id="input2" onchange="calculateAge()" >
      </div>

      <div class="input-field">
        <label for="age">Age</label>  
        <input type="number" readonly name="age" id="age" >
        <!-- <p  style="color: red; display: none;" id="errorMsg2">* Please fill out this field</p> -->
      </div>

      <div class="input-field-gender">
        <label for="Gender">Choose Gender</label>
      <div>
        <input type="radio" id="radio" value="Male" name="gender">
        <label for="Male">Male</label>
        <input type="radio" id="radio" value="Female" name="gender">
        <label for="Female">Female</label>
        <input type="radio" id="radio" value="Other" name="gender">
        <label for="Other">Other</label>
      </div>
      </div>


      <div class="input-field">
        <label for="Mobile-Number">Enter Mobile Number</label>
        <input type="number" placeholder="Enter Mobile Number" id="input4" name="mobile">
      </div>

      <div class="input-field">
        <label for="Email">Enter Email</label>
        <input type="email" placeholder="Enter Email" id="input3" name="email">
      </div>

     
       <div class="input-field">
        <label for="Aadhar-Number">Enter Aadhar Number</label>
        <input type="number" placeholder="Enter Aadhar Number" id="input5" name="aadhar">
       
      </div>

      <div class="input-field">
        <label for="Pan">Enter Pan Number</label>
        <input type="text" placeholder="Enter Pan Number" id="input6"  name="pan">
    
      </div>


      <div class="input-field">
        <label for="Department">Department</label>
        <select name="department" id="department">
          <option value="" selected disabled>Select Department</option>
          
          
        </select>
      </div>


		<div class="input-field">
        <label for="Designation">Enter Designation</label>
        <input type="text" placeholder="Enter  Designation"  id="input7" name="designation">
      </div>
      
      <div class="input-field">
        <label for="Salary">Enter  Salary</label>
        <input type="number" placeholder="Enter Salary"  id="input8" name="salary">
      </div>

     <!--  <div class="input-field">
        <label for="Username">Create Username</label>
        <input type="text" placeholder="Create Username"  id="input9" name="username">
        <p  style="color: red; display: none;" id="errorMsg9">* Please fill out this field</p>
      </div> -->

     <!--   <div class="input-field">
        <label for="Password">Create New Password</label>
        <input type="password" placeholder="Create New Password" id="Password" oninput="toggleParagraphVisibility()"  name="password">
        <p  style="color: red; display: none;" id="errorMsg10">* Please fill out this field</p>
      </div> -->

      <!-- <div class="input-field">
        <label for="Confirm-Password">Confirm Password</label>
        <input type="password" placeholder="Confirm Password" id="Confirm-Password"   name="confirm_password" >
        <p  style="color: red; display: none;" id="errorMsg11">* Please fill out this field</p>
      </div> -->


      <!-- <div class="input-field "  style="color: red;">
        <div class="hidden" id="hiddenParagraph">
        <p>Your Password Must be 8-15 Characters Long,</p>
        <p>It Contains atleast one Special Character and one Numeric </p>
      </div>
      </div>  -->


    </div>
  </div>

   <div class="details Address">
    <span class="title">
      Address Details :-
    </span> 

     <div class="fields">

      <div class="input-field">
        <label for="State">Select State</label>
		<select name="state" id="stateSelect">
  
  <option value="" selected disabled> Select State</option>

	</select>
      </div>
     
      <div class="input-field">
        <label for="District">Enter District</label>
        <select name="city" id="citySelect" name="city">
         <option value="" selected disabled> Select City</option>
      		
        </select>
      </div>

      
      <div class="input-field">
        <label for="Detail-Address">Enter Detail Address</label>
        <input name="address" id="input9" /> 
       
      </div>

    </div> 
    
  </div> 
  <div>
    <button type="submit">Add Employee</button>
  </div>
  
  
  
</div>
</form>
</div>
</div>


<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="../js/registration_script.js"></script>
</body>
</html>