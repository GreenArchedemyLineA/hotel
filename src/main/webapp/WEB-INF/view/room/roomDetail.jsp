<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/navi.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<style type="text/css">
</style>
<body>
	<div class="body--container">
		<div class="navi--bar">
			<span class="title--box"><a href="/room">객실</a></span>
				<div>
					<span class="detail--box"><a href="/room?type=디럭스">디럭스</a></span>
					<span class="detail--box"><a href="/room?type=프리미엄">프리미엄</a></span>
					<span class="detail--box"><a href="/room?type=스위트">스위트</a></span>
				</div>
		</div>
		<div class="main--container">
			<div class="swiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide"><img alt="객실 사진" src="/images/deluxe.jpg" width="1000px" height="500px"></div>
					<div class="swiper-slide"><img alt="객실 사진" src="/images/deluxe2.jpg" width="1000px" height="500px"></div>
					<div class="swiper-slide"><img alt="객실 사진" src="/images/deluxe3.jpg" width="1000px" height="500px"></div>
				</div>
			</div>
			
			<div class="info--container">
				<div class="title--box">
				<p>${room.name}</p>
				</div>
				<div class="desc--box--2">
					<p>${room.numberOfP} 인</p>
					<p>가격(1박 기준) : ${room.price}원</p>
				</div>
				<div class="desc--box3">
					<p>${room.description}</p>
				</div>
			</div>
			<div>		
			</div>
		</div>
	</div>
	<script src="js/mainToggle.js"></script>
	<script type="text/javascript">
		const swiper = new Swiper('.swiper', {
			  // Optional parameters
			  direction: 'vertical',
			  loop: true
		}
	</script>
</body>
</html>
