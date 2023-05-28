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
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&display=swap');
/* 새로 추가 */
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
</head>
<body>
	<main>
		<nav>
			<ul>
				<li id="logo--li">dodam</li>
				<li id="room--li"><a href="/manager/roomStatus">객실</a></li>
				<li id="dining--li"><a href="#">다이닝</a></li>
				<li id="userList--li"><a href="/manager/userList">회원조회</a></li>
				<li id="reservation--li"><a href="/manager/reservation">예약</a></li>
				<li id="event--li"><a href="/event/notice">호텔 일정</a></li>
				<li id="qna--li"><a href="/question/questionList">문의 사항</a></li>
				<li id="faq--li"><a href="/manager/faq">FAQ</a></li>
			</ul>
		</nav>
		<div class="content">
			<div class="main--headers">
				<button type="button" onclick="location.href='/manager/membershipUserList'">맴버쉽 회원 검색</button>
				<button type="button" onclick="location.href='/manager/blackList'">블랙리스트 회원 검색</button>
			</div>
			<div class="main--content">
				<button type="button" onclick="location.href='/manager/userList'">돌아가기</button>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">회원이름</th>
							<th scope="col">이메일</th>
							<th scope="col">전화번호</th>
							<th scope="col">생년월일</th>
							<th scope="col">탈퇴여부</th>
							<th scope="col">고유의 이메일</th>
							<th scope="col">탈퇴</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items= "${userList}">
							<tr>
								<td>${user.name}</td>
								<td>${user.email}</td>
								<td>${user.tel}</td>
								<td>${user.birth}</td>
								<td>${user.withdrawal}</td>
								<td>${user.originEmail}</td>
								<c:choose>
									<c:when test="${user.withdrawal == 0}">
								<td><button onclick="userDelete(${user.id},'${user.email}')">탈퇴 처리</button></td>
									</c:when>
									<c:otherwise>
								<td>탈퇴된 회원 입니다.</td>							
									</c:otherwise>						
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</main>
	
	<script>
		function userDelete(id,email){
			location.href = "/manager/userWithdrawal/"+id+"/"+email; 
		}
	</script>
</body>
</html>
