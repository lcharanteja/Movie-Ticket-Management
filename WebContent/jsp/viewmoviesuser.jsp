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
        <fieldset>
     <%String email1=(String)session.getAttribute("emailid");
          if(email1==null)
          {
        	  response.sendRedirect("index.jsp");
          }
          %>
          <font size="3" color="#FFFFFF">welcome <%= email1 %>(Admin)</font>   &nbsp;
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
        
      
      
     
     <li><a href="<%= request.getContextPath() %>/UserController?source=deactivate">Deactivate Account</a>
      </li> 
           <li><a href="<%= request.getContextPath() %>/MultiplexController?source=aboutus">About us</a>
      </li>
      <li><a href="<%= request.getContextPath() %>/MultiplexController?source=contactus">Contact us</a>
      </li>
     
      
       <li><a href="<%= request.getContextPath() %>/UserController?source=myprofile">My Profile</a>
      </li>
      <li><a href="<%= request.getContextPath() %>/TicketController?source=bookticket">Book Ticket</a></li> 
        <li><a href="<%= request.getContextPath() %>/MovieController?source=upcomingmovieuser">Upcoming Movies</a>
       </li>
      <li><a href="<%= request.getContextPath() %>/MovieController?source=nowshowingmoviesuser">Now Showing Movies</a>
      </li>
     <li><a href="<%= request.getContextPath() %>/UserController?source=userlogin">Home</a>
      </li>
     
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
      <li><a href="<%= request.getContextPath() %>/MovieController?source=viewmoviesuser">View Movies</a></li>	
    </ul>
  </div>
</div>


<div class="wrapper col3">
  <div id="gallery">
  <h3 style="color: green"> Click on the movie poster for more details about the Movie </h3>
<%
ArrayList<MovieBean> allMoviesList =(ArrayList<MovieBean>) request.getAttribute("allmovies");
for(MovieBean mb: allMoviesList)
{
%>
<form action="<%=request.getContextPath() %>/TicketController">
<input type="hidden" name="id" value="<%= mb.getMovieId() %>">
<table style="width:600px" align="center" border="0px">
<tr><td align="right" width="250px" height="250px" style="padding-left: 3px">
<a href="<%=request.getContextPath() %>/MovieController?source=viewmoviebyiduser&id=<%= mb.getMovieId()%>"><img width="250px" height="250px" src="<%= request.getContextPath() %>/ImageController?source=image&&id=<%= mb.getMovieId() %>" ></a>
</td>
<td style="width:200px ;border-width: 0px;"><h1 align="center" style="border-width:0px ;color:#336666; text-align: center; font-family:sans-serif; font-style: italic; margin-top: 60px">Name: <%= mb.getName().toUpperCase() %> </h1> </br> </br> <h1 style="text-align: center; color: black"><%= mb.getLanguage().toUpperCase() %></h1> </td>
<td style="width:150px ;text-align:center;"><input style="margin-top: 100px;" id="shiny" type="submit" name="source" value="bookticket"></td>
</table>
<%} %>
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