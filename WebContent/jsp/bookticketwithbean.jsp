<%@page import="com.tcs.ilp.mas.bean.MovieBean"%>
<%@page import="com.tcs.ilp.mas.bean.CustomerBean"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/layout.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/navigation.css" type="text/css" />
<script type="text/javascript" src="<%= request.getContextPath() %>/js/javascript.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/MyScript.js"></script>
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
       <li><a href="<%= request.getContextPath() %>/UserController?source=myprofile">My Profile</a>
      </li><li><a href="<%= request.getContextPath() %>/ViewController?source=bookedhistory">Booking History</a></li> 

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
  <div id="breadcrumb">
    <ul>
      <li class="first">You Are Here</li>
      <li>&#187;</li>
      <li><a href="<%= request.getContextPath() %>/UserController?source=userlogin">Home</a></li>
      <li>&#187;</li>
      <li><a href="<%= request.getContextPath() %>/TicketController?source=bookticket">BookTicket</a></li>
    </ul>
  </div>
</div>
	
<div class="wrapper col3">
  <div id="gallery" >
 <h1 style="color: #336666;"><center><font size="10px">Book Ticket</font></center></h1>
  	<%  
  		MovieBean mBean = (MovieBean) request.getAttribute("moviebeanforticket");
  	java.util.Date date = new java.util.Date();
  	java.sql.Date date1 = new java.sql.Date(date.getTime());
	%> 
  
  <form name="ticket" action="<%=request.getContextPath()%>/TicketWithBeanController" method="get">
  <input type="hidden" name="action" value="checkforavailability">
  <input type="hidden" name="id" value=<%=mBean.getMovieId() %>>
     <table style="border-style: hidden;" class="form-container2"> 
          <font color="red" style="margin-left: 300px;">All fields are mandatory</font>    
  <tr><td>Language<sup style="color: red"></sup>:</td>
            <td><label><input type="text" name="language" value=<%=mBean.getLanguage() %> disabled="disabled">
  <span id="lang_error" style="color: red" ></span></label></td></tr>
   
   

   <tr><td>Movie:</td>
            <td><label><input type="text" name="name" value=<%=mBean.getName() %> disabled="disabled"><span id="movie_error" style="color: red" ></span></label></td></tr>

            
            
 <tr><td>Screen<sup style="color: red"></sup>:</td>
          <td><label><input type="text" name="screen" value=<%=mBean.getScreen() %> disabled="disabled"><span id="screen_error" style="color: red" ></span></label></td></tr>


  <tr><td>Show:</td>
      <td><label><input type="text" name="show" value=<%=mBean.getShow() %> disabled="disabled"></label>
 <a style="color: white" https://www.google.com" onclick="javascript:void window.open('jsp/showtimings.jsp','1409857129035','width=450,height=200,toolbar=1,menubar=1,location=0,status=1,scrollbars=0,resizable=1,left=0,top=0');return false;"> <u>Timings</u> </a>
</td> </tr>
  <tr><td>Select Date (dd-MM-yyyy) :</td>
         <td><label><input type="date" id="date" name="date" max=<%=mBean.getEndDate() %> min=<%= date1%> onblur="validateDateBean()"><span id="date_error" style="color: red" ></span>      																													
         	</label>
         </td>
  </tr>   
</table>
<input type="submit" align="middle" id="shiny" name="check" value="check for availability" style="margin-left: 500px" onclick="return validateDateBean()">
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
    <p><a href="http://www.os-templates.com/" title="Free Website Templates">All Rights Reserved</a></p>
    <div class="clear"></div>
  </div>
</div>
</body>

</html>