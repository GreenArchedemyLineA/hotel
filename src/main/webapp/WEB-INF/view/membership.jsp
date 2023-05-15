<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>
<style>
	* {
	font-family: 'Noto Sans KR', monospace;
	}
	.body--container {
		display: flex;
	}
	.navi--bar {
		background-color: #D0DFBE;
		width: 300px;
		height: 500px;
		padding: 20px;
		margin: 30px;
		border-radius: 10px;
	}
	.navi--bar--ul {
		padding: 0;
	}
	.navi--bar--ul li{
		text-align: center;
		list-style: none;
		font-size: 20px;
		padding: 15px 0;
	}
	.main--container {
		background-color: beige;
		width: 100%;
		display: flex;
		justify-content: center;
	}
</style>
<div class="body--container">
	<div class="navi--bar">
		<ul class="navi--bar--ul">
			<li>멤버쉽 소개</li>
			<li>멤버쉽 가입</li>
		</ul>
	</div>
	<div class="main--container">
		도담 멤버쉽을 소개합니다
	연회비 : 50만원
	가입 시, 1박 무료 숙박 쿠폰 제공
	멤버쉽 전용 패키지 이용 가능
	</div>
	<form></form>
</div>
</body>
</html>