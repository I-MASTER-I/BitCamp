<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Store Detail</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/store.css">

</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="include/headerBanner.jsp"/>
<jsp:include page="include/boardDetail.jsp"/>
<jsp:include page="reply.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>