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

.room--img {
	margin-bottom: 30px;
}

.room--info {
	display: flex;
	justify-content: space-between;
	width: 1000px;
}
.room-desc {
	width: 1000px;
}
</style>
</head>
<body>
	<div class="body--container">
		<div class="navi--bar">
			<ul class="navi--bar--ul">
			    <li><a href="/room">전체 보기</a></li>
				<li><a href="/room?type=디럭스">디럭스</a></li>
				<li><a href="/room?type=프리미엄">프리미엄</a></li>
				<li><a href="/room?type=스위트">스위트</a></li>
			</ul>
		</div>
		<div class="main--container">
			<div class="room--title">
				<h2>${room.name}</h2>
			</div>
			<div class="room--img">
				<img alt="객실 사진" src="https://picsum.photos/id/169/1000/500">
			</div>
			<div class="room-desc">
				<p>${room.description}</p>
			</div>
			<div class="room--info">
				<h2>객실 개요</h2>			
				<div>
					<p>투숙 인원 : ${room.numberOfP}</p>
					<p>가격(1박 기준) : ${room.price}원</p>
				</div>
			</div>
			<div>
				
			</div>
		</div>
	</div>
</body>
</html>
