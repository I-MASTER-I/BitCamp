<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link href="https://fonts.googleapis.com/css?family=Audiowide|Gothic+A1:900|Open+Sans:300,300i,400,400i" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <title>home</title>
  

<head>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<style>
@import url('https://fonts.googleapis.com/css?family=Quantico:400,700');
</style>
	<title>SB_MALL</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/home/include/headerbanner.jsp"/>
<jsp:include page="/WEB-INF/views/home/include/dailyDeal.jsp"/>
<jsp:include page="/WEB-INF/views/home/include/homeYoutube.jsp"/>
<jsp:include page="/WEB-INF/views/home/include/homeNewProduct.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@include file="/WEB-INF/views/common/userChat.jsp" %>
</body>
</html>
