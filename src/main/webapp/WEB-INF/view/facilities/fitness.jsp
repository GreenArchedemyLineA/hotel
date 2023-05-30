<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/navi.css" />
<style type="text/css">
</style>
</head>
<body>
	<div class="body--container">
		<div class="navi--bar">
			<span class="title--box"><a href="/dining">다이닝</a></span>
				<div>
					<span class="detail--box"><a href="/dining?type=레스토랑">레스토랑</a></span>
					<span class="detail--box"><a href="/dining?type=라운지">라운지 & 바</a></span>
					<span class="detail--box selected--menu"><a href="/fitness">피트니스</a></span>
					<span class="detail--box"><a href="/pool">수영장</a></span>
					<span class="detail--box"><a href="/spa">스파</a></span>
				</div>
		</div>
	<div class="main--container">
		<div>
		 <img alt="" src="/images/fitness.jpg" style="width: 1000px; height: 500px;">
		 	<div class="info--outline">
				<p class="title--box"> ${fitness.facilities.name}</p>
				<p class="desc--box"> ${fitness.facilities.location}</p>
		 	</div>
		 	<div class="desc--box--2">
				<p> ${fitness.hours}</p>
		 	</div>
				<span class="info--title--desc"> ${fitness.facilitiesDesc.titleDesc}</span>
				<div class="desc--box--3">
					<div class="info--title">
					<p> ${fitness.facilitiesDesc.contentDesc1}</p>
					</div>
				<div class="info--content">
					<p> ${fitness.facilitiesDesc.contentDesc2}</p>
					<p> ${fitness.facilitiesDesc.contentDesc3}</p>
					<p> ${fitness.facilitiesDesc.contentDesc4}</p>
					<p> ${fitness.facilitiesDesc.contentDesc5}</p>
				</div>
				</div>
				
		</div>
	</div>
</div>

</body>
</html>