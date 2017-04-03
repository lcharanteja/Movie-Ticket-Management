<%@page import="com.tcs.ilp.mas.bean.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/navigation.css" type="text/css" />
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
    <li><a href="<%= request.getContextPath() %>/UserController?source=ticketdetails">Booking History</a>
      </li>
    <li><a href="<%= request.getContextPath() %>/UserController?source=activatecustomer">Activate</a>
      </li>
          <li><a href="<%= request.getContextPath() %>/UserController?source=deactivatecustomer">Deactivate</a>
      </li>
      <li><a href="<%= request.getContextPath() %>/UserController?source=customerdetails">Customer Details</a>
      </li>
        <li><a href="<%= request.getContextPath() %>/MovieController?source=addmovie">Add Movie</a>
      </li>
        <li><a href="<%= request.getContextPath() %>/MovieController?source=viewmoviesadmin">All Movies</a>
      </li>
        <li><a href="<%= request.getContextPath() %>/MovieController?source=upcomingmovieadmin">Up coming Movies</a>
      </li>
       <li><a href="<%= request.getContextPath() %>/MovieController?source=nowshowingmovieadmin">NowShowing Movies</a>
       </li>
     
      <li class="active"><a href="<%= request.getContextPath() %>/UserController?source=adminlogin">Home</a></li>
   
          </ul>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col3">
  <div id="breadcrumb">
    <ul>
      <li class="first">You Are Here</li>
      <li>&#187;</li>
      <li><a href="<%= request.getContextPath() %>/MultiplexController?source=adminlogin">Home</a></li>
      <li>&#187;</li>
      <li>Update Movie</li>	
      <li>&#187;</li>
      <li>Success</li>	
    </ul>
  </div>
</div>


<%
MovieBean mb = (MovieBean)request.getAttribute("updatedMovie");


if(mb!= null){%>
<h1 align="center" style="color:white;"><b>&#10006; It seems you have not updated any details</b> </h1>


<table  align="center"   >

<tr height="30px">
<td>movie Id</td>
<td><%=mb.getMovieId() %> </td>
</tr>
<tr height="30px">
<td> language</td>
<td> <%=mb.getLanguage() %> </td>
</tr>
<tr height="30px">
<td>duration</td>
<td> <%=mb.getDuration() %> </td>
</tr>
<tr height="30px">
<td>show </td>
<td> <%=mb.getShow() %> </td>
</tr>
<tr height="30px">
<td> begin Date</td>
<td> <%=mb.getBeginDate() %></td>
<tr height="30px">
<td> end Date</td>
<td> <%=mb.getEndDate() %></td>
</tr>
<tr height="30px">
<td>screen</td>
<td> <%=mb.getScreen() %></td>
</tr>
<tr>
                        <td >
                            MOVIE IMAGE:
                        </td>
                        <td>
                            <img src="<%= request.getContextPath() %>/ImageController?source=image&&id=<%= mb.getMovieId() %>" width="150px" height="150px">
                        </td>
 
                  </tr>
 
</table><br><br>
  
</div><br> <br>

    
<%} %>
 <form action="<%=request.getContextPath()%>/MovieController" method="get" name="Go Home"><div id="gallery">
<input type="hidden" name="source" value="viewmoviesadmin">
 <div align="center">
<input style=""align="middle" id="shiny" type="submit" name="home" value="view movies">
 </div>
</form>
<br>
<form action="<%=request.getContextPath()%>/MovieController" method="get" name="retry">
      <input type="hidden" name="source" value="update movie">
      <input type="hidden" name="id" value="<%= mb.getMovieId() %>">
      <div align="center">
      <input id="shiny" align="middle" type="submit" value="Retry update movie">
      </div>
      </form>
</body>
</html>