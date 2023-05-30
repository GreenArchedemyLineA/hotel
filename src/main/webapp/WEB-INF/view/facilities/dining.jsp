<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/css/navi.css" />
<style type="text/css">
</style>
</head>
<body>
	<div class="body--container">
		<div class="navi--bar">
			<span class="title--box"><a href="/dining">다이닝</a></span>
				<div class="detail--container">
					<c:choose>
						<c:when test="${type eq '레스토랑'}">
							<span class="detail--box color--toggle" onclick="location.href='/dining?type=레스토랑'">레스토랑</span>
							<span class="detail--box" onclick="location.href='/dining?type=라운지'">라운지 & 바</span>
							<span class="detail--box"><a href="/fitness">피트니스</a></span>
							<span class="detail--box"><a href="/pool">수영장</a></span>
							<span class="detail--box"><a href="/spa">스파</a></span>
						</c:when>
						<c:when test="${type eq '라운지'}">
							<span class="detail--box" onclick="location.href='/dining?type=레스토랑'">레스토랑</span>
							<span class="detail--box color--toggle" onclick="location.href='/dining?type=라운지'">라운지 & 바</span>
							<span class="detail--box"><a href="/fitness">피트니스</a></span>
							<span class="detail--box"><a href="/pool">수영장</a></span>
							<span class="detail--box"><a href="/spa">스파</a></span>
						</c:when>
						<c:otherwise>
							<span class="detail--box"><a href="/dining?type=레스토랑">레스토랑</a></span>
							<span class="detail--box"><a href="/dining?type=라운지">라운지 & 바</a></span>
							<span class="detail--box"><a href="/fitness">피트니스</a></span>
							<span class="detail--box"><a href="/pool">수영장</a></span>
							<span class="detail--box"><a href="/spa">스파</a></span>
						</c:otherwise>
					</c:choose>
				</div>
		</div>
		<div class="main--container">
			<c:forEach var="list" items="${diningList}">
				<div>
					<c:choose>
						<c:when test="${type.equals('레스토랑')}">
							<img alt="레스토랑" src="/images/dining1.jpg" style="width: 1000px; height: 500px;">
						</c:when>
						<c:otherwise>
							<a href="/dining?type=라운지">
								<img alt="라운지 & 바" src="/images/bar.jpg" style="width: 1000px; height: 500px;">
							</a>
						</c:otherwise>
					</c:choose>
					
				</div>
				<div class="info--container">
					<div class="info--outline">
						<p class="title--box">${list.dining.name}</p>
						<p class="desc--box">${list.dining.location}</p>
					</div>
					<div>
						<c:if test="${type != 'All'}">
							<div class="desc--box--2">						
								<p>${list.dining.hours}</p>
							</div>
							<div class="desc--box--3">
								<div class="info--title">
									<p>추가 정보</p>								
								</div>
								<div class="info--content">
									<p>${list.contentDesc1}</p>
									<p>${list.contentDesc2}</p>
									<p>${list.contentDesc3}</p>
									<p>${list.contentDesc4}</p>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script>
    const swiper = new Swiper('.swiper-container', {
      direction: 'horizontal',
      loop: true

    });
</script>
</body>

</html>
