<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="/css/myPage.css" />
<style>
</style>
<main class="main--container">
	<div class="title--container">
		<div class="title--logo">
			<a onclick="history.back()"><span class="material-symbols-outlined">arrow_back</span></a>
			<img alt="" src="/images/logo_white.png" id="logo--image">
		</div>
		<div class="title--text">
			<p>추가 정보를</p>
			<p>알려주세요</p>
		</div>
	</div>
	<div class="content--container">
		<form action="/join" method="post" class="form--container">
			<c:choose>
				<c:when test="${user.email == null}">
					<input type="email" name="email" class="input--box" placeholder="이메일을 입력해 주세요"> 			
				</c:when>
				<c:otherwise>
					<input type="email" name="email" class="input--box" value="${user.email}" readonly="readonly"> 								
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${user.profile.nickname == null}">
					<input type="text" name="name" class="input--box" placeholder="이름을 입력해 주세요">  			
				</c:when>
				<c:otherwise>
					<input type="text" name="name" class="input--box" value="${user.profile.nickname}"> 								
				</c:otherwise>
			</c:choose>
			<input type="date" name="birth" class="input--box" placeholder="출생년도"> 
			<div>
				<label><input type="radio" name="gender" value="남성">남성</label>
				<label><input type="radio" name="gender" value="여성">여성</label>
			</div>
			<input type="tel" name="tel" class="input--box" placeholder=" - 을 포함한 전화번호를 입력해주세요">
			<button type="submit" class="sub--button">회원가입</button>
		</form>
	</div>
</main>
</body>
</html>