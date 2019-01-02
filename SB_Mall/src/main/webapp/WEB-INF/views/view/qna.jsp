<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Q&A</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link href="https://fonts.googleapis.com/css?family=Audiowide|Gothic+A1:900|Open+Sans:300,300i,400,400i" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<%-- <jsp:include page="../../views/home/include/headerbanner.jsp"/> --%>
<jsp:include page="../../views/qna/qnaList.jsp"/>
<jsp:include page="../../views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>