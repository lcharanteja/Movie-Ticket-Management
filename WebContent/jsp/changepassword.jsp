<%@page import="com.tcs.ilp.mas.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>myprofile</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/javascript.js"></script>
<% response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");%>
</head>
<body id="top">
<div class="wrapper col1">
  <div id="topbar">
    <div id="search">
      <form action="#" method="post">
          <%String name=(String)session.getAttribute("customername");
       String email1=(String)session.getAttribute("emailid");
          if(email1==null)
          {
        	  response.sendRedirect("index.jsp");
        	  
          }
          %>
          <font size="3" color="#FFFFFF">Welcome <%= name %></font>   &nbsp;
          <a href="<%= request.getContextPath() %>/UserController?source=logout"><font size="3" color="#FFFFFF" style="text-decoration: underline;">Logout</font></a>
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
             <li><a href="<%= request.getContextPath() %>/UserController?source=aboutusl">About us</a>
      </li>
      <li><a href="<%= request.getContextPath() %>/UserController?source=contactusl">Contact us</a>
      </li>
       <li><a href="<%= request.getContextPath() %>/UserController?source=myprofile">My Profile</a></li>
        
       <li><a href="<%= request.getContextPath() %>/ViewController?source=bookedhistory">Booking History</a></li> 
      <li><a href="<%= request.getContextPath() %>/TicketController?source=bookticket">Book Ticket</a></li> 
      
        <li><a href="<%= request.getContextPath() %>/MovieController?source=upcomingmovieloggedin">Upcoming Movies</a>
       </li>
      <li><a href="<%= request.getContextPath() %>/MovieController?source=nowshowingmovieuser">Now Showing Movies</a>
      </li>
     <li><a href="<%= request.getContextPath() %>/UserController?source=userlogin">Home</a>
      </li>
</ul>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col3">
  <div id="breadcrumb">
    <ul>
      <li class="first">You Are Here</li>
      <li>&#187;</li>
      <li><a href="<%=request.getContextPath() %>/UserController?source=userlogin">Home</a></li>
      <li>&#187;</li>
      <li><a href="<%=request.getContextPath() %>/UserController?source=myprofile">My profile</a></li>
      
    </ul>
  </div>
</div>

<div class="wrapper col3">
  <div id="gallery"><li>
<form class="form-container4"  action="<%=request.getContextPath()%>/UserController" method="get" name="changepassword" onsubmit="return validatechangePassword()">
<input type="hidden" name="source" value="updatepassword">
<%
String pass=(String)request.getAttribute("password");
%>
<center><div class="form-title"><h2> Change password</h2></div></center>

<table style="border: hidden ; border-style: hidden; ">
<tr>
<td>Old password:</td>
<td><input class="form-field" id="oldpass" name="oldpassword" type="password" value=<%=pass%> disabled="disabled"></input><br><span id="rp_error" style="color: red" ></span></td>
</tr>

<tr><td>New password:</td>
<td><input class="form-field"  id="newpassword" name="newpassword" type="password" placeholder="Enter new password"  onblur="validateChangePassword()"></input><br><span id="cp_error" style="color: red" ></span></td>
</tr>
<tr><td>Confirm password:</td>
 <td><input  class="form-field" id="cpass" name="conformpassword" type="password" placeholder="Retype password" onblur="validateConPassword()"></td>
 </tr>
	<tr>
          <td><center><input id="shiny" type="reset" onclick="myFunction()"></input></center></td>
          <td>
       <center><input id="shiny" name="update" type="submit" value="Change password" ></input></center></td> </tr>
            </table>
      </form>
    </li>
  </div>
    <div class="wrapper col3">
  <div id="gallery1">
<form class="form-container"><center>
          <a href="<%= request.getContextPath() %>/UserController?source=myprofile1&&eaddress=<%=email1%>"><input id="shiny" name="update" type="button"value="    Update Profile   " ></input></a><br>
          <a href="<%= request.getContextPath() %>/UserController?source=changepassword&&eaddress=<%=email1%>"><input id="shiny" name="changepassword" type="button"value=" Change password " ></input></a>
         <a href="<%=request.getContextPath()%>/UserController?source=deactivatereason"> <input id="shiny" name="deactive" type="button"value="Deactivate account" ></input></a>
</center>  </form>
  </div>
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
    <p><a href="http://www.os-templates.com/" title="charan">All Rights Reserved</a></p>
    <div class="clear"></div>
  </div>
</div>
</body>
</html>