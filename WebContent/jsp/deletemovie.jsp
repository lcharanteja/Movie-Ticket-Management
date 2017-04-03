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
      <li><a href="<%= request.getContextPath() %>/UserController?source=adminlogin">Home</a></li>
      <li>&#187;</li>
      <li><a href="<%= request.getContextPath() %>/MovieController?source=viewmoviesadmin">View Movies</a></li>	
    </ul>
  </div>
</div>
<% MovieBean mBean = new MovieBean();
mBean = (MovieBean) request.getAttribute("searchedMovie");
%>

<div class="wrapper col3">
  <div id="gallery">

<form action="<%=request.getContextPath() %>/MovieController" name="delete" method="get">
<ul>
          <table border="0" class="CSSTableGenerator">
         
<tr><td style="color: black">MOVIE ID:</td>
            <td><input id="fullname" type="text" disabled="disabled" value=<%=mBean.getMovieId() %>></td></tr>
 			
 <tr><td style="color: black">Name:</td>
            <td><input id="fullname" name="firstname" type="text" disabled="disabled" value=<%=mBean.getName() %>></td></tr>
 			<tr><td style="color: black">Language:</td>
            <td><input type="text" disabled="disabled" value=<%=mBean.getLanguage() %>>
</td></tr>
   
 			<tr><td style="color: black">Duration(in mins):</td>
            <td ><input type="text" disabled="disabled" value=<%=mBean.getDuration() %>>
</td></tr>
 			<tr><td style="color: black">Show(M-Morning/A-Afternoon/E-Evening):</td>
            <td><input type="text" disabled="disabled" value=<%=mBean.getShow() %>>
</td></tr>
 <tr><td style="color: black">BeginDate: <font color="#6E6E6E"> (yyyy-mm-dd)</td>
            <td><input id="fullname" name="firstname" type="text" disabled="disabled" value=<%=mBean.getBeginDate() %>></td></tr>
 <tr><td style="color: black">EndDate: <font color="#6E6E6E"> (yyyy-mm-dd)</td>
            <td><input id="fullname" name="firstname" type="text" disabled="disabled" value=<%=mBean.getEndDate() %>></td></tr>

 			<tr><td style="color: black">Screen:</td>
            <td><input type="text" disabled="disabled" value=<%=mBean.getScreen() %>>
</td></tr>
          
          
          <tr><td colspan="2" > 
                     <input type="hidden" name="movieId1" value=<%=mBean.getMovieId()%> >
           <input id="shiny" name="source" type="submit" value="Delete Movie" style="margin-left: 400px"/>
          </td></tr>  
            </table> 
        </ul>
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