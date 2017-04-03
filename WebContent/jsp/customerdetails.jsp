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
<script type="text/javascript" src="js/javascript.js"></script>
<% response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");%>
</head>

<!--  request.setAttribute("table", customerList);-->

<body id="top">
<% 
ArrayList<CustomerBean> customerList = (ArrayList<CustomerBean>) request.getAttribute("customerlist");
%><%-- if(customerList!=null)
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

<form action="<%= request.getContextPath() %>/UserController" method="get" name="searchcustomer" onsubmit="return validatego()">
<h1><center><font color=""> Showing Details Of Required Customers</font></center></h1>
<input type="hidden" name="source" value="searchcustomer">
Searchby:
            <select id="searchby" name="searchby" onchange="configureDropDownLists1(this,'drop');">
  <option value="Select">Select</option>
  <option value="Id">Id</option>
    <option value="City">City</option>
      <option value="Location">Location</option>
  <option value="Status">Status</option>
</select>
 
           <select id="drop" name="drop" onchange="validatedrop()">
 </select><span id="st_error" style="color:red ">

<!--</select><span id="se_error" style="color:red "></span>
 <select id="locu" style="display: none" name="loc" onblur="validatesearchlocation()">
<option value="Select">Select</option>
<option value="Delhi">Delhi</option>
<option value="Trivandrum">Trivandrum</option>
<option value="Kolkata">Kolkata</option>
<option value="Mumbai">Mumbai</option>
</select><span id="l_error" style="color:red "></span>

  <select id="location" for="location" style="display: none;">EnterLocation:</label>
 
<select id="City" style="display: none" name="City" onblur="validatesearchcity()">
<option value="Select">Select</option>
<option value="Delhi">Delhi</option>
<option value="Trivandrum">Trivandrum</option>
<option value="Kolkata">Kolkata</option>
<option value="Mumbai">Mumbai</option>
</select><span id="l_error" style="color:red "></span>
    
 	<label id="Id" for="Id" style="display: none;">EnterId:</label>
 <input type="text" name="Id" style="display: none;" onblur="validatesearchid()"><span id="id_error" style="color:red "></span>


	<label id="city" for="city" style="display: none;">EnterCity</label>

   <select id="Status" style="display: none" name="Status"onblur="validatesearchstatus()">
<option value="Select">Select</option>
<option value="active">active</option>
<option value="deactive">deactive</option>
</select><span id="l_error" style="color:red "></span>
    -->
   

	<!-- <label id="status" for="status"style="display: none;" >EnterStatus</label> 
	 
 	<label id="Id" for="Id" style="display: none;">EnterId:</label>
 <input type="text" name="Id" style="display: none;" onblur="validatesearchid()"><span id="id_error" style="color:red "></span>
	
	<select id="location" name="location"></select>-->
         <label id="Id" for="Id" style="display: none;">EnterId:</label>
 <input type="text" name="Id" style="display: none;" onblur="validatesearchid()"><span id="id_error" style="color:red "></span>
         
<input type="submit" value="Go" id="shiny">

<%-- <table border="2" class="CSSTableGenerator">
				<tr>
						<td>FirstName</td>
						<td>LastName</td>
						<td>Gender</td>
						<td>PhoneNumber</td>
						<td>City</td>
						<td>Location</td>
						<td>DateOfBirth</td>
						<td>EmailAddress</td>
						<td>CustomerId</td>
						<td>Status</td>
					</tr>
					
					<%
						ArrayList<CustomerBean> customerList = (ArrayList<CustomerBean>) request.getAttribute("customerlist");
						for (CustomerBean b : customerList) {
					%>
					<tr>
						<td><%=b.getFirstname()%></td>
						<td><%=b.getLastname()%></td>
						<td><%=b.getGender()%></td>
						<td><%=b.getPhoneno()%></td>
						<td><%=b.getCity()%></td>
						<td><%=b.getLocation()%></td>
						<td><%=b.getDob()%></td>
						<td><%=b.getEmail()%></td>
						<td><%=b.getCustomerid()%></td>
						<td><%=b.getStatus()%></td>
					</tr>
					<%
			}
					%>
				</table> --%>			
 <display:table name="customerlist" sort="list" pagesize="10" id="table1"
		export="true"  class="CSSTableGenerator" requestURI="UserController">
		
		 <display:column property="fullname" sortable="true" title= "Full Name"  ></display:column>
		 <display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>
		<%--<display:column property="lastname" sortable="true" title="Last Name"></display:column> --%>
		<display:column property="phoneno" sortable="true" title="Phone Number"></display:column>
		<display:column property="city" sortable="true" title="City"></display:column>
		<display:column property="location" sortable="true" title="Location"></display:column>
<%-- 		<display:column property="email" sortable="true" title="Email"></display:column>
 --%>		<display:column property="customerid" sortable="true" title="Customer_Id"></display:column>
    <display:column title="View"> <a href="<%= request.getContextPath() %>/UserController?source=viewbyid&&id=${table1.customerid}" ><input type="button" value="View" id="shiny" /></a></display:column>
    </display:table>
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