<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<style>
.reserve--container {
	display: flex;
	justify-content: center;
	padding: 50px;
	font-size: 20px;
}
.image--1 {
	width: 100%;
	height: 400px;
}
.recommend--container {
	margin: 10px;
	padding: 10px;
	display: flex;
	justify-content: center;
}
.room--box {
	display: flex;
	flex-direction: column;
	margin: 0 50px;

}
.title--container {
	text-align: center;
	margin: 30px;
	font-size: 20px;
	font-weight: bold;
}
</style>
<div class="reserve--container">
	<form action="../reserve" method="get">
		체크인 & 체크아웃 <input class="dateSelector" placeholder="Select Date" name="date">

		성인 
		<select name="countPerson">
			<option value="1">1</option>
			<option value="2">2</option>
		</select> 
		어린이 
		<select name="countChild">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
		</select> 
		유아 
		<select name="countBaby">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
		</select>
		<button type="submit">예약</button>
	</form>
</div>
<div class="image--container">
	<img alt="" src="/images/test.jpg" class="image--1">
</div>

<p class="title--container">도담 추천 프로모션<p>
<div class="recommend--container">
	
	<div class="room--box">
		<img alt="" src="https://picsum.photos/200/200" class="">
		Sweet Moment
	</div>
	<div class="room--box">
		<img alt="" src="https://picsum.photos/200/200" class="">
		Sweet Moment
	</div>
	<div class="room--box">
		<img alt="" src="https://picsum.photos/200/200" class="">
		Sweet Moment
	</div>
</div>


<!-- 예약 달력 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
	var dateSelector = document.querySelector('.dateSelector')
	$(".dateSelector").flatpickr({
		enableTime : false,
		dateFormat : "Y-m-d",
		mode: "range",
	    minDate: "today",
	});
</script>


