<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/myPage.css" />
</head>
<body>
	<table class="table--container">
		<tr id="title--tr--container">
			<td>Check In</td>
			<td>Check Out</td>
			<td>Room</td>
			<td>Person</td>
			<td>Total Price</td>
			<td>Date</td>
		</tr>
		<c:forEach items="${reservations}" var="list">
			<tr class="table--tr--container">
				<td>${list.startDate}</td>
				<td>${list.endDate}</td>
				<td>${list.room.roomType.name}</td>
				<td>${list.numberOfP}</td>
				<td>${list.totalPrice}</td>
				<td>${list.createdAt}</td>
			</tr>
		</c:forEach>
	</table>
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1}">
			<a href="/myReservations?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a href="/myReservations?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/myReservations?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</body>
</html>
