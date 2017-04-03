<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.tcs.ilp.mas.bean.CustomerBean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/layout.css" type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/navigation.css"
	type="text/css" />
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
						<a
							href="<%=request.getContextPath()%>/UserController?source=logout"><font size="3" color="#FFFFFF" style="text-decoration: underline;">Logout</font></a>
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
				<li><a
					href="<%=request.getContextPath()%>/UserController?source=adminlogin">Home</a></li>
				<li>&#187;</li>
				<li><a
					href="<%=request.getContextPath()%>/UserController?source=activatecustomer">ActivateCustomer</a></li>
			</ul>
		</div>
	</div>
	<div class="wrapper col3">
		<div id="gallery1">
<%
ArrayList<CustomerBean> customerList = (ArrayList<CustomerBean>) request.getAttribute("customerlist");
if(!customerList.isEmpty())
{
%>

			<form action="<%=request.getContextPath()%>/UserController" method="get" >
			<h1><center><font color=""> Showing Details Of Required Customers</font></center></h1>
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
						<td>ClickToDeactivate</td>
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
						<td><a
							href="<%=request.getContextPath()%>/UserController?source=deactivated&&email=<%=b.getEmail()%>"><input type="button" id="shiny" value="Deactivate"></input></a></td>
					</tr>
					<%
			}
					%>
				</table> --%>
				
				<div style="width: 100%;">
				<display:table name="customerlist" sort="list" pagesize="10" id="table1"
		export="true"  class="CSSTableGenerator" requestURI="UserController">		
				 <display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>
		
		 <display:column property="fullname" sortable="true" title= "Full Name"  ></display:column>

		<display:column property="phoneno" sortable="true" title="Phone Number"></display:column>
		<display:column property="city" sortable="true" title="City"></display:column>
		<display:column property="location" sortable="true" title="Location"></display:column>
		<display:column property="email" sortable="true" title="Email"></display:column>
		<display:column property="customerid" sortable="true" title="Customer_Id" ></display:column>
    <display:column title="View"> <a href="<%= request.getContextPath() %>/UserController?source=viewbyemailid&&id=${table1.email}" ><input type="button" value="View" id="shiny" /> </a></display:column>
    </display:table>
				
			</form>
			</div>
			<%} else{ %>
<h3 style="color:#336666 ; text-align:center; "><b> &#10006; Sorry... There are no customers who are deactive </b></h3><br> <br>
      <form action="<%=request.getContextPath()%>/UserController" method="get" name="retry">
      <input type="hidden" name="source" value="adminlogin">
      <div align="center">
      <input id="shiny" align="middle" type="submit" value="Home">
      </div>
      </form>
      <%} %>

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