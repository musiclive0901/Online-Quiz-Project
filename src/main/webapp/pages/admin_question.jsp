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
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<title>Admin Question</title>
 <link rel="stylesheet" type="text/css" href="css/newStyle.css" />
    <%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
   <script src= 
"//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"> 
</script> 
<script src= 
"//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"> 
</script> 

    <script src="jquery-3.5.1.min.js"></script>
    <style>
		.hidden_link{
			visibility:hidden;
		}
		.admin_link{
		  visibility: visible;
		}
		table, th, td {
 		 border: 1px solid black;
 		 margin-left:auto; 
   		 margin-right:auto;
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
   <a id = "admin_access" href= "pages/admin.jsp">ADMIN</a>
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

	<div>
		 <button onclick="document.location='pages/admin.jsp'">BACK</button>
		 <button onclick="document.location='pages/admin_question_add.jsp'">Add New Question</button>
	</div>
	

<form method="post" action="<%= request.getContextPath() %>/download"> 
<input type="submit" name="submit" value="Download as Excel" /> 
</form>
	 
	  
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

	   
<table id="testTable">
            <% 
            for(int i = 0; i < questionList.size(); i++) {
            	Question question = questionList.get(i);
            %>
            <tr>
            	<th style="text-align:center">Question Number</th>
            	<th style="text-align:center">Question Context</th>
            	<th style="text-align:center">Option A</th>
            	<th style="text-align:center">Option B</th>
      			<th style="text-align:center">Option C</th>
      			<th style="text-align:center">Option D</th>
      			<th style="text-align:center">Correct Answer</th>
      			<th style="text-align:center">Action</th>
            </tr>
            <tr>
               <td style="text-align:center"><p style="font-size:15px"><%=question.getQuestionNumber()%></p>
                <td><p style="font-size:15px"><%=question.getQuestionContext()%></p>
                <td><p style="font-size:15px"><%=question.getOptionA()%></p>
                <td><p style="font-size:15px"><%=question.getOptionB()%></p>
                <td><p style="font-size:15px"><%=question.getOptionC()%></p>
                <td><p style="font-size:15px"><%=question.getOptionD()%></p>
                <td style="text-align:center"><p style="font-size:15px"><%=question.getCorrectValue()%></p>
                
                <td style="text-align:center">
                	
               		<p style="font-size:15px"><%=question.getQuestionStatus()%></p>
               		<form action="<%= request.getContextPath() %>/admin_question_edit" method="get">
               			<span class="glyphicon glyphicon-edit"></span>
               			<input type="submit" id="edit_btn_question" name ="edit_btn_question" value="EDIT" >
               		</form>
               		
	                <form action="<%= request.getContextPath() %>/admin_question" method="post">
						<span style="font-family: Arial Unicode MS, Lucida Grande">&#x2705;</span>
						<input type="submit" id="activate_btn_question" name="activate_btn_question" value="ACTIVATE"/>
					</form>
					
					<form action="<%= request.getContextPath() %>/admin_question" method="post">
						<span>&#10008;</span>
					<input type="submit" id="disable_btn_question" name="disable_btn_question" value="DISABLE"/>
					</form>
					
					<form action="<%= request.getContextPath() %>/admin_question" method="post">
						<span class="glyphicon glyphicon-trash"></span>
						<input type="submit" id="delete_btn_question" name="delete_btn_question" value="DELETE"/>
					</form>
                <td>
         
            <tr>
            
             <script>
            var edit_btn_question =  document.getElementById("edit_btn_question");
			var activate_btn_question = document.getElementById("activate_btn_question");
			var disable_btn_question = document.getElementById("disable_btn_question");
			var delete_btn_question = document.getElementById("delete_btn_question"); 
			var status = <%=question.getQuestionStatus()%>;
			
			if(status == "ACTIVE"){
				activate_btn_question.className = "hidden_link";
				disable_btn_question.className = "admin_link";
			}else if(status == "DISABLE"){
				activate_btn_question.className = "admin_link";
				disable_btn_question.className = "hidden_link";
			}
			edit_btn_question.onclick = function(){
				<%
         
				session.setAttribute("questionIdx", (int)question.getQuestionID());
				session.setAttribute("editQuestion", (String)question.getQuestionContext());
				session.setAttribute("editOptionA", (String)question.getQuestionContext());
				session.setAttribute("editOptionB", (String)question.getQuestionContext());
				session.setAttribute("editOptionC", (String)question.getQuestionContext());
				session.setAttribute("editOptionD", (String)question.getQuestionContext());
				session.setAttribute("editCorrectValue", (String)question.getCorrectValue());
            	%>
			};
			activate_btn_question.onclick = function(){
				<%
            	session.setAttribute("questionIdx", i);
            	%>
			};
			disable_btn_question.onclick = function(){
				<%
            	session.setAttribute("questionIdx", i);
            	%>
			};
			
			delete_btn_question.onclick = function(){
				<%
            	session.setAttribute("questionIdx", i);
            	%>
			};
            </script>
            <%
            };
            %>
	    </table>
	    
	
	 


</body>
</html>