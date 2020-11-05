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
<title>Insert title here</title>
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
	    List<Question> questionList = (List<Question>) request.getAttribute("admin_question_list");
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
   		<form action="<%= request.getContextPath() %>/admin_question_add">
    		<input type="submit" value="Add New Quesiton" />
		</form>

<table id="testTable">
            <% 
            for(int i = 0; i < questionList.size(); i++) {
            	Question question = questionList.get(i);
            %>
            <tr>
            	<th>Question Number</th>
            	<th>Question Context</th>
            	<th>Option A</th>
            	<th>Option B</th>
      			<th>Option C</th>
      			<th>Option D</th>
      			<th>Correct Answer</th>
      			<th>Action</th>
            	<th>Status
            </tr>
            <tr>
               <td><p style="font-size:15px"><%=question.getQuestionNumber()%></p>
                <td><p style="font-size:15px"><%=question.getQuestionContext()%></p>
                <td><p style="font-size:15px"><%=question.getOptionA()%></p>
                <td><p style="font-size:15px"><%=question.getOptionB()%></p>
                <td><p style="font-size:15px"><%=question.getOptionC()%></p>
                <td><p style="font-size:15px"><%=question.getOptionD()%></p>
                <td><p style="font-size:15px"><%=question.getCorrectValue()%></p>
                
                <td>
                <p style="font-size:15px"><%=question.getQuestionStatus()%></p>
                <form action="<%= request.getContextPath() %>/admin_question" method="post">
				<input type="submit" id="edit_btn_question" name ="edit_btn_question" value="EDIT" >
				<input type="submit" id="activate_btn_question" name="activate_btn_question" value="ACTIVATE"/>
				<input type="submit" id="disable_btn_question" name="disable_btn_question" value="DISABLE"/>
				</form>
                <td>
            <tr>
            
            <%
            };
            %>
	    </table>
	    
	
	   <input type="button" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel">
	   
	    <script>
		 var tableToExcel = (function() {
		      var uri = 'data:application/vnd.ms-excel;base64,'
		        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
		        , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
		        , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
		      return function(table, name) {
		        if (!table.nodeType) table = document.getElementById(table)
		        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
		        window.location.href = uri + base64(format(template, ctx))
		      }
		    })()
</script>

</body>
</html>