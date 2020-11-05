<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Question Page</title>
    <link rel="stylesheet" type="text/css" href="css/newStyle.css" />
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
  <h1>Edit Question Form</h1>
  <form action="<%= request.getContextPath() %>/admin_question_edit" method="post">
   <table style="with: 80%">
    <tr>
     <td>Question ID</td>
     <td>
     <input type="text" id="questionID" name="questionID" placeholder="<%
	session.getAttribute("questionIdx");%>"/>
     <p> </p>
		</td>
    </tr>
    <tr>
     <td>Question</td>
     <td>
     <label for="questionContxt"> <%
		request.getAttribute("question_context_update");%></label>
     <input type="text" id="questionContxt" name="questionContxt" />
    </td>
    </tr>
    <tr>
     <td>Option A</td>
     <td>
     <label for="optionAUpdated"><%
		 request.getAttribute("optionA_updated");%></label>
     <input type="text" id = "optionAUpdated" name="optionAUpdated" />
     </td>
    </tr>
    <tr>
     <td>Option B</td>
     <td>
     <label for="optionBUpdated"> <%
		request.getAttribute("optionB_updated");%></label>
     <input type="text" id="optionBUpdated" name="optionBUpdated" />
    </td>
    </tr>
    <tr>
     <td>Option C</td>
     <td>
      <label for="optionCUpdated"><%
		request.getAttribute("optionC_updated");%></label>
     <input type="text" id="optionCUpdated" name="optionCUpdated" /></td>
    </tr>
    <tr>
     <td>Option D</td>
     <td>
      <label for="optionDUpdated"> <%
		request.getAttribute("optionD_updated");%></label>
     <input type="text" id="optionDUpdated" name="optionDUpdated" />
    </td>
    </tr>
    <tr>
     <td>Correct Answer</td>
     <td>
      <label for="correctUpdated"><%
		request.getAttribute("correctAnswer_updated");%></label>
     <input type="text" id="correctUpdated" name="correctUpdated" />
		</td>
    </tr>
   </table>
   <input type="submit" value="Submit" />
  </form>
 </div>
</body>
</html>