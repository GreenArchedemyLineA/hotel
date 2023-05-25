<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&display=swap');
	* {
		margin: 0;
		font-family: 'Noto Sans KR', monospace;
	}
	.hidden {
		display: none;
	}
	.main--container {
		display: flex;
	}
	#logo--image {
		width: 150px;
	}
	.title--container {
		flex: 1;
		background-color: #64c5f3;
		height: 100vh;
		color: #fff;
	}
	.title--container p {
		font-size: 60px;
		display: flex;
		flex-direction: column;
		align-items: flex-end;
	}
	.title--logo {
		display: flex;
		align-items: flex-end;
		justify-content: flex-end;
		margin: 10px 10px 0 0;
	}
	.title--logo a {
		cursor: pointer;
	}
	
	.title--text {
		margin: 150px 30px 0 0;
	}
	
	.content--container {
		flex: 3;
	}
	
	.info--container {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.myinfo--container {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 40px;
		margin: 100px 0 20px 0;
		font-size: 30px;
	}
	.myinfo--box {
		background-color: black;
		color: #ccc;
		width: 550px;
		height: 30px;
	}
	
	
</style>
	<main class="main--container">
		<div class="title--container">
		<div class="title--logo">
			<a onclick="history.back()"><span class="material-symbols-outlined">arrow_back</span></a>
			<img alt="" src="/images/logo_white.png" id="logo--image">	
		</div>
		<div class="title--text">
			<p>내 정보를</p>
			<p>확인해보세요</p>
		</div>
	</div>
	<div class="content--container">
		<div class="info--container">
			<div class="myinfo--container">
				<p style="margin-right: 20px;"><b>${responseGrade.user.name}</b> 님 환영합니다 !</p>
				<div>
					<p style="margin-right: 20px;">${responseGrade.user.tel}</p>
					<p>${responseGrade.grade.name}</p>					
				</div>
			</div>
			<div class="myinfo--box">
				<span id="userUpdate" class="myinfo--box--span">회원 정보 수정</span>
				<span id="coupons" class="myinfo--box--span">쿠폰함</span>
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