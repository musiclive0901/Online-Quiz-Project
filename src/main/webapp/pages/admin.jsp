<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "d" %>
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

table, th, td {
  border: 1px solid black;
}

</style>
</head>
<body>



<div class="topnav">
  <a href="pages/home.jsp">HOME</a>
  <a href="pages/login.jsp">LOGIN</a>
  <a href="pages/studentregister.jsp">REGISTER</a>
  <a href="pages/feedback.jsp">FEEDBACK</a>
   <a href="pages/contact.jsp">CONTACT US</a>
   <a id = "pages/admin.jsp" class="hidden_link">ADMIN</a>
</div>

<div align = "right">
	<form action="<%= request.getContextPath() %>/logout" method="post">
	<p>Hello, <%
	session = request.getSession(false);
	String username = (String) session.getAttribute("username");
	out.print(username);
	%>
	<input type="submit" value="Logout" >
	</form>
	<br/>
</div>

<div align = "center">
 <a href="<%= request.getContextPath() %>/admin_result_list">VIEW RESULT LIST</a> <br/>
  <a href="<%= request.getContextPath() %>/admin_user">VIEW USER LIST</a> <br/>
  <a href="<%= request.getContextPath() %>/admin_question">VIEW QUESTION LIST</a> <br/>
</div>



</body>
</html>