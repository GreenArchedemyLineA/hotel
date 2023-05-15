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
</style>
</head>
<body>
	<div class="body--container">
		<div class="navi--bar">
			<ul class="navi--bar--ul">
				<li>전체 보기</li>
				<li>디럭스</li>
				<li>프리미엄</li>
				<li>스위트</li>
			</ul>
		</div>
		<div class="main--container">
			<div>
				<h2>객실</h2>
				<div>zz</div>
			</div>
		<div>
			<c:forEach var="roomList" items="${roomList}">
					<div>
						<a href="#"> 
							<img alt="객실 사진" src="https://picsum.photos/id/169/1000/500">
						</a> 
						<a href="#">
							<p>수용 가능 인원 : ${roomList.numberOfP}</p>
						</a>
					</div>
			</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
