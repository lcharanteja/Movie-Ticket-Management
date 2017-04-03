<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Sliderman.js - Examples - Created by Devtrix.net</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta name="keywords" content="slideman, sliderman.js, javascript slider, jquery, slideshow, effects" />
	<meta name="description" content="Sliderman.js - will do all the sliding for you :)" />
	<style type="text/css">
		* { margin: 0; outline: none; }
		body { background-color: #444444; }
		.c { clear: both; }
		#wrapper { margin: 0 auto; padding: 0 40px 60px 40px; width: 960px; }
		h2 { padding: 20px 0 10px 0; font-size: 24px; line-height: 40px; font-weight: normal; color: #adc276; text-shadow: 0 1px 3px #222222; }
	</style>

	<!-- sliderman.js -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/sliderman.1.3.8.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/frontpage.css" />
	<!-- /sliderman.js -->
</div>
<body style="opacity:0.6">
	<div id="wrapper">

		<div id="examples_outer">
			

		

				<div id="SliderName">

					<a href="#1">
						<img src="<%=request.getContextPath()%>/images/x.jpg" title="Description from Image Title" />
					</a>
					<div class="SliderNameDescription">
						<img src="<%=request.getContextPath()%>/images/b.jpg" height="40" style="float:left;margin-right:5px;" />
						<strong>Nulla luctus congue fermentum.</strong><br />Integer <a href="javascript:void(0);">elementum</a> convallis lorem eu volutpat. Suspendisse fermentum arcu in lorem fringilla ultricies. Nam vel diam nisi.
					</div>
					<a href="#2">
						<img src="<%=request.getContextPath()%>/images/b.jpg" />
					</a>
					<img src="<%=request.getContextPath()%>/images/c.jpg" />
					<div class="SliderNameDescription"><a href="#3">Link</a></div>
					<img src="<%=request.getContextPath()%>/images/d.jpg" />
					<div class="SliderNameDescription"><strong>Nullam nec velit vel leo tristique commodo.</strong><br />Nulla facilisi. Fusce lacus massa, ullamcorper sed hendrerit quis, venenatis eget tortor.</div>
				</div>
				<div class="c"></div>
				<div id="SliderNameNavigation"></div>
				<div class="c"></div>

				<script type="text/javascript">

					// we created new effect and called it 'demo01'. We use this name later.
					Sliderman.effect({name: 'demo01', cols: 10, rows: 5, delay: 10, fade: true, order: 'straight_stairs'});

					var demoSlider = Sliderman.slider({container: 'SliderName', width: 1360, height: 570, effects: 'demo01',
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
</body>
</html>