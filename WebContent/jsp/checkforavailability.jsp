<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="com.tcs.ilp.mas.bean.MovieBean"%>
<%@page import="com.tcs.ilp.mas.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/layout.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/navigation.css" type="text/css" />
<script type="text/javascript" src="<%= request.getContextPath() %>/js/javascript.js"></script>

<title>TVM CINEMAS</title>
<% response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");%>

<SCRIPT type="text/javascript">
function noBack() 
	{ if(window.history.forward(1) != null)
	    window.history.forward(1);}
</SCRIPT>
</head>
<body id="top" onload="noBack();"
onpageshow="if (event.persisted) noBack();">
<div class="wrapper col1">
  <div id="topbar">
    <div id="search">
      <form action="#" method="post">
        <fieldset>
       <%String name1=(String)session.getAttribute("customername");
       String email1=(String)session.getAttribute("emailid");
          
          %>
          <font size="3" color="#FFFFFF">Welcome <%= name1 %></font>   &nbsp;
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
       <li><a href="<%= request.getContextPath() %>/UserController?source=myprofile1&&eaddress=<%=email1%>">My Profile</a>
      </li><li><a href="<%= request.getContextPath() %>/ViewController?source=bookedhistory">Booking History</a></li> 
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
      <li><a href="#">view movies</a></li>
	  <li>&#187;</li>
      <li><a href="#">Book Ticket</a></li>
	  <li>&#187;</li>
    </ul>
  </div>
</div>
<div class="wrapper col3">
  <div id="gallery" >
  <%  
  String name = (String) request.getAttribute("name");
  String language = (String) request.getAttribute("language");
  int id = (Integer) request.getAttribute("id");
  int screen = (Integer) request.getAttribute("screen");
  String date =  (String) request.getAttribute("selectedDate");
  String show = (String) request.getAttribute("show");
  ArrayList<String>listClass = (ArrayList<String>)request.getAttribute("classestype");

%> 
    <center>
  <form name="ticketbean" action="<%=request.getContextPath()%>/TicketWithBeanController" method="get" class="form-container5">

   <div class="form-title"><center><h4>Book Ticket</h4></center></div><input type="hidden" name="action" value="">
  <input type="hidden" name="id" value=<%=id %>>
  <input  type="hidden" name="tempd" value="">
     <table style="border-style: hidden;"> 
          <font color="red" style="margin-left: 300px;">All marked fields are mandatory</font>    
  <tr><td>Language<sup style="color: red"></sup>:</td>
            <td><label><input  class="form-field" type="text" name="language" value=<%=language %> disabled="disabled">
  <span id="lang_error" style="color: red" ></span></label></td></tr>
   
   

   <tr><td>Movie:</td>
            <td><label><input class="form-field" type="text" name="name" value=<%= name %> disabled="disabled"><span id="movie_error" style="color: red" ></span></label></td></tr>

            
            
 <tr><td>Screen<sup style="color: red"></sup>:</td>
          <td><label><input class="form-field" type="text" name="screen" value=<%=screen%> disabled="disabled"><span id="screen_error" style="color: red" ></span></label></td></tr>


  <tr><td>Show:</td>
      <td><label><input class="form-field" type="text" name="show" value=<%= show %> disabled="disabled"></label>
 	  	<a style="color: white" https://www.google.com" onclick="javascript:void window.open('jsp/showtimings.jsp','1409857129035','width=450,height=200,toolbar=1,menubar=1,location=0,status=1,scrollbars=0,resizable=1,left=0,top=0');return false;"> <u> Show Timings </u> </a>
</td> </tr>
  <tr><td>Select Date(dd-MM-yyyy) :</td>
         <td><label><input class="form-field" type="date" id="mdate" name="mdate" value=<%=date%> disabled="disabled"><span id="date_error" style="color: red" ></span></label></td></tr>
   
    <tr> <td> Select Class Type:</td>
 	<td> <label>  <select class="form-field" id="classtype" name="classtype" onchange="callPopulatebean('checkSeats')"> 
 	<option value= "Select"> Select </option>
 	<% String selectedClass = (String)request.getAttribute("classtype");
 		if(listClass !=null){
        	for(String classType : listClass){%>
 			<option <%if(selectedClass!=null && (classType.equals(selectedClass))){out.println("selected");}%>>  <%= classType %> </option>
 
 	<%		}
        } %>
  	</select> </label> <span id="class_error" style="color: red"></span> </td> 
  	</tr>
  	
   	<tr>
   	<td>No. of Available Seats<sup style="color: red"></sup>:</td>
   	<td>
   	<% Integer seatsAvailable = (Integer)request.getAttribute("seatsAvailable"); %>
   	<input class="form-field" type="text" id="seatsavailable" name="seatsavailable" style="width: 60px;" value=<% if(seatsAvailable != null){out.println(seatsAvailable);} else {out.println(0);}%> disabled="disabled">
 	<input  class="form-field"type="hidden" name="temp1"> </td> 
 	</tr>
  
    <tr><td>Enter No of Seats<sup style="color: red">*</sup>:</td>
    <td> <% Integer seatsNeeded = (Integer)request.getAttribute("seatsNeeded"); %>
   	<input class="form-field" type="text"  id="seatsneeded" name="seatsneeded" style="width: 60px;"  value=<% if(seatsNeeded != null) {out.println(seatsNeeded);} else {out.println(0);} %> onblur="callPopulatebean1('price')"> 
	<input class="form-field" type="hidden" name="temp">
	 <span id="need_error" style="color: red" ></span> </td></tr>
	
	<tr>
		<td>Total Price<sup style="color: red">*</sup>:</td>
        <td> <% Integer totalPrice = (Integer)request.getAttribute("totalPrice"); %>
        
        <input class="form-field" type="text" id="tprice" name="tprice"  style="width: 60px;" value= <% if(totalPrice !=null) {out.println(totalPrice); System.out.println("price in jsp page="+totalPrice);} else {out.println(0);}%> disabled="disabled">
        <a style = "color: white;"https://www.google.com" onclick="javascript:void window.open('jsp/priceperticket.jsp','1409857129035','width=500,height=200,toolbar=1,menubar=1,location=0,status=1,scrollbars=0,resizable=1,left=0,top=0');return false;"><u> Price Details </u> </a>
        <span id="price_error" style="color: red" ></span>  </td>
  	</tr> 
  	
  	<tr> <td></td>

   
   <tr><td>Email id <sup style="color: red">*</sup>:</td>
            <td><input class="form-field" id="eaddress" name="eaddress" type="text"  onblur="validateEmailAddressUser()" 
            value=<% String email=(String)session.getAttribute("emailid"); if(email!=null){out.println(email);} else{out.println(" ");}%>/>
           
            <span id="e_error" style="color: red" ></span></td></tr>
    
   <tr><td>Phone No<sup style="color: red">*</sup>:</td>
            <td><input class="form-field" id="phoneno" name="phoneno" type="text" onblur="validatePhoneNumberBean()"/>
            <span id="p_error" style="color: red" > </span> </td> </tr>
          
   
</table>
<center><input type="button" id="shiny" name="check" value="Book Ticket" onclick="BookTicketBean('bookTicketNow')"></center>
<input type="hidden" name="ptemp" value="">
</form>

</center>
   
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