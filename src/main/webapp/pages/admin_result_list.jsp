<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    
<title>Result List Page</title>
    <link rel="stylesheet" type="text/css" href="css/newStyle.css" />
    <%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
    <%@ page import ="java.util.ArrayList"%>
	<%@ page import ="java.util.List"%>
	<%@ page import ="project1.domain.ResultList" %>
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
	</div>
	
 		<form action="<%= request.getContextPath() %>/admin_result_list" method="post">
 				<input type="text" id="tempUser" name="tempUser">
 				<span class="glyphicon glyphicon-search">
					<input type="submit" id="name_filter_button" name ="name_filter_button" value="FILTER NAME" >
				</span>
				<select id="subjectChoice" name="subjectChoice">
				  <option value="1">PHYSICS</option>
				  <option value="2">MATH</option>
				  <option value="3">CHEMISTRY</option>
				</select>
				
         		<span class="glyphicon glyphicon-search">
         			<input type="submit" id="category_filter_button" name ="category_filter_button" value="FILTER CATEGORY" >	
        		</span>
	
				<span class="glyphicon glyphicon-search">
         			<input type="submit" id="list_all" name ="list_all" value="LIST ALL" >	
        		</span>
		</form>
				

  		<%
	    List<ResultList> resultList = (List<ResultList>) request.getAttribute("admin_result_list");
       %>
       <table>
         
            <tr>
            	<th style="text-align:center">ID</th>
            	<th style="text-align:center">Username</th>
            	<th style="text-align:center">Quiz Result</th>
            	<th style="text-align:center">Date Taken</th>
      			<th style="text-align:center">Category</th>
      			<th style="text-align:center">Action</th>
            </tr>
             <% 
            for(int i = 0; i < resultList.size(); i++) {
                ResultList result = resultList.get(i);
            %>
            <tr>
               <td><%=result.getResultID()%><td>
                <td><%=result.getStudentUsername()%></td>
                <td><%=result.getQuizResult()%><td>
                <td><%=result.getDateTaken()%><td>
                <td><%=result.getQuizCategory()%><td>
               
               <td> 
                <form action="<%= request.getContextPath() %>/admin_resultdetail" method="get">
				<input type="submit" id="detail_result_btn" name ="detail_result_btn" value="SEE DETAIL" >
				</form>
                </td>
            <tr>
            
     		 <script>
            var detail_result_btn =  document.getElementById("detail_result_btn");
            detail_result_btn.onClick() = function(){
            	 <%
            		session.setAttribute("chosenTime", result.getDateTaken());
           		 %>
            }
            
            </script>
            
            <%
            };
            %>
	    </table>
	    
       
       

</body>
</html>