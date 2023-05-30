<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../layout/header.jsp"%>
<style type="text/css">
* {
	font-family: 'Noto Sans KR', monospace;
}

.body--container {
	display: flex;
}

.navi--bar {
	background-color: #D0DFBE;
	width: 300px;
	height: 500px;
	padding: 20px;
	margin: 30px;
	border-radius: 10px;
}

.navi--bar--ul {
	padding: 0;
}

.navi--bar--ul li {
	text-align: center;
	list-style: none;
	font-size: 20px;
	padding: 15px 0;
}

.main--container {
	background-color: beige;
	width: 1800px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.navi--bar {
	position:sticky;
    top:200px;
}

.dining--outline {
	display: flex;
	justify-content: space-between;
	width: 1000px;
}

.dining--info {
	width: 1000px;
}

.dining--time {
	display: flex;
	justify-content: space-between;
	width: 1000px;
}

.dining--additional--information {
	display: flex;
	justify-content: space-between;
	width: 1000px;
}

</style>
</head>
<body>
	<div class="body--container">
		<div class="navi--bar">
			<ul class="navi--bar--ul">
			    <li><a href="/dining">전체 보기</a></li>
			    <li><a href="/dining?type=레스토랑">레스토랑</a></li>
				<li><a href="/dining?type=라운지">라운지 & 바</a></li>
			</ul>
		</div>
		<div class="main--container">
			<h2>다이닝</h2>
			<c:forEach var="list" items="${diningList}">
				<div>
					<a href="#">
						<img alt="객실 사진" src="https://picsum.photos/id/169/1000/500">
					</a>
				</div>
				<div class="dining--info">
					<div class="dining--outline">
						<div>
							<h2>다이닝 개요</h2>
						</div>
						<div>
							<h3><a href="#">${list.dining.name}</a></h3>
							<p><a href="#">위치 : ${list.dining.location}</a></p>
						</div>
					</div>
					<div>
						<c:if test="${type != 'All'}">
							<div class="dining--time">
								<h2>이용 시간</h2>									
								<p><a href="#">${list.dining.hours}</a></p>
							</div>
							<div class="dining--additional--information">
								<h2>추가 정보</h2>
								<div>
									<p><a href="#">설명1 : ${list.contentDesc1}</a></p>
									<p><a href="#">설명2 : ${list.contentDesc2}</a></p>
									<p><a href="#">설명3 : ${list.contentDesc3}</a></p>
									<p><a href="#">설명4 : ${list.contentDesc4}</a></p>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
