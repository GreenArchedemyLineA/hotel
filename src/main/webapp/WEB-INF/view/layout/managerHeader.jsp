<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
*{
margin: 0;
padding: 0;
}
body{
	height: 100vh;
}
a {
	margin-left: 30px;
	font-size: 30px;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}

a:active {
	color: black;
}

.header {
	display: flex;
	justify-content: flex-end;
	border-bottom: 3px solid black; 
}
label{
	color: black;
}
h5{
	color: black;
}
</style>
</head>
<body>
	<div class="header">
		<a href="/manager/managerMain" style="justify-content: flex-start;">
			<img alt="로고이미지" src="/images/adminLogo.png">
		</a>
		<a href="/manager/roomStatus">객실</a> 
		<a href="#">다이닝</a>
		<a href="/manager/userList">회원조회</a> 
		<a href="/manager/reservation">예약</a> 
		<a href="/event/notice">호텔 일정</a>
		<a href="/question/questionList">문의 사항</a> 
		<a href="/manager/faq">FAQ</a>
	</div>
</body>
</html>
