<%@page import="com.tcs.ilp.mas.bean.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TVM CINEMAS</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/navigation.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/tablemovies.css" type="text/css" />
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
      <li><a href="<%= request.getContextPath() %>/MultiplexController?source=adminlogin">Home</a></li>
      <li>&#187;</li>
      <li><a href="<%= request.getContextPath() %>/MovieController?source=addmovie">AddMovie</a></li>	
    </ul>
  </div>
</div>


<div class="wrapper col3">
  <div id="gallery1">

<% MovieBean mBean = new MovieBean();
mBean = (MovieBean) request.getAttribute("mBean");
MovieBean mb = (MovieBean) request.getAttribute("mBean1");
if(mb == null && mBean == null)
{
%>  
      
      <h3 style="color: red; text-align:center; "><b> &#10006; Oops!!! something went wrong. Please try again </b></h3><br> <br>
      <form action="<%=request.getContextPath()%>/MovieController" method="get" name="retry">
      <input type="hidden" name="source" value="addmovie">
      <div align="center">
      <input id="shiny" align="middle" type="submit" value="Retry add movie">
      </div>
      </form>
      <%} 

else if(mBean !=null)
{
%>
<div style="width: 700px; margin-left: 0px" align="left" >
<ul><font color="red"></font> 
<h3 style="color: green; text-align: center;"><b> &#10004; Hurray!!!You have successfully added the movie.</b></h3>
<form action="<%=request.getContextPath()%>/MovieController" method="get" name="viewmovieafteradding">
<div class="CSSTableGenerator" style="width: 800px; margin-left: 200px" align="center">
               
                <table style="text-align: center;" align="center">
                   
                    
                        <tr>
                        <td >
                           MOVIE ID:
                        </td>
                        <td>
                            <%= mBean.getMovieId()%>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            MOVIE NAME:
                        </td>
                        <td>
                            <%=mBean.getName() %>
                        </td>
                   </tr>
                    <tr>
                        <td >
                            MOVIE LANGUAGE:
                        </td>
                        <td>
                            <%=mBean.getLanguage() %>
                        </td>
                        
                    </tr>
                    <tr>
                        <td >
                            MOVIE DURATION:
                        </td>
                        <td>
                            <%=mBean.getDuration() %>
                        </td>
                        
                    </tr>
                    <tr>
                        <td >
                            MOVIE BEGIN DATE:
                        </td>
                        <td>
                            <%=mBean.getBeginDate() %>
                        </td>
                        
                    </tr>
                    <tr>
                        <td >
                            MOVIE END DATE:
                        </td>
                        <td>
                            <%=mBean.getEndDate() %>
                        </td>
                        
                    </tr>
                    <tr>
                        <td >
                            MOVIE SHOW:
                        </td>
                        <td>
                            <%=mBean.getShow()%>
                        
                        </td>
                        
                    </tr>
                    <tr>
                        <td >
                            MOVIE SCREEN:
                        </td>
                        <td>
                            <%=mBean.getScreen() %>
                        </td>
                        
                    </tr>
                    <tr>
                        <td >
                            MOVIE IMAGE:
                        </td>
                        <td>
                            <img src="<%= request.getContextPath() %>/ImageController?source=image&&id=<%= mBean.getMovieId() %>" width="150px" height="150px">
                        </td>
                   </tr>
                       
                </table>
                <input type="hidden" name="source" value="addmovie">
                 <p align="center"><input id="shiny" type="submit" value="Add More Movies">
                  </p>
            </div>   
                 </form>
         
        </ul>
        </div>
  <%}

else
{
%>  
    
      <h3 style="color: red; text-align: center;"><b> &#10006; Oops!!! something went wrong. Please try again </b></h3><br> <br>
      <form action="<%=request.getContextPath()%>/MovieController" method="get" name="retry">
      <input type="hidden" name="source" value="addmovie">
      <div align="center">
      <input id="shiny" align="middle" type="submit" value="Retry add movie">
      </div>
      </form>
      </div>      <%} %>
      
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