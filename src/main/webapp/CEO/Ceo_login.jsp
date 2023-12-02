<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/login_style.css">
 <link rel="stylesheet" href="../css/bg_color_style.css"> 
<title>Insert title here</title>
</head>
<body>


<div class="container">
<header>Login</header>
<form name="form" action="../ceo_Login" method="Post" id="form">
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
      <button type="submit" >Submit</button>
    </div>

      <!-- <div class="anchor">
        <a href="#">New User Registration? <span> Sign Up</span></a>
      </div> -->

</div>
</form>
</div>


<script src="../js/ceo_login_script.js" ></script>

</body>
</html>