<%@page import="com.tcs.ilp.mas.bean.TicketBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/layout.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/tables.css" type="text/css" />
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
      <li><a href="<%= request.getContextPath() %>/TicketController?source=bookedhistory">BookingHistory</a></li>
    </ul>
  </div>
</div>

<div class="wrapper col3" >
  <div id="gallery" >
  <h1 style="color: #336666"><center>Booked History</center></h1>
 
  	<%
  		ArrayList<TicketBean> ticketList= (ArrayList<TicketBean>)request.getAttribute("allTickets");
  		/* for(TicketBean tbean: ticketList){ */
  			if(!ticketList.isEmpty())
  			{
  	%>	
  	<display:table name="allTickets" sort="list" pagesize="10" id="allTickets"
		export="true"  class="CSSTableGenerator" requestURI="ViewController">
				 <display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>
		
		<display:column property="ticketID" sortable="true" title= "Ticket Id"  ></display:column>
		<display:column property="movieName" sortable="true" title="MovieName"></display:column>
		<display:column property="bookingDate" sortable="true" title="Booking Date"></display:column>
		<display:column property="screen" title="Screen"></display:column>
		<display:column property="show" title="Show"></display:column>
		<display:column property="classType" title="Class Type"></display:column>
		<display:column property="allocatedSeats" title="Allocated Seats"></display:column>
		</display:table>
		</div>
    

  		<%-- <td><%= tbean.getTicketID() %></td><td><%= tbean.getCustomerID()%></td><td><%= tbean.getBookingDate()%></td><td><%= tbean.getScreen()%></td><td><%= tbean.getShow()%></td><td><%= tbean.getNoOfTickets()%></td>
  		</tr>
  	<%
  		}
  	%>
  	</table> --%> 
  	   <%} else{ %>
  	   <b><h3 style="color: red; text-align: center;"> &#10006; Oops!!! It seems you had no booking history</h3></b><br>
  	   <h6 style="#336666; text-align: center;">Visit <b>TVM cinemas</b> soon to explore the world of entertainment</h6>
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