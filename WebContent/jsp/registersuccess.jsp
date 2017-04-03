<%@page import="com.tcs.ilp.mas.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>logout</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/javascript.js"></script>

<% response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");%>
</head>
<body id="top">
<%
						CustomerBean customer= (CustomerBean) request.getAttribute("customer");
						
					%>

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

<div class="wrapper col2">
  <div id="header">
    <div id="logo">
   <a href="#"><img src="<%=request.getContextPath() %>/images/logo.png" /></a>
      <p> EXPLORE THE WORLD OF MOVIES</p>
      </div>
    <ul id="topnav">
      <li class="last"><a href="<%= request.getContextPath() %>/MultiplexController?source=aboutus">About us</a></li>
      <li><a href="<%= request.getContextPath() %>/MultiplexController?source=contactus">contact us</a></li>
      
      <li> <a href="<%=request.getContextPath()%>/UserController?source=login">Book Ticket</a>
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
  <div id="gallery1">
  <h3 ><center><b style="color:green ;text-align: center;">&#10004; You have successfully registered</b></center></h3>
<table  class="CSSTableGenerator">
				<tr><td>FirstName</td><td><input type="text" value=" <%=customer.getFirstname()%>" disabled="disabled"></td></tr>
						<tr><td>LastName</td><td><input type="text" value=" <%=customer.getLastname()%>" disabled="disabled"></td></tr>
						<tr><td>Gender</td><td><input type="text" value=" <%=customer.getGender()%>" disabled="disabled"></td></tr>
						<tr><td>PhoneNumber</td><td><input type="text" value=" <%=customer.getPhoneno()%>" disabled="disabled"></td></tr>
						<tr><td>City</td><td><input type="text" value=" <%=customer.getCity()%>" disabled="disabled"></td></tr>
						<tr><td>Location</td><td><input type="text" value=" <%=customer.getLocation()%>" disabled="disabled"></td></tr>
<%-- 						<tr><td>DateOfBirth<font color="#6E6E6E">(yyyy-mm-dd)</font></td><td><input type="text" value=" <%=customer.getDob()%>" disabled="disabled"></td></tr> --%>
						<tr><td>EmailAddress</td><td><input type="text" value=" <%=customer.getEmail()%>" disabled="disabled"></td></tr>
						<tr><td>CustomerId</td><td><input type="text" value=" <%=customer.getCustomerid()%>" disabled="disabled"></td></tr>
<%-- 						<tr><td>Status</td><td><input type="text" value=" <%=customer.getStatus()%>" disabled="disabled"></td></tr>
 --%></table>
 
 <center><a href="<%=request.getContextPath()%>/UserController?source=login"><input type="button" value="Login" id="shiny"></a></center>

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
    <p><a href="http://www.os-templates.com/" title="Free Website Templates">All Rights Reserved</a></p>
    <div class="clear"></div>
  </div>
</div>
</body>
</html>