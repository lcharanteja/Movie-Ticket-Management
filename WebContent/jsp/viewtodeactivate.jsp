<%@page import="com.tcs.ilp.mas.bean.CustomerBean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<!--  request.setAttribute("table", customerList);-->
<SCRIPT type="text/javascript">
function noBack() 
	{ if(window.history.forward(1) != null)
	    window.history.forward(1);}
</SCRIPT>
</head>
<body id="top" onload="noBack();"
onpageshow="if (event.persisted) noBack();">

<%-- if(customerList!=null)
{
for(CustomerBean c:customerList)
{%>
	<h1><%= c.getCity()%></h1>
<% }}%> --%>
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
      <li><a href="<%= request.getContextPath() %>/UserController?source=customerdetails">CustomerDetails</a></li>
      </ul>
  </div>
</div>


<div class="wrapper col3">
  <div id="gallery">

<form action="<%= request.getContextPath() %>/UserController" method="get" name="reasonform" onsubmit="return validateFinal()" >
<input type="hidden" name="source" value="deactivated">
<h1><center><font color=""> Showing Details Of Required Customer</font></center></h1>

<table border="2" class="CSSTableGenerator">
				<%
						CustomerBean customer= (CustomerBean) request.getAttribute("customer");
						String email=customer.getEmail();
					%>
				<tr><td>FirstName</td><td><input type="text" value=" <%=customer.getFirstname()%>" disabled="disabled"></td></tr>
						<tr><td>LastName</td><td><input type="text" value=" <%=customer.getLastname()%>" disabled="disabled"></td></tr>
						<tr><td>Gender</td><td><input type="text" value=" <%=customer.getGender()%>" disabled="disabled"></td></tr>
						<tr><td>PhoneNumber</td><td><input type="text" value=" <%=customer.getPhoneno()%>" disabled="disabled"></td></tr>
						<tr><td>City</td><td><input type="text" value=" <%=customer.getCity()%>" disabled="disabled"></td></tr>
						<tr><td>Location</td><td><input type="text" value="<%=customer.getLocation()%>" disabled="disabled"></td></tr>
						<tr><td>DateOfBirth<font color="#6E6E6E"> (yyyy-mm-dd)</td><td><input type="text" value="<%=customer.getDob()%>" disabled="disabled"></td></tr>
						<tr><td>EmailAddress</td><td><input type="text" value="<%=customer.getEmail()%>" name="email"></td></tr>
						<tr><td>CustomerId</td><td><input type="text" value=" <%=customer.getCustomerid()%>" disabled="disabled"></td></tr>
						<tr><td>Status</td><td><input type="text" value=" <%=customer.getStatus()%>" disabled="disabled"></td></tr>
						<tr><td>Deactivation reason:</td><td><textarea placeholder="Type reason for deactivation" rows="4" cols="40" name="dreason"  onblur="validateDescriptionReasonAdmin()" /></textarea><span id="r_error" style="color: red" ></span></td></tr>
						
					<tr><td colspan="2"><center><input type="submit" id="shiny" value="Deactivate"></center></input></a></td>
					
					</tr>
					
					
					<%-- <tr>
						<td><%=customer.getFirstname()%></td>
						<td><%=customer.getLastname()%></td>
						<td><%=customer.getGender()%></td>
						<td><%=customer.getPhoneno()%></td>
						<td><%=customer.getCity()%></td>
						<td><%=customer.getLocation()%></td>
						<td><%=customer.getDob()%></td>
						<td><%=customer.getEmail()%></td>
						<td><%=customer.getCustomerid()%></td>
						<td><%=customer.getStatus()%></td> --%>
						
	
				</table>
			
<%--   <display:table name="customerlist" sort="list" pagesize="10" id="table1"
		export="true">
		<display:column property="firstname" sortable="true" title="First Name"  ></display:column>
		<display:column property="lastname" sortable="true" title="Last Name"></display:column>
		<display:column property="gender" sortable="true" title="Gender"></display:column>
		<display:column property="dob" sortable="true" title="DateOfBirth"></display:column>
		<display:column property="phoneno" sortable="true" title="Phone Number"></display:column>
		<display:column property="city" sortable="true" title="City"></display:column>
		<display:column property="location" sortable="true" title="Location"></display:column>
		<display:column property="email" sortable="true" title="Email"></display:column>
		<display:column property="customerid" sortable="true" title="Customer_Id"></display:column>
    <display:column property="status" sortable="true" title="Status" ></display:column>
    </display:table>
 --%>    
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