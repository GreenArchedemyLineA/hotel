<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>couponList Page</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Caveat:wght@600&family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&family=WindSong:wght@500&display=swap');
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
	
	<c:forEach items="${coupons}" var="coupons">
		<div>
			${coupons.couponInfo.name}
		</div>
		<div>
			${coupons.startDate}
		</div>
		<div>
			${coupons.endDate}
		</div>
	</c:forEach>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1}">
			<a href="/couponList?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a href="/couponList?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/couponList?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	
</body>
</html>
	