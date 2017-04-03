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

  <%  
  ArrayList<String>listLanguages = (ArrayList<String>)request.getAttribute("languages");
  ArrayList<String>listMovies = (ArrayList<String>)request.getAttribute("movies");
  ArrayList<Date> listDate= (ArrayList<Date>)request.getAttribute("date");
  ArrayList<Integer>listScreens = (ArrayList<Integer>)request.getAttribute("screens");
  ArrayList<String>listShows = (ArrayList<String>)request.getAttribute("shows");
  ArrayList<String>listClass = (ArrayList<String>)request.getAttribute("classestype");
%> 
 <center>
  <form  class="form-container5" name="ticket" action="<%=request.getContextPath()%>/TicketController" method="get"  >
  <input  class="form-field" type="hidden" name="action" value="">
  <div class="form-title"><h4>Book Ticket</h4></div>
  <font color="red">* marked fields are mandatory</font> 
  <table style="border-style: hidden;" >    <tr></tr>
  <tr><td>Select Language<sup style="color: red">*</sup>:</td>
            <td><label><span id="lang_error" style="color: red" ></span><select class="form-field"  name="language" onchange="callPopulate('populateMovies')">
  <option value="Select">Select</option>
 <%
 		String selectedLanguage = (String)request.getAttribute("selectedLanguage");
        if(listLanguages!=null){
        for(String language : listLanguages){
                
  %>
  
  <option <%if(selectedLanguage!=null && language.equals(selectedLanguage)){out.println("selected");}%>> <%= language %></option>
  <%} } %>
  
</select></label></td>
   
   

   <td>Select Movie<sup style="color: red">*</sup>:</td>
            <td><label><span id="movie_error" style="color: red" ></span><select class="form-field"  name="movie" onchange="callPopulate('populateDate')">
  <option value="Select">Select</option>
  
  <%
        String selectedMovie = (String)request.getAttribute("selectedMovie");
        if(listMovies !=null){
        for(String movie : listMovies ){
                
  %>
  
  <option <%if(selectedMovie!=null && movie.equals(selectedMovie)){out.println("selected");}%>> <%= movie %></option>
  <%} } %>
 
</select></label></td></tr>


  <tr><td>Select Date<sup style="color: red">*</sup>:</td>
         <td><label> <span id="date_error" style="color: red" ></span><select class="form-field"  name="date"  onchange="callPopulate('populateScreen')" > 
         <option value="Select">Select</option>

  <%
  		Date selectedDate = (Date)request.getAttribute("selectedDate");
        if(listDate !=null){
        for(Date date : listDate ){
                
  %>
  <option <%if(selectedDate!=null && date.equals(selectedDate)){out.println("selected");}%>> <%= date %> </option>
  <%} } %> 
         </select></label></td>
   
<%-- <tr><td>Select Date (dd-MM-yyyy) :</td>
         <td><label><input type="date" id="date" name="date" max=<%=moviebean.getEndDate() %> min=<%=moviebean.getBeginDate() %> 
         			 onchange="callPopulate('populateScreen')"><span id="date_error" style="color: red" ></span>      																													
         	</label>
         </td>
</tr>         
 --%>           
 <td>Select Screen<sup style="color: red">*</sup>:</td>
          <td><label><span id="screen_error" style="color: red" ></span><select class="form-field"  name="screen" onchange="callPopulate('populateShow')">
  <option value="0">Select</option>
  
   <%
   Integer selectedScreen = (Integer)request.getAttribute("selectedScreen");
		System.out.println("int value:"+ selectedScreen);
        if(listScreens !=null){
        for(int screen : listScreens ){
                
  %>
  <option <%if(selectedScreen!=null && (screen == selectedScreen)){out.println("selected");}%> > <%= screen%> </option>
  <%} } %> 
</select></label></td></tr>


  <tr><td>Select Show<sup style="color: red">*</sup>:</td>
      <td><label><span id="show_error" style="color: red" ></span><select class="form-field" name="show"  onchange="callPopulate('classtype')">
  <option value="Select">Select</option>

