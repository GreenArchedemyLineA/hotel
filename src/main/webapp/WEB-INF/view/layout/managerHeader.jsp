<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="/css/header.css"/>
<style>

</style>
</head>
<body>
	<div class="header--container">
		<div>
			<a href="/manager/managerMain"><img alt="로고이미지" src="/images/logo.png" id="logo"></a>
		</div>
			<ul class="header--ul">
				<li><a href="/manager/userList"><span class="material-symbols-outlined">person</span>회원조회</a></li>
				<li><a href="/event/notice"><span class="material-symbols-outlined">event</span>호텔 일정</a></li>
				<li><a href="/manager/managerLogout"><span class="material-symbols-outlined">logout</span>로그아웃</a></li>
			</ul>
	</div>
	<div class="navi--container">
		<ul class="navi--ul">
			<li><a href="/manager/roomStatus">객실</a></li>
			<li>다이닝</li>
			<li><a href="/manager/reservation">예약</a></li>
			<li><a href="/question/questionList">문의 사항</a></li>
			<li><a href="/manager/faq">FAQ</a></li>
		</ul>
	</div>
	