<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
  <link rel="stylesheet" type="text/css" href="css/newStyle.css" />
  
<script>
var minutesleft = 15;
var secondsleft = 0;
var finishedtext = "Countdown finished!";
var end1;
if(localStorage.getItem("end1")) {
	end1 = new Date(localStorage.getItem("end1"));
} else {
	end1 = new Date();
	end1.setMinutes(end1.getMinutes()+minutesleft);
	end1.setSeconds(end1.getSeconds()+secondsleft);
}
var counter = function () {
var now = new Date();
var diff = end1 - now;

diff = new Date(diff);

var milliseconds = parseInt((diff%1000)/100)
    var sec = parseInt((diff/1000)%60)
    var mins = parseInt((diff/(1000*60))%60)

if (mins < 10) {
    mins = "0" + mins;
}
if (sec < 10) { 
    sec = "0" + sec;
}     
if(now >= end1) {     
    clearTimeout(interval);
     localStorage.removeItem("end1");
     localStorage.clear();
    document.getElementById('divCounter').innerHTML = finishedtext;
     if(confirm("TIME UP!"))
    	 alert("Time up. Submit your quiz now!");
} else {
    var value = mins + ":" + sec;
    localStorage.setItem("end1", end1);
    document.getElementById('divCounter').innerHTML = value;
}
}
var interval = setInterval(counter, 1000);
</script>


</head>
<body>

<div class="topnav">
  <a href="pages/home.jsp">HOME</a>
  <a href="pages/login.jsp">LOGIN</a>
  <a href="pages/studentregister.jsp">REGISTER</a>
  <a href="pages/feedback.jsp">FEEDBACK</a>
  <a href="pages/contact.jsp">CONTACT US</a>
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

<%! int question = 1; %>
<%
	if(session.getAttribute("numQues")!= null){
		question = (int) session.getAttribute("numQues");
	}
%>

	<form action="<%= request.getContextPath() %>/question" method="get">
	<input type="submit" id="button1" name ="button1" value="Previous Question" >
	 <input type="submit" id="button2" name="button2" value="Next Question"/>
	</form>
   
<script type="text/javascript">
var prev =  document.getElementById("button1");
var next = document.getElementById("button2");
	var questionIdx = <%=question%>
	if(questionIdx == 1){
		prev.style.visibility = "hidden";
	}else if(questionIdx > 1 && questionIdx < 10){
		prev.style.visibility = "visible";
		next.style.visibility = "visible";
	}else if(questionIdx == 10){
		next.style.visibility = "hidden";
	}
</script>
<div id="divCounter" align="right"></div>

<div>
  <form action="<%= request.getContextPath() %>/question" method="post">
   		<h3 id="questionText"><%= request.getAttribute("question") %></h3>
  		<p id="option1"><%= request.getAttribute("optionA") %></p><br>
  		<p id="option2"><%= request.getAttribute("optionB") %></p><br>
  		<p id="option3"><%= request.getAttribute("optionC") %></p><br>
  		<p id="option4"><%= request.getAttribute("optionD") %></p><br>
	   <label for="answer">Answer:</label>
	  	<select id="answer" name="answer">
		  <option value="1" selected>A</option>
		  <option value="2">B</option>
		  <option value="3">C</option>
		  <option value="4">D</option>
		</select>
		
   <input type="submit" id="submitButton" value="Submit" />
  </form>
 
</div>
</body>
</html>