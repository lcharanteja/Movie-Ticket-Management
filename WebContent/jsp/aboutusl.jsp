<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/layout.css" type="text/css" />
<% response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");%>
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
      <li><a href="<%= request.getContextPath() %>/UserController?source=aboutusl">About us</a></li>
 
   </ul>
  </div>
</div>

<div class="wrapper col3">
  <div id="gallery">
<form action="#" method="post" >

<h1 align="center" style="color:#3D1400;"><b><u>TVM CINEMAS</u></b></h1><br>
<h3 style="color:#3D1400;"><b>The Vision:</b></h3>
<p align="justify">The Company's long-term vision is to excel in the retail entertainment domain to maintain its leadership position in the cinema exhibition business. TVM Cinemas shall continue to redefine the cinema viewing experience to movie connoisseurs with an aim to provide world-class immersive viewing. TVM Cinemas will strive to bring new allied retail entertainment concepts to India to provide a holistic entertainment experience to its patrons  </p><br>
<h3 style="color:#3D1400;"><b>We Believe:</b></h3>
<p align="justify">Watching the movie we say is only the beginning of the magical experience... We not only flash the best movies ever made on our screens but we ensure that movie buffs view them in style in recliners, massage chairs and customer service fit for a king. We love cinema and so does India. Hence, our launch plans are ambitious and nationwide! We are one of the largest Exhibition theatre chains in India with 34 properties, 123 screens and 20,133 seats. We believe we are one of the dominant players in Trivandrum which is home to the Indian Film industry hosting all types of films in all the dominant languages.</p><br>
<h3 style="color:#3D1400;"><b>The Journey:</b></h3>
<p align="justify"> The Company pioneered the multiplex revolution in the country by establishing the first multiplex cinema in 1997 at Trivandrum. The opening of the first multiplex heralded a new era in the Indian cinema viewing experience, which also set a role model for others to follow suit. TVM Cinemas has set new benchmarks in the cinema exhibition business including establishment of the first largest 11 screen multiplex in the country, Gold Class Cinema, luxury cinema, IMAX theatres and ECX (Enhanced Cinema Experience).</p>
<p align="justify">In January 2013 the Company acquired 93.19% of controlling stake in TVM Cinemas, a Cinema Exhibition Company having 98 Screens spread across 34 locations in India, through its wholly owned subsidiary Filmy Hospitality Private Limited to become the undisputed leader in the cinema exhibition business in India. Post aforesaid acquisition TVM Cinemas together with Filmy-Max currently operates a cinema circuit consisting of 445 screens spread across 101 cinemas covering 43 cities in India. In FY 2012-13, TVM Cinemas successfully entertained 55 million esteemed patrons through its cinemas. The TVM-Filmy brand is poised to entertain over 70 million premium viewers in the year 2013-14.Today TVM Cinemas is the dominant leader with 30-35% share of box office collections for Hollywood movies in India & 20-25% share of Bollywood movies.</p><br>

<ul>
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