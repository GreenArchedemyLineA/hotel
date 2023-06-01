<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
body {
	height: 100vh;
}
main {
	background-color: #64c5f3;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.img {
	display: flex;
	justify-content: center;
}

#login--box {
	display: flex;
	flex-direction: column;
	margin-top: 10px;
}
.sub--button {
		background-color: #fff;
		color: #000;
		width: 100%;
		height: 40px;
		cursor: pointer;
		border: none;
		border-radius: 5px;
	}
#username {
	width: 100%;
	margin-bottom: 5px;
	border-radius: 5px;
}
#password {
	width: 100%;
	margin-bottom: 10px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<main>
		<div class="content">
			<div class="img">
				<img alt="로고이미지" src="/images/adminLogo.png" id="logo">
			</div>
			<div class="login-form">
				<form action="/manager/managerSignInProc" method="post" id="login--box">
					<div class="id--box">
						<input type="text" id="username" name="username" value="dodam@manager.com" placeholder="아이디를 입력해주세요."> 
					</div>
					<div class="password--box">
						<input type="text" id="password" name="password" value="dodam1234" placeholder="비밀번호를 입력해주세요.">
					</div>
					<div class="btn--box">
						<button type="submit" class="sub--button">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</main>
<%@ include file="../layout/footer.jsp"%>
