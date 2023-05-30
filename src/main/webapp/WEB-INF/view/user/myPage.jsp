<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />
<link rel="stylesheet" href="/css/myPage.css" />
<style>
</style>
	<main class="main--container">
		<div class="title--container">
		<div class="title--logo">
			<a onclick="history.back()"><span class="material-symbols-outlined">arrow_back</span></a>
			<img alt="" src="/images/white_logo.png" id="logo--image">	
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
			<div id="myInfoDiv"></div>
			</div>
		</div>
	</main>
	
	<script src="/js/myinfo.js"></script>
</body>
</html>