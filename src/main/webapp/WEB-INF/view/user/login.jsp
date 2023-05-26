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
		min-width: 250px;
	}
	
	.content--container {
		flex: 3;
		
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
		width: 300px;
		height: 40px;
		margin: 20px;
		cursor: pointer;
	}
	.check--box {
		width: 100%;
		text-align: center;
		
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
	}
	#kakao--button {
		margin-bottom: 50px;
	}
</style>
</head>
<main class="main--container">
	<div class="title--container">
		<div class="title--logo">
			<a onclick="history.back()"><span class="material-symbols-outlined">arrow_back</span></a>
			<img alt="" src="/images/logo_white.png" id="logo--image">	
		</div>
		<div class="title--text">
			<p>로그인</p>
			<p>하세요</p>
		</div>
	</div>
	<div class="content--container">
		<form action="/loginProc" method="post" class="form--container">
			<input type="email" name="email" placeholder="이메일을 입력해 주세요" class="input--box"> 
			<input type="password" name="password" placeholder="비밀번호를 입력해 주세요" class="input--box"> 
			<div class="check--box"><input type="checkbox"> ID 저장 </div>
			<button type="submit" class="sub--button">로그인</button>
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=9b1b097488dc5873535e6b706d20920d&redirect_uri=http://localhost:8080/auth/kakaoLogin&response_type=code" id="kakao--button"><img alt="" src="/images/kakao_login_medium_wide.png"></a>
			<p> 아직 도담 회원이 아니세요? </p>
			<p> 회원가입하고 도담의 다양한 혜택을 누려보세요 </p>
			<button type="button" class="join--button" onclick="location.href='/join'">회원가입</button>
			<button type="button" class="find--button" onclick="location.href='/findIdPw'">아이디/비밀번호 찾기</button>
		</form>
	</div>
</main>
</body>
</html>