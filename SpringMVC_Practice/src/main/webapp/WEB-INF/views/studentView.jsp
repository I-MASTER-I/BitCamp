<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

	<form action="student" method="get">
		<h1>Student ID : <input type="text" name="id"></h1><br>
		<input type="submit" value="Submit">
	</form>
	
	
	<form action="student" method="post">
		<h1>Student ID : <input type="text" name="id"></h1><br>
		<input type="submit" value="Submit">
	</form>
	
	<%String context = request.getContextPath(); %>
	
	<form action="<%=context%>">
		name : ${studentInfo.name}<br>
		age : ${studentInfo.age}<br>
		classNum : ${studentInfo.classNum }<br>
		gradeNum : ${studentInfo.gradeNum }<br>
		<input type="submit" value="Submit">
	</form>
	
</body>
</html>
