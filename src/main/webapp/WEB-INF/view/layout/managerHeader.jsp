<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zzkxekb89f"></script>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&display=swap');
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', monospace;
}

body {
	height: 100vh;
}

main {
	display: flex;
	height: 100vh;
}

nav {
	width: 150px;  /* 로그 크기에 따라 수정할 예정 */	
	height: 100vh;
	background-color: #64c5f3;
}

.content {
	display: flex;
	flex-direction: column;
	padding: 10px;
}

.main--content {
	border: 2px solid black;
	width: 1200px;
	height: 600px;
	padding: 10px;
}

li {
	list-style: none;
	margin-bottom: 10px;
	padding-left: 10px;
}

.main--headers {
	margin-bottom: 10px;
}

</style>
<body>
	<main>
		<nav>
			<ul>
				<li id="logo--li"><a href="/manager/managerMain"><img alt="dodam" src="/images/white_logo.png" width="100" height="40"></a></li>
				<li id="room--li"><a href="/manager/roomStatus">객실</a></li>
				<li id="dining--li"><a href="#">다이닝</a></li>
				<li id="userList--li"><a href="/manager/userList">회원조회</a></li>
				<li id="reservation--li"><a href="/manager/reservation">예약</a></li>
				<li id="event--li"><a href="/event/notice">호텔 일정</a></li>
				<li id="qna--li"><a href="/question/questionList">문의 사항</a></li>
				<li id="faq--li"><a href="/manager/faq">FAQ</a></li>
			</ul>
		</nav>
