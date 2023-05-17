<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<style>
</style>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
     // $( document ).ready( function() {
      //  $( '.navi--ul' ).hover( function() {
      //    $( '.toggle--container' ).slideToggle('slow');
     //   } );
    //  } );
    </script>
</head>
<body>
	<div class="header--container">
			<ul class="header--ul">
				<li><a href="/login"><span class="material-symbols-outlined">login</span></a></li>
				<li><a href="/login">로그인</a></li>
				<li><a href="/myPage"><span class="material-symbols-outlined">person</span>마이페이지</a></li>
				<li><a href="/membership"><span class="material-symbols-outlined">card_membership</span>멤버쉽</a></li>
			</ul>
		<div class="logo--container">
			<a href="/">
			<img alt="로고이미지" src="/images/logo.png" id="logo">
			</a>
		</div>
	</div>
		<div class="navi--container">
		<ul class="navi--ul">
			<li><a href="/package">스페셜</a></li>
			<li><a href="/room">객실</a></li>
			<li><a href="/dining">다이닝</a></li>
			<li><a href="/facilities">부대시설</a></li>
			<li><a href="/reservePage">예약</a></li>
			<li><a href="/question">FAQ</a></li>
		</ul>
	</div>
	<div class="toggle--hidden--container">
		<div class="toggle--container">
			<ul class="toggle--ul">
				<li>패키지</li>
				<li>이벤트</li>
			</ul>
			<ul class="toggle--ul">
				<li>스탠다드</li>
				<li>프리미어</li>
				<li>스위트</li>
				<li>전체객실보기</li>
			</ul>
			<ul class="toggle--ul">
				<li>레스토랑</li>
				<li>라운지 & 바</li>
			</ul>
			<ul class="toggle--ul">
				<li>부대시설</li>
				<li>피트니스</li>
				<li>수영장</li>
				<li>스파</li>
			</ul>
			<ul class="toggle--ul">
				<li>예약</li>
				<li>다이닝</li>
			</ul>
			<ul class="toggle--ul">
				<li>자주묻는질문</li>
			</ul>	
		</div>	
	</div>

