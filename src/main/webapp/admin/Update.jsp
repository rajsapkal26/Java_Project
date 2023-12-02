<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
   
<%@ page language="java" %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/update_style.css">
<link rel="stylesheet" href="../css/bg_color_style.css">  

<title>Insert title here</title>
</head>
<body>


<%
    String username = (String) session.getAttribute("username");
    if (session != null && username == null || username.isEmpty()) {
        response.sendRedirect("Admin_login.jsp");
    } else {
    
    }
    %>


<%

			String e_id = request.getParameter("e_id");
			session = request.getSession();
			session.setAttribute("e_id", e_id);

ResultSet rs; 

try {
   
    Class.forName("com.mysql.cj.jdbc.Driver");

 
    String url = "jdbc:mysql://localhost:3306/register";
    String username_1 = "root";
    String password = "Raj#9011";
    Connection con = DriverManager.getConnection(url, username_1, password);


    Statement st = con.createStatement();

         
	
    
    rs = st.executeQuery("SELECT * FROM employees e,state s, city c WHERE e.e_id = "+e_id+ " and c.c_id = e.c_id and c.s_id = s.s_id");

 

%>






<% while(rs.next()) { %>


<div class ="section">

<div class="container">

<header>Update Employee</header>
<form name="form" id="form"  action="../Update" method="post">
<div class="form first">
  <div class="details personal">
    <span class="title">
      Personal Details :-
    </span>

    <div class="fields">
    
    
     <div class="input-field">
        <label for="id">Employee ID</label>
        <input type="text" readonly value ="<%=rs.getInt("e_id")%>"  />
      </div>
    

      <div class="input-field">
        <label for="Name">Enter Full Name</label>
        <input type="text" value ="<%=rs.getString("e_name")%>" name="name" />
      </div>

      <div class="input-field">
        <label for="Birth-Date">Date of Birth</label>  
		<input type="Date" value ="<%=rs.getDate("e_birthdate")%>" id="input2" name="birth_date" onChange="calculateAge()"/>
      </div>

      <div class="input-field">
        <label for="age">Age</label>  
        	<input type="text" value ="<%=rs.getInt("e_age")%>" id="age" name="age" />
        <!-- <p  style="color: red; display: none;" id="errorMsg2">* Please fill out this field</p> -->
      </div>

      <div class="input-field-gender">
        <label for="Gender">Choose Gender</label>
      <div>
        <input type="radio" name="gender" value="Male" <% if (rs.getString("e_gender").equals("Male")) out.print("checked"); %> /> 
        <label for="Male">Male</label>
       <input type="radio" name="gender" value="Female" <% if (rs.getString("e_gender").equals("Female")) out.print("checked"); %> /> 
        <label for="Female">Female</label>
		<input type="radio" name="gender" value="Other" <% if (rs.getString("e_gender").equals("Other")) out.print("checked"); %> />
        <label for="Other">Other</label>
      </div>
      </div>



	
      <div class="input-field">
        <label for="Mobile-Number">Enter Mobile Number</label>
       	<input type="text" value ="<%=rs.getString("e_mobile")%>" name="mobile"/>
      </div>

      <div class="input-field">
        <label for="Email">Enter Email</label>
       <input type="text" value ="<%=rs.getString("e_mail")%>" name="email"/>
      </div>

     
       <div class="input-field">
        <label for="Aadhar-Number">Enter Aadhar Number</label>
	<input type="text" value ="<%=rs.getString("e_aadhar")%>" name="aadhar"/>
      </div>

      <div class="input-field">
        <label for="Pan">Enter Pan Number</label>
	<input type="text" value = "<%=rs.getString("e_pan")%>" name="pan"/>
      </div>


<!--       <div class="input-field">
        <label for="Marital-status">Select Marital Status</label>
        <select name="Marital-status" id="Marital-status">
          <option value="">Select</option>
          <option value="Married">Married</option>
          <option value="Un-Married">Un-Married</option>
          <option value="Divorced">Divorced</option>
          <option value="Widow">Widow</option>
        </select>
        <p  style="color: red; display: none;" id="errorMsg8">* Please select any one option</p>
      </div> -->



	

	<div class="input-field">
        <label for="Designation">Enter Designation</label>
       <input type="text" value="<%=rs.getString("e_designation")%>" name="designation"/>
      </div>
      
      <div class="input-field">
        <label for="Salary">Enter  Salary</label>
        <input type="text" value ="<%=rs.getInt("e_salary")%>" name="salary"/>
      </div>
      
      
      
      <div class="input-field">
        <label for="Detail-Address">Enter Detail Address</label>
  	
		<input type="text" value="<%=rs.getString("e_address")%>" name="address"/>
      </div>

    <!--   <div class="input-field">
        <label for="Username">Create Username</label>
        <input type="text" placeholder="Create Username"  id="input9" name="username">
        <p  style="color: red; display: none;" id="errorMsg9">* Please fill out this field</p>
      </div> -->

     <!--   <div class="input-field">
        <label for="Password">Create New Password</label>
        <input type="password" placeholder="Create New Password" id="Password" oninput="toggleParagraphVisibility()"  name="password">
        <p  style="color: red; display: none;" id="errorMsg10">* Please fill out this field</p>
      </div> -->

     <!--  <div class="input-field">
        <label for="Confirm-Password">Confirm Password</label>
        <input type="password" placeholder="Confirm Password" id="Confirm-Password"   name="confirm_password" >
        <p  style="color: red; display: none;" id="errorMsg11">* Please fill out this field</p>
      </div> -->



    </div>
  </div>

 
  <div>
    <button type="submit">Update</button>
  </div>
  
</div>
</form>
</div>


</div>

	
	
 <%       }
          }catch (Exception e) {
        out.println(e); 
   } %>
   
   <script
  src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
   
   <script src="../js/registration_script.js"></script>

</body>
</html>