<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<style>
 .room--container {
 	display: flex;
 	flex-direction: column;
 }
 .sub--button {
 	width: 200px;
 }
</style>
<body>
	<div>
		<div id="startDate">
		체크인 : ${searchDto.startDate}
		</div>
		<div id="endDate">
		체크아웃 : ${searchDto.endDate}
		</div>
		<div id="countPerson">
		${searchDto.countPerson}
		</div>
		<div id="countChild">
		${searchDto.countChild}
		</div>
		<div id="countBaby">
		${searchDto.countBaby}
		</div>
	</div>
	<div class="room--container">
		<c:forEach var="room" items="${roomList}">
			${room.name} 
			${room.price} 
			<button class="sub--button" 
			onclick=
			"clickResBtn('${searchDto.startDate}', '${searchDto.endDate}','${searchDto.numberOfP}', '${room.id}', '${room.price}','${room.name}', '${searchDto.countPerson}', '${searchDto.countChild}', '${searchDto.countBaby}')">예약하기</button> <br />
		</c:forEach>
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