<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&display=swap')
	;

* {
	margin: 0;
	font-family: 'Noto Sans KR', monospace;
}
	.main--container {
		display: flex;
		
	}
	.title--container {
		flex: 1;
		background-color: #1F5B25;
		height: 100vh;
		color: #fff;
	}
	.content--container {
		flex: 2;
		
	}
	.form--container {
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
		background-color: #1F5B25;
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
	}
</style>
<main class="main--container">
	<div class="title--container">
		<span class="material-symbols-outlined">arrow_back</span>
		<img alt="" src="/images/logo_white.png">
		<p>회원가입을</p>
		<p>시작해볼까요?</p>
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