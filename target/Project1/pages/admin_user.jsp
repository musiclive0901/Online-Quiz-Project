<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="project1.domain.Student" %>
<%@ page import ="project1.dao.StudentDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin User Page</title>
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
	
	   <%
	    List<Student> studentList = (List<Student>) request.getAttribute("admin_user_list");
       %>
</head>
<body>

<div class="topnav">
  <a href="home.jsp">HOME</a>
  <a href="login.jsp">LOGIN</a>
  <a href="studentregister.jsp">REGISTER</a>
  <a href="feedback.jsp">FEEDBACK</a>
  <a href="<%= request.getContextPath() %>/contact">CONTACT US</a>
   <a id = "admin_access" href= "pages/admin.jsp" class="hidden_link">ADMIN</a>
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

		<table>
            <% 
            for(int i = 0; i < studentList.size(); i++) {
                Student user = studentList.get(i);
            %>
            <tr>
            	<th>Username</th>
            	<th>Full Name</th>
            	<th>Email</th>
            	<th>Phone Number</th>
      
            	<th>Status
            </tr>
            <tr>
               <td><p style="font-size:15px"><%=user.getUsername()%></p>
                <td><p style="font-size:15px"><%=user.getName()%></p>
                <td><p style="font-size:15px"><%=user.getEmail()%></p>
                <td><p style="font-size:15px"><%=user.getPhoneNum()%></p>
                <td>
                <p style="font-size:15px">Status: <%=user.getStatus()%></p><br/>
                <form action="<%= request.getContextPath() %>/admin_user" method="post">
				<input type="submit" id="active_btn" name ="active_btn" value="ACTIVE" >
				<input type="submit" id="suspend_btn" name="suspend_btn" value="SUSPEND"/>
				<input type="submit" id="disable_btn" name="disable_btn" value="DISABLE"/>
				</form>
                <td>
            <tr>
            
            <script>
            var active_btn =  document.getElementById("active_btn");
			var suspend_btn = document.getElementById("suspend_btn");
			var disable_btn = document.getElementById("disable_btn");
			
			var status = <%=user.getStatus()%>
			if(status.localeCompare("ACTIVE") == 0){
				active_btn.style.background-color = "green";
				suspend_btn.style.background-color = "gray";
				disable_btn.style.background-color = "gray";
			}else if(status.localeCompare("SUSPEND") == 0){
				active_btn.style.background-color = "gray";
				suspend_btn.style.background-color = "yellow";
				disable_btn.style.background-color = "gray";
			}else if(status.localeCompare("DISABLE") == 0){
				active_btn.style.background-color = "gray";
				suspend_btn.style.background-color = "gray";
				disable_btn.style.background-color = "red";
			}
			active_btn.onclick = function(){
				<%
            	session.setAttribute("userIdx", i);
            	%>
			};
			suspend_btn.onclick = function(){
				<%
            	session.setAttribute("userIdx", i);
            	%>
			};
			disable_btn.onclick = function(){
				<%
            	session.setAttribute("userIdx", i);
            	%>
			};
			
            </script>
            <%
            };
            %>
	    </table>
	    

<script>
var value = "<%=user%>";
console.log(value);
if(value == "admin"){
	document.getElementById("admin_access").className = "admin_link";
}
</script>


</body>
</html>