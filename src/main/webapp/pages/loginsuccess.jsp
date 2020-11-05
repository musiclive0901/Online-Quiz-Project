<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success Page</title>
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

<%! int choice =1; %>

<a id="mathChoice" href="<%= request.getContextPath() %>/question">
	<% choice = 1; %>	
	<img src="${pageContext.request.contextPath}/images/math.jpg" width="150px" height="150px">
</a>
<a id = "physicsChoice" href="<%= request.getContextPath() %>/question">
	<% choice = 2; %>	
	<img src="${pageContext.request.contextPath}/images/physics.jpg" width="150px" height="150px">
</a>

<a id="chemistryChoice" href="<%= request.getContextPath() %>/question">
	<% choice = 3; %>	
	<img src="${pageContext.request.contextPath}/images/chemistry.jpeg" width="150px" height="150px">
</a>
<script>
	$('#mathChoice').click( function() { 
		<%
		Date date_math = new Date();
		String start_math = date_math.toString();
		session.setAttribute("start_time", start_math);
		session.setAttribute("quizname", "Math Quiz");
		session.setAttribute("choice", 2);
		session.setAttribute("duration",15);
		session.setAttribute("reset", true);
		%>
		} );
</script>


<script>
	$('#physicsChoice').click( function() { 
		<%
		Date date_physics = new Date();
		String start_physics = date_physics.toString();
		session.setAttribute("start_time", start_physics);
		session.setAttribute("quizname", "Math Quiz");
		session.setAttribute("choice", 2);
		session.setAttribute("duration",15);
		session.setAttribute("reset", true);
		%>
		} );
</script>


<script>
	$('#chemistryChoice').click( function() { 
		<%
		Date date_chem = new Date();
		String start_chem = date_chem.toString();
		session.setAttribute("start_time", start_chem);
		if(session.getAttribute("quizname") != null){
			session.removeAttribute("quizname");
		}
		session.setAttribute("quizname", "Math Quiz");		
		if(session.getAttribute("choice") != null){
			session.removeAttribute("choice");
		}
		session.setAttribute("choice", 2);
		session.setAttribute("duration",15);
		session.setAttribute("reset", true);
		%>
		} );
</script>


</body>
</html>