<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/navi.css" />
<style>
</style>
<body>
	<div class="body--container">
		<div class="navi--bar">
			<span class="title--box"><a href="/dining">다이닝</a></span>
				<div>
					<span class="detail--box"><a href="/dining?type=레스토랑">레스토랑</a></span>
					<span class="detail--box"><a href="/dining?type=라운지">라운지 & 바</a></span>
					<span class="detail--box"><a href="/fitness">피트니스</a></span>
					<span class="detail--box"><a href="/pool">수영장</a></span>
					<span class="detail--box selected--menu"><a href="/spa">스파</a></span>
				</div>
		</div>
	<div class="main--container">
		<div>
			<img alt="" src="/images/spa.jpg" style="width: 1000px; height: 500px;">
				<div class="info--outline">
					<p class="title--box"> ${spa.facilities.name}</p>
					<p class="desc--box"> ${spa.facilities.location}</p>
				</div>
				<div class="desc--box--2">
					<p> ${spa.hours}</p>
				</div>
				<span class="info-title--desc"> ${spa.facilitiesDesc.titleDesc}</span>
				<div class="desc--box--3">
					<div class="info--title">
					<p> ${spa.facilitiesDesc.contentDesc1}</p>
				</div>
				<div class="info--content">
					<p> ${spa.facilitiesDesc.contentDesc2}</p>
					<p> ${spa.facilitiesDesc.contentDesc3}</p>
					<p> ${spa.facilitiesDesc.contentDesc4}</p>
					<p> ${spa.facilitiesDesc.contentDesc5}</p>
					<p> ${spa.facilitiesDesc.contentDesc6}</p>
					<p> ${spa.facilitiesDesc.contentDesc7}</p>
				</div>
		</div>
</div>
</div>
</div>
</body>
</html>