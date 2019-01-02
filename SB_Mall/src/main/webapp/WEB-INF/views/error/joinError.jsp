<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>

<%-- <!-- 	<h1>회원가입이 정상적으로 처리되지 않았습니다.<br>
	다시 시도해주세요.
	</h1> -->
	${error}
<!-- 	<h3><a href="join">회원가입</a></h3> --> --%>

<script>
alert("${error}");
location.href= '<%=request.getContextPath()%>/join';
</script>
	

</body>
</html>