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
body{
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body class="container">
	<div class="content">
		<div class="img">
			<img alt="로고이미지" src="/images/logo.png" id="logo">
		</div>
		<div class="login-form">
			<form action="/manager/managerSignInProc" method="post">
				<label>매니저 아이디 : </label> 
				<input type="text" id="username" name="username" value="dodam@manager.com"> 
				<br>
				<label>매니저 비밀번호 : </label> 
				<input type="text" id="password" name="password" value="dodam1234">
				<br>
				<button type="submit">로그인</button>
			</form>
		</div>
	</div>
</body>
</html>