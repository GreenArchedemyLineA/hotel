<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />
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
		min-width: 350px;
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
		flex-direction: column;
		justify-content: center;
		align-items: center;
		height: 40px;
		margin: 100px 0 20px 0;
	}
	.myinfo--box {
		display: flex;
		background-color: #FFF7D1;
		justify-content: center;
		height: 40px;
		margin-top: 40px;
	}
	.myinfo--box--span {
		padding: 0 35px;
		display: flex;
		align-items: center;
	}
	.myinfo--box--span:hover {
		cursor: pointer;
		background-color: black;
		color: #fff;
	}
	.myinfo--detail {
		display: flex;
		width: 285px;
		justify-content: space-between;
		text-align: center;
		margin-top: 10px;
	}
	
	.form--container {
		width: 100vh;
		height: 700px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
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
	.change--background {
		background-color: #FFF7D1;
		color: black;
	}
	.coupon--container {
		width: 600px;
		height: 300px;
		margin-top: 100px;
		display: flex;
		flex-direction: row;
		border: 2px solid #FF9F8D;

	}
	
	.table--container {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		width: 100vh;
		margin-top: 100px;
	}
	
	.coupon--info--container {
		flex: 2;
		height: 300px;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
	
	.color--container {
		background-color: #FF9F8D;
		flex: 1;
		height: 300px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.coupon--name--container {
		font-weight: bold;
		font-size: 40px;
		margin-bottom: 30px;
	}
	.coupon--date--container {
		display: flex;
		font-weight: bold;
	}
	.table--tr--container {
		border-bottom: 1px solid #ccc;
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		margin: 0 20px;
		text-align: center;
	}
	#title--tr--container {
		background-color: #FF9F8D;
		color: white;
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		margin: 0 20px;
		text-align: center;
	}
	#title--tr--container > td {
		width: 150px;
	}
	.table--tr--container > td {
		width: 150px;
	}
	
	.question--container {
		display: flex;
		flex-direction: column;
		width: 600px;

	}
	.answer--button {
		background-color: black;
		border: none;
		color: #fff;
		width: 150px;
		height: 40px;
		margin: 10px;
		cursor: pointer;
	}
	.date--container {
		border-bottom: 2px solid #FF9F8D;
		height: 30px;
		display: flex;
		align-items: flex-start;
	}
	.titleToggle--container {
		display: flex;
		border-bottom: 2px solid pink;
		height: 40px;
		justify-content: center;
		align-items: center;
	}
	.contentToggle--container {
		display: flex;
		flex-direction: column;
	}
	#qna--title--box {
		width: 450px;
		margin-left: 30px;
	}
	#toggle-button {
		cursor: pointer;
	}
	#qna--content--box {
		height: 100px;
		padding: 10px;
	}
	#qna--reply--box {
		padding: 10px;
	}
	.total--container {
		margin-top: 100px;
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