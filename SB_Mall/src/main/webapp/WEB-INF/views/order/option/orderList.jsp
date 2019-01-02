<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<tr>
		<td>주문상세번호</td>
		<td>주문번호</td>
		<td>회원번호</td>
		<td>품목번호</td>
		<td>주문수량</td> 
		<td>옵션</td>
		<td>주문금액</td>
	</tr>
	<c:forEach var="order" items="${orders}">
		<tr>
			<td>${order.orderDetailNum}</td>
			<td>${order.orderSeq}</td>
			<td>${order.userSeq}</td>
			<td>${order.productSeq}</td>
			<td>${order.quantity}</td>
			<td>${order.option}</td>
			<td>${order.salePrice}</td>

		</tr>
	</c:forEach>
	

