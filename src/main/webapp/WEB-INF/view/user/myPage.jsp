<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />
<link rel="stylesheet" href="/css/myPage.css" />
<style>
</style>
	<main class="main--container">
		<div class="title--container">
		<div class="title--logo">
			<span class="material-symbols-outlined back--icon" onclick="history.back()">arrow_back</span>
			<img alt="" src="/images/dodam_wlogo.png" id="logo--image" height="40"onclick="location.href='/'">	
		</div>
		<div class="title--text">
			<p>내 정보를</p>
			<p>확인해보세요</p>
		</div>
	</div>
	<div class="content--container">
		<div class="info--container">
			<div class="myinfo--container">
				<p style="font-size: 30px; border-bottom: 4px solid #64c5f3;"><b>${responseGrade.user.name}</b> 님 환영합니다 !</p>
				<div class="myinfo--detail">
					<p>${responseGrade.grade.name}</p>					
					<p>${responseGrade.grade.description}</p>
				</div>
			</div>
			<div class="myinfo--box">
				<span id="userUpdate" class="myinfo--box--span">회원 정보 수정</span>
				<span id="coupons" class="myinfo--box--span">쿠폰함 (${coupons.size()})</span>
				<span id="reservations" class="myinfo--box--span">예약 현황</span>
				<span id="qandA" class="myinfo--box--span">QnA</span>
			</div>
				<div id="myInfoDiv">
					<form class="form--container" action="/myPageProc" method="post">
						<div>
							<span>이메일</span>
							<input class="input--box" name="email" type="email" readonly="readonly" value="${responseUser.email}">
						</div>
						<div>
							<span>비밀번호</span>
							<input class="input--box" name="password" type="password" value="${responseUser.password}" id="password--box">
							<div id="key--check"></div>
						</div>
						<div>
							<span>이름</span>
							<input class="input--box" name="name" type="text" value="${responseUser.name}">
						</div>
						<div>
							<span>성별</span>
							<input class="input--box" name="gender" type="text" value="${responseUser.gender}" readonly="readonly">
						</div>
						<div>
							<span>생년월일</span>
							<input class="input--box" name="birth" type="text" id="text" value="${responseUser.birth}" readonly="readonly">
						</div>
						<div>
							<span>주소</span>
							<input class="input--box" name="address" type="text"value="${responseUser.address}">
						</div>
						<div>
							<span>전화번호</span>
							<input class="input--box" name="tel" type="text" value="${responseUser.tel}" id="tel--box">
						</div>
						<input class="sub--button" type="submit" value="정보 수정">
						<button class="sub-button" onclick="withdrawUser()">회원 탈퇴</button>
					</form>
				</div>
			</div>
		</div>
	</main>
	
	<script src="/js/myinfo.js"></script>
	<script>
		function withdrawUser() {
			if(confirm("정말 탈퇴하시겠어요?")) {
				location.href = "/delete"
			} else {
				location.href = "history.back()"
			}
		}
	</script>
<%@ include file="../layout/footer.jsp"%>
