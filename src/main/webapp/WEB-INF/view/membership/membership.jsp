<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&display=swap');
	* {
		margin: 0;
		font-family: 'Noto Sans KR', monospace;
	}
	.main--container {
		display: flex;
		
	}
	#membership--image {
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
		display: flex;
		justify-content: center;
	}
	.content--box--1 {
		display: flex;
		width: 1100px;
		height: 400px;
		justify-content: center;
		margin-top: 100px;
		
	}
	#membership--image {
		width: 500px;
	}
	.content--description {
		margin-left: 50px;
	}
	.content--description--1 {
		font-size: 40px;
		font-weight: bold;
		margin-bottom: 70px;
	}
	.content--description--2 {
		font-size: 25px;
		margin-bottom: 70px;
	}
	.button--container {
		width: 200px;
		height: 40px;
		border: none;
		background-color: #FF9F8D;
		color: #fff;
		
	}
	
	
	/* .form--container {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		height: 100vh;
	}
	.input--box {
		width: 350px;
		height: 40px;
		border: none;
		border-bottom: 2px solid black;
		margin: 10px;
	}
	.sub--button {
		background-color: black;
		color: #fff;
		width: 350px;
		height: 40px;
		margin: 20px;
		cursor: pointer;
	}
	.check--box {
		display: flex;
		justify-content: flex-start;
		margin-bottom: 100px;
	}
	.join--button {
		background-color: #FF9F8D;
		border: none;
		color: #fff;
		width: 350px;
		height: 40px;
		margin: 10px;
		cursor: pointer;
	}
	.find--button {
		width: 350px;
		height: 40px;
		cursor: pointer;
		border: 1px solid #FF9F8D;
		background-color: #fff;
	} */
</style>
<main class="main--container">
	<div class="title--container">
		<div class="title--logo">
			<a onclick="history.back()"><span class="material-symbols-outlined">arrow_back</span></a>
			<img alt="" src="/images/logo_white.png" id="logo--image">	
		</div>
		<div class="title--text">
			<p>도담 멤버쉽이</p>
			<p>당신의 여정과</p>
			<p>함께합니다</p>
		</div>
	</div>
	<div class="content--container">
		<div class="content--box--1">
			<img alt="" src="/images/2023.jpg" id="membership--image">
			<div class="content--description">
				<div class="content--description--1">
					<p>경험은 풍성해지고</p>
					<p>혜택은 더해집니다</p>
				</div> 
				<div class="content--description--2">
					<p style="margin-bottom: 10px;">포인트 적립</p>
					<p>멤버쉽 기간 동안 7% 적립</p>
				</div>
					<button type="button" onclick="#" class="button--container">도담 등급 보러가기</button>
			</div>	
		</div>
	</div>
</main>

<div class="body--container">
	<div class="navi--bar">
		<ul class="navi--bar--ul">
			<li>멤버쉽 소개</li>
			<li>멤버쉽 가입</li>
		</ul>
	</div>
	<div class="main--container">
		도담 멤버쉽을 소개합니다
	연회비 : 50만원
	가입 시, 1박 무료 숙박 쿠폰 제공
	멤버쉽 전용 패키지 이용 가능
	</div>
		<a href="/joinMembership"><button type="submit" class="sub--button">가입하기</button></a>
</div>
</body>
</html>