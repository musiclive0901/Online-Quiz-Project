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
   <a id = "admin_access" href= "admin.jsp">ADMIN</a>
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



<div align="center">
  <h1>Add Question Form</h1>
  <form action="<%= request.getContextPath() %>/admin_question_add" method="post">
   <table style="with: 80%">
    <tr>
     <td>Question Category</td>
     <td>
     <select id="categoryText_add" name="categoryText_add">
		  <option value="1">PHYSICS</option>
		  <option value="2">MATH</option>
		  <option value="3">CHEMISTRY</option>
		</select>
     </td>
    </tr>
    <tr>
     <td>Question</td>
     <td><input type="text" name="questionContxt_add" /></td>
    </tr>
    <tr>
     <td>Option A</td>
     <td><input type="text" name="optionA_add" /></td>
    </tr>
    <tr>
     <td>Option B</td>
     <td><input type="text" name="optionB_add" /></td>
    </tr>
    <tr>
     <td>Option C</td>
     <td><input type="text" name="optionC_add" /></td>
    </tr>
    <tr>
     <td>Option D</td>
     <td><input type="text" name="optionD_add" /></td>
    </tr>
    <tr>
     <td>Correct Answer</td>
     <td><input type="text" name="correctUpdated_add" /></td>
    </tr>
   </table>
   <input type="submit" value="Submit" />
  </form>
 </div>
</body>
</html>