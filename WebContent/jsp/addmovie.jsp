<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
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
<% ArrayList<Integer> sList = (ArrayList<Integer>) request.getAttribute("sList");
%>
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
      <li><a href="<%= request.getContextPath() %>/MovieController?source=addmovie">Add Movie</a></li>	
    </ul>
  </div>
</div>
    
    <% java.util.Date date = new java.util.Date();
  	java.sql.Date date1 = new java.sql.Date(date.getTime());
  	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String str = "2015-12-31";
     java.util.Date date2 = new java.util.Date();
      try 
      {
	       date = sdf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     
 java.sql.Date date3 = new java.sql.Date(date.getTime());
	
  	%>
<div class="wrapper col3">

  <div id="gallery">
<!-- 

<h1 align="center" style="color: #336666"><b>Enter the details of the movie</b></h1> -->
<form action="<%=request.getContextPath()%>/MovieController" method="get" name="addmovie">
<h1 style="color: #336666;margin-left: 420px" ><b>Add Movie</b></h1>

<ul><font color="red">* All fields are mandatory</font>    
          <table border="0" class="CSSTableGenerator">
 <tr><td style="font-size: medium;">Name<sup style="color: red"></sup>:</td>
            <td><input id="name" name="name" type="text" placeholder="Movie name" onblur="validateName()" /><span id="n_error" style="color: red" ></span></td></tr>
 			<tr><td style="font-size: medium;">Language<sup style="color: red"></sup>:</td>
             <td><label>
            <select name="language" onblur="validateLanguage()">
            <option value="Select">Select</option>
  <option value="Hindi">Hindi</option>
  <option value="English">English</option>
  <option value="Telugu">Telugu</option>
  <option value="Malayalam">Malayalam</option>
  <option value="Tamil">Tamil</option>
  <option value="Kannada">Kannada</option>
</select><span id="l_error" style="color: red" ></span></label>
</td></tr>
<tr><td style="font-size: medium;">Duration<sup style="color: red"></sup>:</td>
            <td ><label><input type="text" name="duration" placeholder="in minutes" onblur="validateDuration()">
   
</select><span id="d_error" style="color: red" ></span></label>
</td></tr>
 			<tr><td style="font-size: medium;">Show<sup style="color: red"></sup>:</td>
            <td><label><select name="show" onblur="validateShow()">
            <option value="Select">Select</option>
  <option value="M">11.00a.m&nbsp;</option>
  <option value="A">3.00p.m </option>
  <option value="E">7.00p.m</option>
  </select><span id="s_error" style="color: red" ></span></label>
</td></tr>
 <tr><td style="font-size: medium;">BeginDate <font color="#6E6E6E"> (mm/dd/yyyy)<sup style="color: red"></sup>:</td>
            <td><input id="fullname" name="begindate" type="date" min=<%=date1 %> max=<%=date3 %> onblur="validateBdate()"><span id="b_error" style="color: red" ></td></tr>
 <tr><td style="font-size: medium;">EndDate <font color="#6E6E6E"> (mm/dd/yyyy)<sup style="color: red"></sup>:</td>
            <td><input id="fullname" name="enddate" type="date" min=<%=date1 %> max=<%=date3 %> onblur="validateEdate()"><span id="e_error" style="color: red" ></td></tr>

 			<tr><td style="font-size: medium;">Screen<sup style="color: red"></sup>:</td>
            <td><label><select name="screen" onblur="validateScreen()">
            <option value="Select">Select</option>
 <% for(int i=1;i<4;i++)
	 {
	 %>
  <option value=<%= i %>><%= i %></option>
<% } %>
</select><span id="sc_error" style="color: red" ></span></label>
</td></tr>
 <tr><td style="font-size: medium;">MovieImage <font color=red> (in jpeg format of size upto 1MB)<sup style="color: red"></sup>:</td>
            <td><input id="movieimage" name="movieimage" type="file"></td></tr>
   
         	 
          <tr><td colspan="2" >
            <input id="shiny" name="source" type="submit" value="Add Movie" onclick="return validateAddMovie()" style="margin-left: 350px;" />
            &nbsp; &nbsp; &nbsp;
            <input id="shiny" name="reset" type="reset" value="Reset" onclick="window.location.reload()"/>
            </td>
          </tr>
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