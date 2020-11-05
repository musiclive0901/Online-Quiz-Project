<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Form</title>

    <link rel="stylesheet" type="text/css" href="../css/newStyle.css" />
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
  <h1>Feedback Form</h1>
  <form action="<%= request.getContextPath() %>/feedback" method="post">
   <table style="with: 80%">
    <tr>
     <td>Rating</td>
     <td><input type="number" id="rating" name="rating" min="1" max="5"></td>
    </tr>
    <tr>
     <td>Message</td>
     <td><input type="text" name="message" /></td>
    </tr>
   </table>
   <input type="submit" value="Submit" />
  </form>
 </div>
</body>
</html>