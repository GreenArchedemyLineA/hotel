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
			<img alt="로고이미지" src="/images/logo.png" id="logo">
		</div>
			<ul class="header--ul">
				<li><a href="/manager/"><span class="material-symbols-outlined">login</span>회원조회</a></li>
				<li><a href="#"><span class="material-symbols-outlined">person</span>마이페이지</a></li>
				<li><a href="#"><span class="material-symbols-outlined">card_membership</span>멤버쉽</a></li>
			</ul>
	</div>
	<div class="navi--container">
		<ul class="navi--ul">
			<li>객실</li>
			<li>다이닝</li>
			<li>부대시설</li>
			<li>예약</li>
			<li>FAQ</li>
		</ul>
	</div>
	