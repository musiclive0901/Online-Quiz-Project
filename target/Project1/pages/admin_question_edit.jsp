<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Question Page</title>
    <link rel="stylesheet" type="text/css" href="../css/newStyle.css" />
    <%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
    <script src="jquery-3.5.1.min.js"></script>
    <style>
		.hidden_link{
			visibility:hidden;
		}
		.admin_link{
		  visibility: visible;
		}
	</style>
</head>
<body>

<div class="topnav">
  <a href="home.jsp">HOME</a>
  <a href="login.jsp">LOGIN</a>
  <a href="studentregister.jsp">REGISTER</a>
  <a href="feedback.jsp">FEEDBACK</a>
  <a href="<%= request.getContextPath() %>/contact">CONTACT US</a>
   <a id = "admin_access" href= "admin.jsp" class="hidden_link">ADMIN</a>
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


<script>
var value = "<%=user%>";
console.log(value);
if(value == "admin"){
	document.getElementById("admin_access").className = "admin_link";
}
</script>

<div align="center">
  <h1>Edit Question Form</h1>
  <form action="<%= request.getContextPath() %>/admin_question_edit" method="post">
   <table style="with: 80%">
    <tr>
     <td>Question ID</td>
     <td><input type="text" name="questionID" /><%
		out.print((String)request.getAttribute("question_id"));%></td>
    </tr>
    <tr>
     <td>Question</td>
     <td><input type="text" name="questionContxt" /><%
		out.print((String)request.getAttribute("question_context_update"));%></td>
    </tr>
    <tr>
     <td>Option A</td>
     <td><input type="text" name="optionAUpdated" /><%
		out.print((String)request.getAttribute("optionA_updated"));%></td>
    </tr>
    <tr>
     <td>Option B</td>
     <td><input type="text" name="optionBUpdated" /><%
		out.print((String)request.getAttribute("optionB_updated"));%></td>
    </tr>
    <tr>
     <td>Option C</td>
     <td><input type="text" name="optionCUpdated" /><%
		out.print((String)request.getAttribute("optionC_updated"));%></td>
    </tr>
    <tr>
     <td>Option D</td>
     <td><input type="text" name="optionDUpdated" /><%
		out.print((String)request.getAttribute("optionD_updated"));%></td>
    </tr>
    <tr>
     <td>Correct Answer</td>
     <td><input type="text" name="correctUpdated" /><%
		out.print((String)request.getAttribute("correctAnswer_updated"));%></td>
    </tr>
   </table>
   <input type="submit" value="Submit" />
  </form>
 </div>
</body>
</html>