<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style type="text/css">
@import
url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&display=swap');
* {
	font-family: 'Noto Sans KR', monospace;
	margin: 0;
}
.main--container {
	display: flex;
	height: 100vh;
}
.title--container {
	flex: 1;
	background-color: #1F5B25;
	color: white;
}
.content--container {
	flex: 2;
}
.title--top {
	display: flex;
	justify-content: center;
	margin: 10px 0 150px 0;
}
#symbol {
	font-size: 50px;
	margin: 30px 10px 0 0;
	color: #fff;
}
.title--p {
	font-size: 60px;
	display: flex;
	flex-direction: column;
	text-align: end;
	margin-right: 50px;
}
</style>
</head>
<body>
<main class="main--container">
	<div class="title--container">
		<div class="title--top">
			<a href="/"><span class="material-symbols-outlined" id="symbol">arrow_back</span></a>
			<a href="/"><img alt="" src="/images/logo_white.png"></a>
		</div>
		<p class="title--p">로그인</p>
		<p class="title--p">하세요</p>
	</div>
	<div class="content--container">
		<form action="/loginProc" method="post">
			<input type="email" name="email" placeholder="이메일을 입력해 주세요" class="input--box"> 
			<input type="password" name="password" placeholder="비밀번호를 입력해 주세요" class="input--box"> 
			<button type="submit" class="sub--button">로그인</button>
		</form>
	</div>
</main>

</body>
</html>