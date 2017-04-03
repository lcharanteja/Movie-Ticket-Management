<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/javascript.js"></script>
<script type="text/javascript">

if(document.images){
   
	var image1 = new Image();      // Preload an image
    image1.src = "<%=request.getContextPath() %>/images/a.jpg";
    var image2 = new Image();      // Preload second image
    image2.src = "<%=request.getContextPath() %>/images/b.jpg";
}

</script>

</head>
<body id="top">
<div class="wrapper col1">
  <div id="topbar">
    <div id="search">
      <form action="#" method="post">
        <fieldset>
          <a href="<%=request.getContextPath()%>/UserController?source=login"><font size="3" color="#FFFFFF" style="text-decoration: underline;">Login</font></a>
          &nbsp;
          <a href="<%=request.getContextPath()%>/UserController?source=registration"><font size="3" color="#FFFFFF" style="text-decoration: underline;">Registration</font></a>
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
      <li class="last"><a href="<%= request.getContextPath() %>/MultiplexController?source=aboutus">About us</a></li>
      <li><a href="<%= request.getContextPath() %>/MultiplexController?source=contactus">Contact us</a></li>
      
      <li> <a href="<%=request.getContextPath()%>/UserController?source=login">Book Ticket</a>
              </li>
      <li><a href="<%= request.getContextPath() %>/MovieController?source=upcomingmovie">Upcoming Movies</a>
        </li>
       <li><a href="<%=request.getContextPath() %>/MovieController?source=nowshowingmovie">Now Showing Movies</a>
       </li>
     
      <li class="active"><a href="<%=request.getContextPath() %>/MultiplexController?source=index">Home</a></li>
    </ul>
    <br class="clear" />
  </div>
</div>

<div class="wrapper col3">
  <div id="breadcrumb">
    <ul>
      <li class="first">You Are Here</li>
      <li>&#187;</li>
      <li><a href="<%=request.getContextPath() %>/MultiplexController?source=index">Home</a></li>
      <li>&#187;</li>
      <li><a href="<%=request.getContextPath()%>/UserController?source=login">login</a></li>	
    </ul>
  </div>
</div>


<div class="wrapper col3">
<div id="gallery1">
<%--  
  <marquee width="750 px">
  <a href="#" onMouseOver="document.myImage.src=image2.src;"
            onMouseOut="document.myImage.src=image1.src;">
<img name="myImage" src="<%=request.getContextPath()%>/images/a.jpg" />
</a>
</marquee> --%><center>
<h3 style="text-align: center;color: red;"><b>&#10006; Oops!!! Something went wrong. We regret for the failure </b></h3> <br>
<font color="red"><h3 style="text-align: center;color: red;">Email Id already exists</h3></font></center>
<div><center>
<form action="<%=request.getContextPath()%>/UserController">
<input type="hidden" name="source" value="registration">
<input type="submit" value="Try registering again" id="shiny">
</form></center>
</div>
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