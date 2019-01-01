<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberInfo memberInfo = new MemberInfo();
	
	//1. multipart/form-data 여부 확인	
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	if(isMultipart){
		
		DiskFileItemFactory factory = new DiskFileItemFactory();		
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> items = upload.parseRequest(request);
		
		Iterator<FileItem> itr = items.iterator();
		
		while(itr.hasNext()){
			
			FileItem item = itr.next();
			
			if(item.isFormField()){
				
				if(item.getFieldName().equals("userId")){
					memberInfo.setUserId(item.getString("utf-8"));
				}
				if(item.getFieldName().equals("password")){
					memberInfo.setPassword(item.getString("utf-8"));
				}
				if(item.getFieldName().equals("userName")){
					memberInfo.setUserName(item.getString("utf-8"));
				}
				
			} else { 
				
				if(item.getFieldName().equals("photoFile") 
						&& item.getSize() > 0 
						&& item.getName() != null 
						&& item.getName().length()>0){
					
					// 저장하기위한 파일의 새로운 이름 생성
					String newFileName = "";
					String fileName = item.getName();
					newFileName = System.currentTimeMillis()+"_"+fileName;
					
					String uploadUri = "/uploadfile";
					String dir = request.getSession().getServletContext().getRealPath(uploadUri);
					
					File file = new File(dir, newFileName);
					
					// 물리적인 저장
					item.write(file);
					
					memberInfo.setUserPhoto(newFileName);
					
				}
				
			}
		 
		}
		
	
	}
		

%>

<%
	

	// 데이터 베이스 입력처리 : 2018.09.20
	Connection conn = null;
	PreparedStatement pstmt = null;

	String sql = "insert into member (idx, userid, password, username, userphoto ) values(seq_member.nextval, ?, ?, ?, ?)";

	try {
		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:open");

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberInfo.getUserId());
		pstmt.setString(2, memberInfo.getPassword());
		pstmt.setString(3, memberInfo.getUserName());
		pstmt.setString(4, memberInfo.getUserPhoto());
		int resultCnt = pstmt.executeUpdate();
		System.out.println(resultCnt);
	} catch (Exception e) {

	} finally {
		pstmt.close();
		conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
<style>
h2, td {
	padding: 10px;
}
</style>
</head>
<body>

	<%@ include file="common/header.jsp"%>


	<div id="contents">

		<h2>회원가입 정보</h2>

		<hr>
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td><%= memberInfo.getUserId()%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%= memberInfo.getPassword()%></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%= memberInfo.getUserName()%></td>
			</tr>
			<tr>
				<td><img alt="회원사진" src="<%= request.getContextPath()+"/uploadfile/"+memberInfo.getUserPhoto()%>"></td>
				<td></td>
			</tr>
		</table>



	</div>











</body>
</html>