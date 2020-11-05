<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result Detail Page</title>
    <link rel="stylesheet" type="text/css" href="css/newStyle.css" />
    <%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
    <%@ page import ="java.util.ArrayList"%>
	<%@ page import ="java.util.List"%>
	<%@ page import ="project1.domain.ResultDetail" %>
	<%@ page import ="project1.dao.ResultDAO" %>
    <script src="jquery-3.5.1.min.js"></script>
    <style>
		.hidden_link{
			visibility:hidden;
		}
		.admin_link{
		  visibility: visible;
		}
		table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
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
   <a id = "admin_access" href= "admin.jsp" >ADMIN</a>
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

 		<form action="<%= request.getContextPath() %>/admin_result_list" method="get">
				<input type="submit" id="back" name ="back" value="GO BACK" >
		</form>
				

  		<%
	    List<ResultDetail> resultList = (List<ResultDetail>) request.getAttribute("admin_result_detail");
       %>
       <table>
            <tr>
            	<th style="text-align:center">Question</th>
            	<th style="text-align:center"s>Option A</th>
            	<th style="text-align:center">Option B</th>
            	<th style="text-align:center">Option C</th>
            	<th style="text-align:center">Option D</th>
            	<th style="text-align:center">User Choice</th>
            	<th style="text-align:center">Correct Answer</th>
            </tr>
             <% 
            for(int i = 0; i < resultList.size(); i++) {
            	ResultDetail result = resultList.get(i);
            %>
            <tr>
                <td><%=result.getQuestionContext()%><td>
                <td><%=result.getA_option()%></td>
                <td><%=result.getB_option()%><td>
                <td><%=result.getC_option()%><td>
                <td><%=result.getD_option()%><td>
                <td><%=result.getUserChoice()%><td>
                <td><%=result.getCorrectChoice()%><td>
            <tr>
            
            <%
            };
            %>
	    </table>

</body>
</html>