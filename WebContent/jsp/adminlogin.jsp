<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<% response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");%>
</head>
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
      
    </ul>
  </div>
</div>


<div class="wrapper col3">
  <div id="gallery">
    <ul>
      <li class="placeholder" style="background-image:url(<%=request.getContextPath() %>/images/e.jpg); ">images Holder</li>
      <li><a class="swap" href="#"><img src="<%=request.getContextPath() %>/images/b.jpg" alt="" /><span><img src="<%=request.getContextPath() %>/images/b.jpg" width="950" height="370" alt="" /></span></a></li>
      <li><a class="swap" href="#"><img src="<%=request.getContextPath() %>/images/c.jpg" alt="" /><span><img src="<%=request.getContextPath() %>/images/c.jpg" width="950" height="370" alt="" /></span></a></li>
      <li><a class="swap" href="#"><img src="<%=request.getContextPath() %>/images/d.jpg" alt="" /><span><img src="<%=request.getContextPath() %>/images/d.jpg" width="950" height="370" alt="" /></span></a></li>
      <li><a class="swap" href="#"><img src="<%=request.getContextPath() %>/images/e.jpg" alt="" /><span><img src="<%=request.getContextPath() %>/images/e.jpg" width="950" height="370" alt="" /></span></a></li>
      <li class="last"><a class="swap" href="#"><img src="<%=request.getContextPath() %>/images/f.jpg" alt="" /><span><img src="<%=request.getContextPath() %>/images/f.jpg" width="950" height="370" alt="" /></span></a></li>
    </ul>
  </div>
</div>
<div class="wrapper col4">
  <div id="services">
    <ul>
      <li><a href="#"><strong>FastAndFurious</strong><img src="<%=request.getContextPath() %>/images/a.jpg" alt="" /></a></li>
      <li><a href="#"><strong>HOBBIT</strong><img src="<%=request.getContextPath() %>/images/g.jpg" alt="" /></a></li>
      <li><a href="#"><strong>STARTREK</strong><img src="<%=request.getContextPath() %>/images/h.jpg" alt="" /></a></li>
      <li class="last"><a href="#"><strong>PUBLICENEMIES</strong><img src="<%=request.getContextPath() %>/images/i.jpg" alt="" /></a></li>
      <li><a href="#"><strong>WOLVERINE</strong><img src="<%=request.getContextPath() %>/images/j.jpg" alt="" /></a></li>
      <li><a href="#"><strong>AVENGERS</strong><img src="<%=request.getContextPath() %>/images/k.jpg" alt="" /></a></li>
      <li><a href="#"><strong>CAPTAIN AMERICA</strong><img src="<%=request.getContextPath() %>/images/l.jpg" alt="" /></a></li>
      <li class="last"><a href="#"><strong>HARRY POTTER</strong><img src="<%=request.getContextPath() %>/images/m.jpg" alt="" /></a></li>
    </ul>
    <br class="clear" />
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