<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/javascript.js"></script>
<style type="text/css">
		* { margin: 0; outline: none; }
		body { background-color: #444444; }
		.c { clear: both; }
		#wrapper { margin: 0 auto; padding: 0 40px 60px 40px; width: 960px; }
		h2 { padding: 20px 0 10px 0; font-size: 24px; line-height: 40px; font-weight: normal; color: #adc276; text-shadow: 0 1px 3px #222222; }
	</style>

	<!-- sliderman.js -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/sliderman.1.3.8.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/sliderman.css" />
	<!-- /sliderman.js -->
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

<div class="wrapper col2">
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
<div id="gallery">
<li>
<div id="wrapper">

		<div id="examples_outer">
			

			<div id="slider_container_1">

				<div id="SliderName">
<% ArrayList<Integer> idList = (ArrayList<Integer>) request.getAttribute("idlist");
System.out.println(idList.get(2));

for(int i=0; i< idList.size();i++)
{
%>
					
					<a href="#1">
					
						<img src="<%= request.getContextPath() %>/ImageController?source=image&&id=<%= idList.get(i) %>" title="Description from Image Title" />
					</a>
<%} %>					
					
					<div class="SliderNameDescription"><strong>Nullam nec velit vel leo tristique commodo.</strong><br />Nulla facilisi. Fusce lacus massa, ullamcorper sed hendrerit quis, venenatis eget tortor.</div>
				</div>
				<div class="c"></div>
				<div id="SliderNameNavigation"></div>
				<div class="c"></div>

				<script type="text/javascript">

					// we created new effect and called it 'demo01'. We use this name later.
					Sliderman.effect({name: 'demo01', cols: 10, rows: 5, delay: 10, fade: true, order: 'straight_stairs'});

					var demoSlider = Sliderman.slider({container: 'SliderName', width: 550, height: 300, effects: 'demo01',
					display: {
						pause: true, // slider pauses on mouseover
						autoplay: 3000, // 3 seconds slideshow
						always_show_loading: 200, // testing loading mode
						description: {background: '#ffffff', opacity: 0.5, height: 50, position: 'bottom'}, // image description box settings
						loading: {background: '#000000', opacity: 0.2, image: 'img/loading.gif'}, // loading box settings
						buttons: {opacity: 1, prev: {className: 'SliderNamePrev', label: ''}, next: {className: 'SliderNameNext', label: ''}}, // Next/Prev buttons settings
						navigation: {container: 'SliderNameNavigation', label: '&nbsp;'} // navigation (pages) settings
					}});

				</script>

				<div class="c"></div>
			</div>
			<div class="c"></div>
		</div>

		<div class="c"></div>
	</div>
</li>

 <%--  <marquee width="750 px">
  <a href="#" onMouseOver="document.myImage.src=image2.src;"
            onMouseOut="document.myImage.src=image1.src;">
<img name="myImage" src="<%=request.getContextPath()%>/images/a.jpg" />
</a>
</marquee> --%>


<form class="form-container" action="<%=request.getContextPath()%>/UserController" method="post" name="login" onsubmit="return validateLogin()">
<input type="hidden" name="source" value="signin">

<div class="form-title"><h2>Sign in</h2> </div>

<div class="form-title1" >All fields are mandatory </div><br></br>

<div class="form-title" >Email id &nbsp;&nbsp;&nbsp;<span id="u_error" style="color: red" ></span></div>
<input class="form-field" id="userid" name="email" type="text" onblur="validateUserId()" class="form-field" placeholder="abc@gmail.com"><br />
<div class="form-title">Password &nbsp;&nbsp;&nbsp;<span id="p_error" style="color: red" ></span></div>
<input class="form-field" id="password" name="password" type="password"  placeholder="password" onblur="validatePassword()"><br><br />
<div class="submit-container">
<input class="submit-button" type="submit" value="Submit" />
<input class="submit-button" type="reset" onclick="myFunction()">
</div>

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