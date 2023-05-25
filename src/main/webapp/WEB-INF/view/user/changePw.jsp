<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>change_pw Page</title>
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
	flex: 3;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.form--container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border: 1px solid pink;
	margin-bottom: 10px;
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
		<a onclick="history.back()"><span class="material-symbols-outlined">arrow_back</span></a> <img alt="" src="/images/logo_white.png">
		<p>비밀번호 변경</p>
	</div>
	<div class="content--container">
		<form action="/changePwProc" method="post" class="form--container">
			<input type="password" name="currentPwd" placeholder="현재 비밀번호를 입력해주세요" class="input--box">
			<input type="password" name="changePwd" placeholder="변경할 비밀번호를 입력해주세요" class="input--box">
			<input type="password" name="checkChangePwd" placeholder="비밀번호를 한번 더 입력해주세요" class="input--box">
			<button type="submit" class="sub--button">pw 변경</button>
		</form>
	</div>
</main>
</body>
</html>