<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="project1.domain.Question" %>
<%@ page import ="project1.dao.QuestionDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result Success Page</title>
    <link rel="stylesheet" type="text/css" href="css/newStyle.css" />
    
     <%
     QuestionDAO questionDAO = (QuestionDAO) request.getAttribute("resultLists");
    %>
</head>
<body>

<div class="topnav">
  <a href="pages/home.jsp">HOME</a>
  <a href="pages/login.jsp">LOGIN</a>
  <a href="pages/studentregister.jsp">REGISTER</a>
  <a href="pages/feedback.jsp">FEEDBACK</a>
  <a href="contact.jsp">CONTACT US</a>
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

<div align="center">
  <h1>Quiz Result</h1>
   <form action="pages/loginsuccess.jsp" method="post">
   <table style="with: 80%">
    <tr>
     <td>Quiz Name</td>
     <td><p>
     <% String quizname = (String) session.getAttribute("quizname");
		out.print(quizname);%>
		</p>
	</td>
    </tr>
    <tr>
     <td>Username</td>
     <td><p>
     <%
		out.print(username);%>
		</p>
     </td>
    </tr>
    
    <tr>
    <td>Result</td>
    <td><p>
     	<%
		out.print((String)request.getAttribute("testResult"));%>
		</p>
     </td>
    </tr>
    
    <tr>
    <td>Start time</td>
    <td><p>
     <%
		String start_time = (String)session.getAttribute("start_time");
     	out.print(start_time);%>
     	</p>
     </td>
    </tr>
    
    <tr>
    <td>End time</td>
    <td><p>
     <%
    	String end_time = (String) session.getAttribute("end_time");
		out.print(end_time);%>
		</p>
     </td>
    </tr>
    
   </table>
      <input type="submit" value="Take Quiz" />
  </form>
 </div>

	<form>
	            <% 
	            ArrayList<Question> resultList = questionDAO.getQuestionList();
	            for(int i = 0; i < resultList.size(); i++) {
	                Question question = new Question();
	                question = resultList.get(i);
	            %>
	                <h2 style="font-size:15px">Question <%=question.getQuestionNumber()%></h2>
	                <p style="font-size:15px"><%=question.getQuestionContext()%></p><br/>
	                <p style="font-size:15px"><%=question.getOptionA()%></p><br/>
	                <p style="font-size:15px"><%=question.getOptionB()%></p><br/>
	                <p style="font-size:15px"><%=question.getOptionC()%></p><br/>
	                <p style="font-size:15px"><%=question.getOptionD()%></p><br/>
	                <p style="font-size:15px">User Answer: <%=question.getUserChoice()%></p><br/>
	                <p style="font-size:15px">Correct Answer: <%=question.getCorrectValue()%></p><br/>
	                
	            <%
	            };
	            %>
	    </form>
	    
</body>
</html>