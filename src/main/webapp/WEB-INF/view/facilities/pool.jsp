<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<span class="detail--box selected--menu"><a href="/pool">수영장</a></span>
					<span class="detail--box"><a href="/spa">스파</a></span>
				</div>
		</div>
	<div class="main--container">
		<div>
			<img alt="" src="/images/pool.jpg" style="width: 1000px; height: 500px;">
				<div class="info--outline">
					<p class="title--box"> ${pool.facilities.name}</p>
					<p class="desc--box"> ${pool.facilities.location}</p>
				</div>
				<div class="desc--box--2">
					<p> ${pool.hours}</p>
				</div>
				<span class="info--title--desc"> ${pool.facilitiesDesc.titleDesc}</span>
				<div class="desc--box--3">
					<div class="info--title">
					<p> ${pool.facilitiesDesc.contentDesc1}</p>
					</div>
				<div class="info--content">
					<p> ${pool.facilitiesDesc.contentDesc2}</p>
					<p> ${pool.facilitiesDesc.contentDesc3}</p>
					<p> ${pool.facilitiesDesc.contentDesc4}</p>
					<p> ${pool.facilitiesDesc.contentDesc5}</p>
					<p> ${pool.facilitiesDesc.contentDesc6}</p>
					<p> ${pool.facilitiesDesc.contentDesc7}</p>
				</div>
		</div>
	</div>
</div>
</div>

</body>
</html>