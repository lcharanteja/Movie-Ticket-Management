<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/layout.css" type="text/css" />
</head>
<body>
<h2> <center> Price Per Ticket </center> </h2>
<div class="wrapper col3">
<form action="#" method="post" >
<table class="CSSTableGenerator">

<tr> <th> Screen </th>
<th> Screen Type  </th> 
<th> Price for Gold </th>
<th> Price for Silver </th>

<tr> <th> 1 , 2 </th>
 <th> Mega</th>
<th> Rs. 400 </th> 
<th> Rs. 300</th>
</tr>

<tr> <th> 3, 4</th>
<th> Mini </th>
<th> Rs. 200 </th>
<th> Rs. 100 </th> </tr>
</table>
</form>

</div>
</body>
</html>