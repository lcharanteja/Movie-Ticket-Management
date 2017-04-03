<%@page import="com.tcs.ilp.mas.bean.TicketBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/layout.css" type="text/css" />
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
       <li><a href="<%= request.getContextPath() %>/UserController?source=myprofile">My Profile</a></li><li><a href="<%= request.getContextPath() %>/ViewController?source=bookedhistory">Booking History</a></li> 
      <li><a href="<%= request.getContextPath() %>/TicketController?source=bookticket">Book Ticket</a></li> 
      
        <li><a href="<%= request.getContextPath() %>/MovieController?source=upcomingmovieloggedin">Upcoming Movies</a>
       </li>
      <li><a href="<%= request.getContextPath() %>/MovieController?source=nowshowingmovieuser">Now Showing Movies</a>
      </li>
     <li><a href="<%= request.getContextPath() %>/UserController?source=userlogin">Home</a>
      </li></ul>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col3">
  <div id="gallery2">
<h3 style="color: green;text-align: center;"><b> &#10004; Hurray!!! Your ticket is successfully booked </b></h3>
<form action="#" method="post" >
<table align="center" class="CSSTableGenerator">
	<tr><td colspan="2">Ticket Details</td></tr>
	<%
	TicketBean ticketBean = (TicketBean)request.getAttribute("TicketBeans");
		if(ticketBean!=null){
	%>
		<tr><td>Ticket ID</td><td><%= ticketBean.getTicketID() %></td></tr>
		<tr><td>Movie Name</td><td><%= ticketBean.getMovieName() %></td></tr>
		<tr><td>Booking Date</td><td><%= ticketBean.getBookingDate() %></td></tr>
		<tr><td>Screen</td><td><%= ticketBean.getScreen()%></td></tr>
		<tr><td>Show</td><td><%= ticketBean.getShow()%></td></tr>
		<tr><td>Class</td><td><%= ticketBean.getClassType() %></td></tr>
		<tr><td>Allocated Seats</td><td><%= ticketBean.getAllocatedSeats() %></td></tr>
	<%
		}
	%>		
</table> 
</form><br>
<form action="<%=request.getContextPath()%>/UserController">
<input type="hidden" name="source" value="userlogin">
<div align="center">
<input type="submit" id="shiny" value="Home">
<input type="button" value="Print" onClick="window.print()" id="shiny">
</div>
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
</div>
</body>

</html>