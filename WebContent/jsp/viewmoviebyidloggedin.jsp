<%@page import="com.tcs.ilp.mas.bean.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/navigation.css" type="text/css" />
<title>TVM CINEMAS</title>
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
      <li><a href="<%= request.getContextPath() %>/UserController?source=myprofile">My Profile</a></li><li><a href="<%= request.getContextPath() %>/TicketController?source=bookedhistory">Booking History</a></li> 
      <li><a href="<%= request.getContextPath() %>/TicketController?source=bookticket">Book Ticket</a></li> 
      
        <li><a href="<%= request.getContextPath() %>/MovieController?source=upcomingmovieloggedin">Upcoming Movies</a>
       </li>
      <li><a href="<%= request.getContextPath() %>/MovieController?source=nowshowingmovieuser">Now Showing Movies</a>
      </li>
     <li><a href="<%= request.getContextPath() %>/UserController?source=userlogin">Home</a>
      </li>
<%
MovieBean mb =(MovieBean) request.getAttribute("moviebyid");

%>
     
     
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
      <li><a href="#">View Movie</a></li>	
	  <li>&#187;</li>
      <%= mb.getName().toUpperCase() %>
    </ul>
  </div>
</div>


<div class="wrapper col3">
  <div id="gallery">
<h1 style="color: #336666">*The details and screen timings are subject to availability</h1>
<%
if(mb != null)
{
%>
<div style="width: 550px;height: 230px; background-color: #cccccc; margin-left:200px; box-shadow: 10px 10px 5px #888888;">
<li>
<div style="width: 150px; height: 200px; border-style: solid;border-color: #336666 " align="left" >
<img width="150px" height="200px" src="<%= request.getContextPath() %>/ImageController?source=image&&id=<%= mb.getMovieId() %>"  >
</div>
</li>

<div style="text-align: center;">
<b style="font-size: 30px; color: #336666"><u><%=mb.getName().toUpperCase() %></u></b><br><br>
</div>

<font style="margin-left: 70px">Movie Id:</font> <b style="color: #336666; padding: 10px;"><%=mb.getMovieId() %></b><br>
<font style="margin-left: 70px">Language: </font><b style="color: #336666; padding: 10px; margin-top: 200px" ><%=mb.getLanguage().toLowerCase()%></b> <br>
<font style="margin-left: 70px">Duration: </font><b style="color: #336666; padding: 10px; margin-top: 200px" ><%=mb.getDuration() %>&nbsp;mins</b> <br>
<font style="margin-left: 70px">Release Date<font color="#6E6E6E">(yyyy-mm-dd):</font><b style="color: #336666; padding: 10px; margin-top: 200px" ><%=mb.getBeginDate() %></b> <br>
<font style="margin-left: 70px">Screen: </font><b style="color: #336666; padding: 10px; margin-top: 200px"  >screen &nbsp;<%=mb.getScreen()%></b> <br>
<% 
if(mb.getShow() .equalsIgnoreCase("m"))
{
%>
<font style="margin-left: 265px">Show: </font><b style="color: #336666; padding: 10px; margin-top: 200px" >morning</b> <br>
<%} %>
<% 
if(mb.getShow() .equalsIgnoreCase("a"))
{
%>
<font style="margin-left: 265px">Show: </font><b style="color: #336666; padding: 10px; margin-top: 200px" >afternoon</b> <br>
<%} %>
<% 
if(mb.getShow() .equalsIgnoreCase("e"))
{
%>
<font style="margin-left: 265px">Show: </font><b style="color: #336666; padding: 10px; margin-top: 200px" >evening</b> <br>
<%} %><br><br>

<form action="<%=request.getContextPath() %>/TicketWithBeanController" method="get">
<input type="hidden" name="id" value=<%= mb.getMovieId() %>>
<input type="hidden" name="action" value="moviebeanforticket">
<div align="center">
<input style="margin-left: 170px" id="shiny" type="submit" value="book ticket">
</div>

</form>
</div>
</div><br><br>
<%} %>
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