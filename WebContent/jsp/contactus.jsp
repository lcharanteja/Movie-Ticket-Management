<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<title>TVM CINEMAS</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");%>
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
      <li><a href="<%= request.getContextPath() %>/MultiplexController?source=index">Home</a></li>
      <li>&#187;</li>
      <li><a href="<%= request.getContextPath() %>/MultiplexController?source=contactus">Contact us</a></li>	
    </ul>
  </div>
</div>



<div class="wrapper col3">
  <div id="gallery">
      <h1 align="center" style="color:#3D1400;"><b><u>TVM CINEMAS</u></b></h1><br>
  <ul>

<li>
<div id="wrapper col3" style="margin-left: 350px;">

		<div id="examples_outer">
			

			<div id="slider_container_1">

				<div id="SliderName">

					<a href="#1">
						<img src="<%=request.getContextPath()%>/images/2.jpg" title="Description from Image Title" />
					</a>
					<div class="SliderNameDescription">
						<img src="<%=request.getContextPath()%>/images/3.jpg" height="40" style="float:left;margin-right:5px;" />
						<strong>Nulla luctus congue fermentum.</strong><br />Integer <a href="javascript:void(0);">elementum</a> convallis lorem eu volutpat. Suspendisse fermentum arcu in lorem fringilla ultricies. Nam vel diam nisi.
					</div>
					<a href="#2">
						<img src="<%=request.getContextPath()%>/images/3.jpg" />
					</a>
					<img src="<%=request.getContextPath()%>/images/4.jpg" />
					<div class="SliderNameDescription"><a href="#3">Link</a></div>
					<img src="<%=request.getContextPath()%>/images/5.jpg" />
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
<form action="">
<h3 style="color:#3D1400; margin-right : 700px;"><b>Registered Office:</b></h3>
<p align="justify">TVM Cinemas,<br>
61, Kazhakuttom,<br>
Trivandrum, Kerala-689691<br>
INDIA</p><br>
<h3 style="color:#3D1400;"><b>Contact Details:</b></h3>
<p align="justify">website:www.tvmcinema.com<br>
Email:tvmcinemas@yahoo.com<br>
Contact No: 0471-252602<br>
</p>
<br>

   
</form>
</ul>
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