<% 
String selectedShow = (String)request.getAttribute("selectedShow");
  if(listShows !=null){
        for(String show : listShows){
%>
<option <%if(selectedShow!=null && show.equals(selectedShow)){out.println("selected");}%>>  <%= show %> </option>
 <%} } %></select></label>
<td> <a style="color: white" https://www.google.com" onclick="javascript:void window.open('jsp/showtimings.jsp','1409857129035','width=450,height=200,toolbar=1,menubar=1,location=0,status=1,scrollbars=0,resizable=1,left=0,top=0');return false;"><br> <u> Show Timings </u> </a>
</td> </tr>

   <tr> <td> Select Class Type:</td>
 	<td> <label> <span id="class_error" style="color: red" ></span>  <select class="form-field"  id="classtype" name="classtype" onchange="callPopulate('checkSeats')"> 
 	<option value= "Select"> Select </option>
 	<% String selectedClass = (String)request.getAttribute("classtype");
 		if(listClass !=null){
        for(String classType : listClass){%>
 
	 <option <%if(selectedClass!=null && (classType.equals(selectedClass))){out.println("selected");}%>>  <%= classType %> </option>
 
 	<%}} %>
  	</select> </label> </td> 
  
   	<td>No. of Available Seats<sup style="color: red"></sup>:</td>
   	<td>
   	<% Integer seatsAvailable = (Integer)request.getAttribute("seatsAvailable"); %>
   	<input class="form-field"  type="text" id="seatsavailable" name="seatsavailable" style="width: 60px;" value=<% if(seatsAvailable != null){out.println(seatsAvailable);} else {out.println(0);}%> disabled="disabled">
 	<input class="form-field"  type="hidden" name="temp1"> </td> 
 	</tr>
  
    <tr><td>Enter No of Seats<sup style="color: red">*</sup>:</td>
    <td><% Integer seatsNeeded = (Integer)request.getAttribute("seatsNeeded"); %> 
   	<input class="form-field"  type="text"  id="seatsneeded" name="seatsneeded" style="width: 60px;"  value=<% if(seatsNeeded != null) {out.println(seatsNeeded);} else {out.println(0);} %> onblur="callPopulate1('price')"> 
	<span id="need_error" style="color: red" ></span><input  class="form-field" type="hidden" name="temp">
	 </td>
	

			<td>Total Price<sup style="color: red">*</sup>:</td>
            <td> <% Integer totalPrice = (Integer)request.getAttribute("totalPrice"); %>
             <span id="price_error" style="color: red" ></span> <input class="form-field"  type="text" id="tprice" name="tprice"  style="width: 60px;" value= <% if(totalPrice !=null) {out.println(totalPrice);} else {out.println(0);}%> disabled="disabled">
            <a style = "color: white;"https://www.google.com" onclick="javascript:void window.open('jsp/priceperticket.jsp','1409857129035','width=500,height=200,toolbar=1,menubar=1,location=0,status=1,scrollbars=0,resizable=1,left=0,top=0');return false;"><u> Price Details </u> </a>
             </td>
</tr>
   
   <tr><td>Email id <sup style="color: red">*</sup>:</td>
            <td><input class="form-field"  id="eaddress" name="eaddress" type="text"  onblur="validateEmailAddressUser()" 
            value=<% String email=(String)session.getAttribute("emailid"); if(email!=null){out.println(email);} else{out.println(" ");}%>/>
           
            <span id="e_error" style="color: red" ></span></td>
    
<td>Phone No<sup style="color: red">*</sup>:</td>
            <td> <span id="p_error" style="color: red" > </span><input class="form-field" maxlength="10"  id="phoneno" name="phoneno" type="text" onblur="validatePhoneNumberUser()"/>
            </td> </tr>
       <input type="hidden" name="ptemp" value="">    
      </table>
         <center> <input id="shiny" name="submitform" type="button" value="Book Ticket" onclick="validateBookTicket('bookTicketNow')"/> &nbsp;&nbsp;&nbsp;
             <input id="shiny" type="reset" onclick="callPopulate('bookcancel')"/></center><br>
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
</center>
</html>