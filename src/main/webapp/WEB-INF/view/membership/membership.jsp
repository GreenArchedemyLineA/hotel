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
	#logo--image {
		cursor: pointer;
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
		min-width: 350px;
	}
	
	.content--container {
		flex: 3;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		padding: 20px;
	}
	.content--box {
		display: flex;
		width: 1100px;
		height: 400px;
		justify-content: center;
		margin-top: 100px;
	}
	
	.membership--image{
		width: 500px;
	}
	
	.content--1 {
		margin-left: 50px;
	}
	
	.content--2 {
		margin-right: 40px;
	}
	
	.content--description {
		display: flex;
		flex-direction: column;
		text-align: flex-end;
		margin-left: 50px;
	}
	
	.content--description--1 {
		font-size: 40px;
		font-weight: bold;
		margin-bottom: 30px;
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
	.sub--button {
		background-color: black;
		border: none;
		width: 300px;
		height: 50px;
		font-size: 20px;
		color: #ccc;
		margin: 40px 0;
	}
	.modal--wrap{
        display: none;
        width: 500px;
        height: 500px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
    }
    .black--bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal--close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal--close > a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    
	.back--icon {
		display: flex;
		height: 40px;
		align-items: center;
		cursor: pointer;
	}

</style>
</head>
<body>
<main class="main--container">
	<div class="title--container">
		<div class="title--logo">
			<a onclick="history.back()"><span class="material-symbols-outlined back--icon">arrow_back</span></a>
			<img alt="" src="/images/dodam_wlogo.png" id="logo--image" onclick="location.href='/'" width="200px;" height="40px;">	
		</div>
		<div class="title--text">
			<p>도담 멤버쉽이</p>
			<p>당신의 여정과</p>
			<p>함께합니다</p>
		</div>
	</div>
	<div class="content--container">
		<div class="content--box">
			<img alt="" src="/images/2023.jpg" class="membership--image">
			<div class="content--1">
				<div class="content--description--1">
					<p>경험은 풍성해지고</p>
					<p>혜택은 더해집니다</p>
				</div> 
				<div class="content--description--2">
					<p>ㅡ</p>
					<p style="margin-bottom: 10px;">포인트 적립</p>
					<p>멤버쉽 기간 동안 7% 적립</p>
				</div>
					<button type="button" class="button--container">도담 등급 보러가기</button>
			</div>	
		</div>
		
		<div class="content--box">
			<div class="content--2">
				<div class="content--description--1">
					<p>Welcome 쿠폰을</p>
					<p>지금 만나보세요</p>
				</div> 
				<div class="content--description--2">
					<p>ㅡ</p>
					<p style="margin-bottom: 10px;">1박 무료 숙박 쿠폰</p>
					<p>바로 사용 가능한 숙박 쿠폰 제공</p>
				</div>
					<button type="button" onclick="#" class="button--container">멤버쉽 혜택 보러가기</button>
			</div>	
			<img alt="" src="/images/membership2.jpg" class="membership--image">
		</div>
		<div >
			<button onclick="location.href='/joinMembership'" class="sub--button">멤버쉽 가입하기</button>
		</div>
	</div>
</main>
<%@ include file="../layout/footer.jsp"%>
