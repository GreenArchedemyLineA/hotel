<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/navi.css" />
<style type="text/css">
</style>
</head>
<body>
	<div class="body--container">
		<div class="navi--bar">
			<span class="title--box" onclick="location.href='/room'">객실</span>
				<div>
					<c:choose>
						<c:when test="${type eq '디럭스'}">
							<span class="detail--box color--toggle" onclick="location.href='/room?type=디럭스'">디럭스</span>
							<span class="detail--box" onclick="location.href='/room?type=프리미엄'">프리미엄</span>
							<span class="detail--box" onclick="location.href='/room?type=스위트'">스위트</span>
						</c:when>
						<c:when test="${type eq '프리미엄'}">
							<span class="detail--box" onclick="location.href='/room?type=디럭스'">디럭스</span>
							<span class="detail--box color--toggle" onclick="location.href='/room?type=프리미엄'">프리미엄</span>
							<span class="detail--box" onclick="location.href='/room?type=스위트'">스위트</span>
						</c:when>
						<c:when test="${type eq '스위트'}">
							<span class="detail--box" onclick="location.href='/room?type=디럭스'">디럭스</span>
							<span class="detail--box" onclick="location.href='/room?type=프리미엄'">프리미엄</span>
							<span class="detail--box color--toggle" onclick="location.href='/room?type=스위트'">스위트</span>
						</c:when>
						<c:otherwise>
							<span class="detail--box" onclick="location.href='/room?type=디럭스'">디럭스</span>
							<span class="detail--box" onclick="location.href='/room?type=프리미엄'">프리미엄</span>
							<span class="detail--box" onclick="location.href='/room?type=스위트'">스위트</span>
						</c:otherwise>
					</c:choose>
				</div>
		</div>
		<div class="main--container">
			<div>
				<c:forEach var="roomList" items="${roomList}">
						<div class="info--container">
							<a href="/detailRoom/${roomList.id}">
							<c:if test="${roomList.id == 1}">
								<img alt="디럭스" src="images/deluxe.jpg" style="width: 1000px; height: 500px;">
							</c:if> 
							<c:if test="${roomList.id == 2}">
								<img alt="비즈니스 디럭스" src="images/business.jpg" style="width: 1000px; height: 500px;">
							</c:if> 
							<c:if test="${roomList.id == 3}">
								<img alt="프리미엄" src="images/premium.jpg" style="width: 1000px; height: 500px;">
							</c:if>
							<c:if test="${roomList.id == 4}">
								<img alt="스위트" src="images/suite.jpg" style="width: 1000px; height: 500px;"> 
							</c:if> 
							<c:if test="${roomList.id == 5}">
								<img alt="코너 스위트" src="images/corner.png" style="width: 1000px; height: 500px;">
							</c:if> 
							</a>
							<div class="info--outline">
								<p class="title--box">${roomList.name}</p>
								<p class="desc--box">|  ${roomList.numberOfP}인</p>
							</div>
						</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
