<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/manager_login_style.css">
  <link rel="stylesheet" href="../css/bg_color_style.css"> 
<title>Manager Login</title>
</head>
<body>



 
 
<div class="container">

 <%
String successMessage = (String) request.getSession().getAttribute("successMessage");
if (successMessage != null) {
%>
<div class="success-message" style="color:red; font-weight: bolder; font-size:20px">
    <%= successMessage %>
</div>
<%
request.getSession().removeAttribute("successMessage"); // Clear the message to avoid displaying it again on refresh
}
%>

<header>Login</header>
<form name="form" action="../Manager_Login" method="post" id="form">
<div class="form first">
  
  

    <div class="fields">
      <div class="input-field">
        <label for="Username">Enter Username</label>
        <input type="text" placeholder="Enter Username" id="username"  name="Username"  >
      </div>

      <div class="input-field">
        <label for="Password">Enter Password</label>
        <input type="password" placeholder="Enter Password" id="password"  name="Password" >
      </div>

    </div>
    <div>
      <button type="submit">Submit</button>
    </div>

</div>
</form>
</div>


<script src="../js/manager_login_script.js" ></script>

</body>
</html>