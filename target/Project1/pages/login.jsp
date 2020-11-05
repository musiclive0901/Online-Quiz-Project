<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <a href="home.jsp">HOME</a>
  <a href="login.jsp">LOGIN</a>
  <a href="studentregister.jsp">REGISTER</a>
  <a href="feedback.jsp">FEEDBACK</a>
   <a href="contact.jsp">CONTACT US</a>
</div>




<div align="center">
	<p>${param.messageLogin}</p>
</div>

<c:if test="${not empty message}">
    <p style="color:red">${message}</p>>
</c:if>

<div align="center">
  <h1>Student Login</h1>
  <form action="<%= request.getContextPath() %>/login" method="post">
   <table style="with: 80%">
    <tr>
     <td>Username</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" /></td>
    </tr>
   </table>
   <input type="submit" value="Submit" />
  </form>
 </div>
 
</body>
</html>