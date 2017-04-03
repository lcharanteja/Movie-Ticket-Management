
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/navigation.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/javascript.js"></script>
<style type="text/css">
		* { margin: 0; outline: none; }
		body { background-color: #444444; }
		.c { clear: both; }
		#wrapper { margin: 0 auto; padding: 0 40px 60px 40px; width: 960px; }
		h2 { padding: 20px 0 10px 0; font-size: 24px; line-height: 40px; font-weight: normal; color: #adc276; text-shadow: 0 1px 3px #222222; }
	</style>

	<!-- sliderman.js -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/sliderman.1.3.8.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/sliderman.css" />
	<!-- /sliderman.js -->

</head>
<body id="top">
<div class="wrapper col1">
  <div id="topbar">
    <div id="search">
      <form action="#" method="post">
       <fieldset>
          <a href="<%=request.getContextPath()%>/UserController?source=login"><font size="3" color="#FFFFFF" style="text-decoration: underline;">Login</font></a>
          &nbsp;
          <a href="<%=request.getContextPath()%>/UserController?source=registration"><font size="3" color="#FFFFFF" style="text-decoration: underline;">Registration</font></a>
        </fieldset>

      </form>
    </div>
  </div>
</div>
<div class="wrapper col2">
  <div id="header">
    <div id="logo">
    <a href="#"><img src="<%=request.getContextPath() %>/images/logo.png" /></a>
      <p> EXPLORE THE WORLD OF MOVIES</p>
     </div>
    <ul id="topnav">
      <li class="last"><a href="<%= request.getContextPath() %>/MultiplexController?source=aboutus">About us</a></li>
      <li><a href="<%= request.getContextPath() %>/MultiplexController?source=contactus">Contact us</a></li>
      
      <li><a href="<%= request.getContextPath() %>/TicketController?source=bookticket">Book Ticket</a>
              </li>
      <li><a href="<%= request.getContextPath() %>/MovieController?source=upcomingmovie">Upcoming Movies</a>
      </li>
       <li><a href="<%=request.getContextPath() %>/MovieController?source=nowshowingmovie">Now Showing Movies</a>
       </li>
     
      <li class="active"><a href="<%=request.getContextPath() %>/MultiplexController?source=index">Home</a></li>
    </ul>
    <br class="clear" />
  </div>
</div>

<div class="wrapper col3">
  <div id="breadcrumb">
    <ul>
      <li class="first">You Are Here</li>
      <li>&#187;</li>
      <li><a href="<%=request.getContextPath() %>/MultiplexController?source=index">Home</a></li>
      <li>&#187;</li>
      <li><a href="<%=request.getContextPath()%>/UserController?source=registration">Registration</a></li>	
    </ul>
  </div>
</div>
<div class="wrapper col3">
  <div id="gallery" >
 
<form action="<%=request.getContextPath() %>/UserController" method="get" name="registrationform" class="form-container111" onsubmit="return validateRegistration()">
<input type="hidden" name="source" value="registrationform">
<div class="form-title"><center><h3>Registration form</h3></center></div>
<center><font color="red">All fields are mandatory </font> </center>
<table style="border: hidden ; border-style: hidden;">
 <tr><td><div class="form-title">Name :&nbsp;&nbsp;<span id="f_error" style="color: red" ></span><br>
 <input id="fname" name="fname" type="text"  placeholder="First name" onblur="validateFirstName()" class="form-field"/></div>
        
 			<td> <div class="form-title"><span id="l_error" style="color: red" ></span><br>
            <input id="lname" name="lname" type="text" placeholder="Last name" onblur="validateLastName()" class="form-field"/></div>
   </td></tr>
  <tr><td>   <div class="form-title">Gender : &nbsp;&nbsp;<span id="g_error" style="color: red" ></span><br>
             <select name="gender" placeholder="gender" onblur="validateGender()" class="form-field">
  <option value="Select">gender</option>
  <option value="Male">Male</option>
    <option value="Female">Female</option>
</select><br></div>
    <td><div class="form-title">Date of birth (mm/dd/yyyy) : &nbsp;&nbsp;<span id="dob_error" style="color: red" ></span><br>
            <input id="dob" name="dob" type="date" onblur="validateDOB()" class="form-field"/></div>
   </td></tr>

  <tr><td><div class="form-title">City : &nbsp;&nbsp; <span id="c_error" style="color: red" ></span><br>
            <select id="city" name="city" onchange="configureDropDownLists(this,'location')" onblur="validateCity()" class="form-field">
  <option value="Select" class="form-field">Select city </option>
  <option value="Delhi" class="form-field">Delhi</option>
    <option value="Mumbai" class="form-field">Mumbai</option>
      <option value="Kolkata" class="form-field">Kolkata</option>
  <option value="Trivandrum" class="form-field">Trivandrum</option>
</select></div>
 
 
 <td><div class="form-title">Location : &nbsp;&nbsp;<span id="loc_error" style="color: red" ></span><br>
           <select id="location" name="location"  onblur="validateLocation()" class="form-field">
   <option value="Select" class="form-field">Select location </option>
</select></div>
</td></tr>
     <tr><td>   <div class="form-title">Phone number : &nbsp;&nbsp;<span id="ph_error" style="color: red" ></span><br>
      <input id="phno" name="phno" type="text" placeholder="Phone number" onblur="validatePhoneNumber()" class="form-field"/></div>
 <td> <div class="form-title">Email address :&nbsp;&nbsp;<span id="email_error" style="color: red" ></span><br>
            <input id="eaddress" name="eaddress" placeholder="Email id" type="text" onblur="validateEmailAddress()" class="form-field"/></div>
    </td></tr>
  <tr><td>    
           <div class="form-title">Create a password :&nbsp;&nbsp;<span id="rp_error" style="color: red" ></span><br>
            <input id="Rpassword" name="Rpassword" type="password" placeholder="Password" onblur="validateRegistrationPassword()" class="form-field"/></div>
         <td> <div class="form-title">Confirm your password :&nbsp;&nbsp;<span id="cp_error" style="color: red" ></span><br>
            <input id="Cpassword" name="Cpassword" type="password"  placeholder="Conform password" onblur="validateConfirmPassword()" class="form-field"/></div>
 </td></tr>  
         
          <div class="submit-container">
        <tr><td><center><input class="submit-button" type="submit" value="Register"></center> </td> 
          <td></center><input class="submit-button" type="reset" onclick="myFunction()"></center></td> </tr>
 </div>	
  </table> 
   </form>
    
  </div>
</div>
<div class="wrapper col7">
  <div id="copyright">
    <ul>
      <li><a href="#">Online Privacy Policy</a></li>
      <li><a href="#">Terms of Use</a></li>
      <li><a href="#">Permissions &amp; Trademarks</a></li>
      <li class="last"><a href="#">Product License Agreements</a></li>
    </ul>
    Copyright &copy; 2011 - All Rights Reserved
    <div class="clear"></div>
  </div>
</div>s
</body>
</html>
