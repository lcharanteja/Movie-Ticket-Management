<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tcs.ilp.mas.bean.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>TVM CINEMAS</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/navigation.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/javascript.js"></script>
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
      <li>Update movie</li>
    </ul>
  </div>
</div>
<% MovieBean mBean = new MovieBean();
mBean = (MovieBean) request.getAttribute("mBeanUpdate");
ArrayList<String> lList = new ArrayList<String>();
lList = (ArrayList<String>) request.getAttribute("languageList");
ArrayList<Integer> sList = new ArrayList<Integer>();
sList.add(1);
sList.add(2);
sList.add(3);
for(int k=0;k<sList.size();k++){
if(sList.get(k)==mBean.getScreen())
{
	sList.remove(k);
}
}

ArrayList<String> show = new ArrayList<String>();
show.add("M");
show.add("A");
show.add("E");
for(int j=0;j<show.size();j++){
if(show.get(j).equalsIgnoreCase(mBean.getShow()))
{
	show.remove(j);
}
}

%>
  <% java.util.Date date = new java.util.Date();
  	java.sql.Date date1 = new java.sql.Date(date.getTime());
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String str = "2015-12-31";
     java.util.Date date2 = new java.util.Date();
      try 
      {
	       date = sdf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     
 java.sql.Date date3 = new java.sql.Date(date.getTime());
  	%>
<div class="wrapper col3">
  <div id="gallery">

<form action="<%=request.getContextPath()%>/MovieController" method="get" name="update" onsubmit="return validateUpdateMovie()">
 
 <input type="hidden" name="id" value=<%=mBean.getMovieId()%>></input>
<ul><font color="red">* marked fields are mandatory</font>    
          
          <table border="0" class="CSSTableGenerator" >
         <tr><td style="color: black">ID<sup style="color: red">*</sup>:</td>
            <td><input id="fullname" value=<%=mBean.getMovieId()%> disabled="disabled"  type="text"/></td></tr>
         
 <tr><td style="color: black">Name<sup style="color: red">*</sup>:</td>
            <td><input id="fullname" name="name" value="<%=mBean.getName() %>" type="text" onblur="validateMovieName()" /><span id="mname_error" style="color: red" ></span></td></tr>
 			<tr><td style="color: black">Language<sup style="color: red">*</sup>:</td>
            <td><label>
            <select name="language" onblur="validateMovieLanguageU()">
            <option value=<%=mBean.getLanguage() %>><%=mBean.getLanguage() %></option>
            <% for(String s:lList) {%>
            <option value=<%=s %>><%=s %></option>
            <%} %>
</select><span id="lang_error" style="color: red" ></span></label>
</td></tr>
 			
   
 			<tr><td style="color: black">Duration<sup style="color: red">*</sup>:</td>
            <td ><label><input type="text" name="duration" value=<%=mBean.getDuration() %>></input><span id="d_error" style="color: red" ></span></label>
</td></tr>
 			<tr><td style="color: black">Show<sup style="color: red">*</sup>:</td>
            <td><label><select name="show" onblur="validateShowU()">
   <option value=<%=mBean.getShow() %>><%=mBean.getShow() %></option>
   <% for(String s:show) {%>
            <option value=<%=s %>><%=s %></option>
            <%} %>

</select><span id="s_error" style="color: red" ></span></label>
</td></tr>
 <tr><td style="color: black">BeginDate<sup style="color: red">*</sup>: <font color="#6E6E6E"> (mm/dd/yyyy)</font></td>
            <td><input id="fullname" name="begindate" type="date" value=<%=mBean.getBeginDate() %> max=<%=date3 %> onblur="validateBdateU()" /><span id="b_error" style="color: red" ></span></td></tr>
 <tr><td style="color: black">EndDate<sup style="color: red">*</sup>: <font color="#6E6E6E"> (mm/dd/yyyy)</font></td>
            <td><input id="fullname" name="enddate" type="date" value=<%=mBean.getEndDate() %> max=<%=date3 %> onblur="validateEdateU()" /><span id="e_error" style="color: red" ></span></td></tr>

 			<tr><td style="color: black">Screen<sup style="color: red">*</sup>:</td>
            <td><label><select name="screen" onblur="validateScreenU()">
   <option value=<%=mBean.getScreen()%>><%= mBean.getScreen() %></option>
  <% for(int i=0;i<sList.size();i++) {%>
            <option value=<%=sList.get(i) %>><%=sList.get(i)%></option>
            <%} %>
</select><span id="sc_error" style="color: red" ></span></label>
</td></tr>

  <tr style="height: 100px"><td>Movie image <font color="red">(in jpeg format of size upto 1MB): <img src="<%= request.getContextPath() %>/ImageController?source=image&&id=<%= mBean.getMovieId() %>" width="100px" height="100px"> </td>
  <td style="color: black;"><input type="file" id="movieimage" name="movieimage" ><br> 
  <sup style="color: red">*</sup> <h6 style="color: red; font-size: 13px">click here if you need to change the movie image</h6> </td></tr>
          
         <tr><td colspan="2"> 
            <input id="shiny" name="source" type="submit" value="Update Movie" style="margin-left: 320px"/>
            &nbsp; &nbsp; &nbsp;
            <input id="shiny" name="reset" type="reset" value="Reset" onclick="window.location.reload()" />
          </td></tr></table>    
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