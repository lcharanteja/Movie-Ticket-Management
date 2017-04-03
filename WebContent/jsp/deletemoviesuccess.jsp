<%@page import="java.util.ArrayList"%>
<%@page import="com.tcs.ilp.mas.bean.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/navigation.css" type="text/css" />
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
      <li><a href="<%= request.getContextPath() %>/MovieController?source=viewmoviesadmin">View Movies</a></li>	
    </ul>
  </div>
</div>




<% MovieBean mb = new MovieBean();
mb = (MovieBean) request.getAttribute("deletedMovieBean");
%>

<div class="wrapper col3" align="center">
  <div id="gallery1" style="width: 800px;" align="center">

<form  action="<%=request.getContextPath() %>/MovieController" name="delete success" method="get" style="text-align: center;">
<h1 align="center" style="color: green;"> <b> &#10004; Hurray!!! <u><%=mb.getName() %></u> is deleted succesfully</b></h1>
<table bordercolor="black" border="1px" width="800px"  style="color: #336666;margin-left: 100px;">
<tr>
<td style="color: #336666">movie Id</td>
<td style="color: #336666"><%=mb.getMovieId() %> </td>
</tr>
<tr>
<td style="color: #336666"> language</td>
<td style="color: #336666"> <%=mb.getLanguage() %> </td>
</tr>
<tr>
<td style="color: #336666">duration</td>
<td style="color: #336666"> <%=mb.getDuration() %> </td>
</tr>
<tr>
<td style="color: #336666">show </td>
<td style="color: #336666"> <%=mb.getShow() %> </td>
</tr>
<tr>
<td style="color: #336666"> begin Date</td>
<td style="color: #336666"> <%=mb.getBeginDate() %></td>
<tr>
<td style="color: #336666"> end Date</td>
<td style="color: #336666"> <%=mb.getEndDate() %></td>
</tr>
<tr>
<td style="color: #336666">screen</td>
<td style="color: #336666"> <%=mb.getScreen() %></td>
</tr>
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
</div>
</body>
</html>


