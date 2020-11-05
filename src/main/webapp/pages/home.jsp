<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
  <style>

.topnav {
  background-color: #333;
  overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>


<div class="topnav">
  <a href="home.html">HOME</a>
  <a href="login.jsp">LOGIN</a>
  <a href="studentregister.jsp">REGISTER</a>
  <a href="feedback.jsp">FEEDBACK</a>
  <a href="contact.jsp">CONTACT US</a>
</div>

<%! String user; %>
<div align = "right">
	<form action="<%= request.getContextPath() %>/logout" method="post">
	<p>Hello, <%
	session = request.getSession(false);
	String username = (String) session.getAttribute("username");
	user = username;
	out.print(username);
	%>
	<input type="submit" value="Logout" >
	</form>
	<br/>
</div>


<a href="pages/login.jsp">
	<img src="${pageContext.request.contextPath}/images/math.jpg" width="100px" height="100px">
</a>
<a href="pages/login.jsp">	
	<img src="${pageContext.request.contextPath}/images/physics.jpg" width="100px" height="100px">
</a>

<a href="pages/login.jsp">
	<img src="${pageContext.request.contextPath}/images/chemistry.jpeg" width="100px" height="100px">
</a>

 
</body>
</html>