<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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
			<p>회원가입을</p>
			<p>시작해볼까요?</p>
		</div>
	</div>
	<div class="content--container">
		<form action="/join" method="post" class="form--container">
		<input type="email" name="email" class="input--box" placeholder="이메일을 입력해 주세요"> 
		<input type="password" name="password" class="input--box" placeholder="비밀번호를 입력해 주세요"> 
		<input type="text" name="name" class="input--box" placeholder="이름을 입력해 주세요"> 
		<input type="date" name="birth" class="input--box" placeholder="출생년도"> 
		<div>
			<label><input type="radio" name="gender" value="남성">남성</label>
			<label><input type="radio" name="gender" value="여성">여성</label>
		</div>
		<input type="tel" name="tel" class="input--box" placeholder="전화번호를 입력해주세요">
		<button type="submit" class="sub--button">회원가입</button>
		</form>
	</div>
</main>
</body>
</html>