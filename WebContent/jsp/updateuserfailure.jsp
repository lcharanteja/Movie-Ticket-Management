<%@page import="com.tcs.ilp.mas.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>TVM CINEMAS</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/layout.css" type="text/css" />
<script type="text/javascript" src="<%= request.getContextPath() %>/js/javascript.js"></script>
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
      <li><a href="<%= request.getContextPath() %>/UserController?source=userlogin">Home</a></li>
      <li>&#187;</li>
     <li><a href="<%= request.getContextPath() %>/UserController?source=myprofile">Myprofile</a></li>	
    </ul>
  </div>
</div>
<%
CustomerBean cBean=(CustomerBean)request.getAttribute("customer");
%>
<div class="wrapper col3">
  <div id="gallery">
  <p style="color: red"> &#10006; You have not changed any field.Your account details is given below</p>
 <li>
 <form  class="form-container41">
<table style="border: hidden ; border-style: hidden;">
<tr>
<td><font size="3">Customer Id :</font></td><td><font size="3"><%=cBean.getCustomerid()%></font></td>
</tr>
<tr>
<td><font size="3">First name :</font></td><td><font size="3"><%=cBean.getFirstname()%></font></td></tr><tr>
<td><font size="3">Last name :</font></td><td><font size="3"><%=cBean.getLastname()%></font></td>
</tr>
<tr>
<td><font size="3">Gender :</font></td><td><font size="3"><%=cBean.getGender()%></font></td>
</tr>
<tr>
<td><font size="3">Date of birth :</font></td><td><font size="3"><%=cBean.getDob()%></font></td>
</tr>
<tr>
<td><font size="3">Phone number :</font></td><td><font size="3"><%=cBean.getPhoneno()%></font></td>
</tr>
<tr>
<td><font size="3">City :</font></td><td><font size="3"><%=cBean.getCity()%></font></td>
</tr>
<tr>
<td><font size="3">Location :</font></td><td><font size="3"><%=cBean.getLocation()%></font></td>
</tr>
<tr>
<td><font size="3">Email address :</font></td><td><font size="3"><%=cBean.getEmail()%></font></td>
</tr>
	   </table>
      </form></li>
  </div>

<div class="wrapper col3">
  <div id="gallery1">
<form class="form-container"><center>
          <a href="<%= request.getContextPath() %>/UserController?source=myprofile1&&eaddress=<%=email1%>"><input id="shiny" name="update" type="button"value="    Update Profile   " ></input></a><br>
          <a href="<%= request.getContextPath() %>/UserController?source=changepassword&&eaddress=<%=email1%>"><input id="shiny" name="changepassword" type="button"value=" Change password " ></input></a>
         <a href="<%=request.getContextPath()%>/UserController?source=deactivatereason"> <input id="shiny" name="deactive" type="button"value="Deactivate account" ></input></a>
     </center> </form>
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
    <p><a href="http://www.os-templates.com/" title="Free Website Templates">All Rights Reserved</a></p>
    <div class="clear"></div>
  </div>
</div>
</body>
</html>