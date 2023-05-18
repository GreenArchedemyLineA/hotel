<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&display=swap');
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
</head>
<main class="main--container">
	<div class="title--container">
		<span class="material-symbols-outlined">arrow_back</span>
		<img alt="" src="/images/logo_white.png">
		<p>로그인 하세요</p>
	</div>
	<div class="content--container">
		<form action="/loginProc" method="post" class="form--container">
			<input type="email" name="email" placeholder="이메일을 입력해 주세요" class="input--box"> 
			<input type="password" name="password" placeholder="비밀번호를 입력해 주세요" class="input--box"> 
			<button type="submit" class="sub--button">로그인</button>
			<div class="check--box"><input type="checkbox"> ID 저장 </div>
			<p> 아직 도담 회원이 아니세요? </p>
			<p> 회원가입하고 도담의 다양한 혜택을 누려보세요 </p>
		</form>
			<button class="join--button" onclick="location.href='/join'">회원가입</button>
			<button class="find--button" onclick="location.href='/join'">아이디/비밀번호 찾기</button>
	</div>
</main>
</body>
</html>