<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/navi.css" />
<style>
</style>
<div class="body--container">
	<div class="navi--bar">
		<ul class="navi--bar--ul">
			<li><a href="/facilities">부대시설 소개</a></li>
			<li><a href="/pool">수영장</a></li>
			<li class="selected--menu"><a href="/spa">스파</a></li>
			<li><a href="/fitness">피트니스</a></li>
		</ul>
	</div>
	<div class="main--container">
		<div>
			<a href="#"> <img alt="" src="https://picsum.photos/id/169/1000/500">
			</a> <a href="#">
				<p>수용 가능 인원 : ${spa.facilities.name}</p>
				<p>수용 가능 인원 : ${spa.hours}</p>
				<p>수용 가능 인원 : ${spa.facilitiesDesc.titleDesc}</p>
			</a>
		</div>
</div>
<form></form>
</div>

</body>
</html>