<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/navi.css" />
<link rel="stylesheet" href="/css/calender.css" />
<style>
 .room--container {
 	display: flex;
 	flex-direction: column;
 }
 .sub--button {
 	width: 200px;
 	cursor: pointer;
	background-color: #fff;
	border: 1px solid #ccc;
	margin: 5px;
 }
 #choose--box {
 	display: flex;
 	justify-content: center;
 	margin-bottom: 20px;
 }
 .date--container {
 	display: flex;
 	justify-content: center;
 	font-weight: bold;
 	font-size: 30px;
 	color: #fff;
 }
 .person--container, .button--container {
 	display: flex;
 	justify-content: center;
 	color: #fff;
 }
 .info--container {
 	width: 1000px;
 	display: flex;
 	flex-direction: column;
 	justify-content: center;
 	background-color: #64c5f3;
 	padding: 10px;
 }
 .person--box {
 	margin: 0 10px;
 }
</style>
<body>
	<div class="main--container">
		<div class="info--container">
			<span id="choose--box" style="font-size: 20px; color: #fff;"> <선택사항> </span>
			<div class="date--container">
				${searchDto.startDate}
				<span class="person--box">ㅡ</span>
				${searchDto.endDate}
			</div>
			<div class="person--container">
				<div id="countPerson" class="select--box">성인 ${searchDto.countPerson}인</div>
				<span class="person--box">|</span>
				<div id="countChild" class="select--box">어린이 ${searchDto.countChild}인</div>
				<span class="person--box">|</span>
				<div id="countBaby" class="select--box">유아 ${searchDto.countBaby}인</div>
			</div>
			<div class="button--container">
				<button onclick="history.back()" class="sub--button">변경하기</button>
			</div>
		</div>
		<div class="room--container">
			<c:forEach var="room" items="${roomList}">
				${room.roomType.name} 
				${room.roomType.price} 
				<button class="sub--button" onclick="clickResBtn('${searchDto.startDate}', '${searchDto.endDate}','${searchDto.numberOfP}', '${room.id}', '${room.roomType.price}','${room.roomType.name}', '${searchDto.countPerson}', '${searchDto.countChild}', '${searchDto.countBaby}')">예약하기</button> <br />
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript">
		function clickResBtn(startDate, endDate, numberOfP, id, price, name, countPerson, countChild, countBaby) {
			let selectReserveDetail = {
				startDate: startDate,
				endDate: endDate,
				numberOfP: numberOfP,
				roomId: id,
				price: price,
				name: name,
				countPerson: countPerson,
				countChild: countChild,
				countBaby: countBaby
			}
			
			let searchParams = new URLSearchParams(selectReserveDetail);
			console.log(searchParams.toString());
			location.href='/reserveRoom?' + searchParams;
			
		}
	</script>

</body>
</html>