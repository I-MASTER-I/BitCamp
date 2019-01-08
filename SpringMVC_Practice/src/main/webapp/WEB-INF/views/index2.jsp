<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
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
	
	<form action="<%=context%>/studentView" method="post">
		name : <input type="text" name="name"><br>
		age : <input type="age" name="age"><br>
		classNum : <input type="classNum" name="classNum"><br>
		gradeNum : <input type="gradeNum" name="gradeNum"><br>
		<input type="submit" value="Submit">
	</form>
	
</body>
</html>
