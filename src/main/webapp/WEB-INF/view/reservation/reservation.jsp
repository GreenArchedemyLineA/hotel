<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.facilities--container {
	display: flex;
}
</style>
</head>
<body>
	<form name="form" action="/reserveRoom" method="post">
		객실 : ${selectDetail.name} 체크인 : ${selectDetail.startDate} 체크아웃 : ${selectDetail.endDate} 투숙인원 : 성인 ${selectDetail.countPerson}, 어린이 ${selectDetail.countChild}, 유아 ${selectDetail.countBaby} <br />
		다이닝신청 (조식)
		<div class="facilities--container">
			<input type="button" onclick='diningCount("minus")' value="-"> 
			<input type="number" id='diningResult' value="0" name="diningCount" min="0"> 
			<input type="button" onclick='diningCount("plus")' value="+">
		</div>

		스파신청
		<div class="facilities--container">
			<input type="button" onclick='spaCount("minus")' value="-"> 
			<input type="number" id='spaResult' value="0" name="spaCount" min="0"> 
			<input type="button" onclick='spaCount("plus")' value="+">
		</div>

		수영장신청
		<div class="facilities--container">
			<input type="button" onclick='poolCount("minus")' value="-"> 
			<input type="number" id='poolResult' value="0" name="poolCount" min="0"> 
			<input type="button" onclick='poolCount("plus")' value="+">
		</div>

		피트니스신청
		<div class="facilities--container">
			<input type="button" onclick='fitnessCount("minus")' value="-"> 
			<input type="number" id='fitnessResult' value="0" name="fitnessCount" min="0"> 
			<input type="button" onclick='fitnessCount("plus")' value="+">
		</div>
		<input type="hidden" value="${selectDetail.startDate}" name="startDate"> 
		<input type="hidden" value="${selectDetail.endDate}" name="endDate"> 
		<input type="hidden" value="${selectDetail.numberOfP}" name="numberOfP"> 
		<input type="hidden" value="${selectDetail.roomId}" name="roomId"> 
		

		<div>
			사용 가능 쿠폰
			<c:choose>
				<c:when test="${couponList != null}">
					<select id="coupon--result">
						<option value="0">쿠폰을 선택하세요</option>
						<c:forEach var="couponList" items="${couponList}">
							<option value="${couponList.name}">${couponList.name}</option>
						</c:forEach>
					</select>
				</c:when>
				<c:otherwise>
					<select>
						<option value="0">쿠폰을 선택하세요</option>
						<option value="0">사용 가능한 쿠폰이 없습니다.</option>
					</select>
				</c:otherwise>
			</c:choose>

			포인트 사용하기 
			<input type="text" name="point" placeholder="사용 가능 포인트 : ${point.point}" id="point--result" autocomplete="off">
		</div>
		<div id="totalPrice"></div>
		<button type="submit">결제하기</button>
	</form>
</body>


<!-- <script src="/js/price.js"></script> -->
<script type="text/javascript">
	let searchParamsDate = (new URL(document.location)).searchParams;
	let startDatejs = searchParamsDate.get("startDate");
	let endDatejs = searchParamsDate.get("endDate");
	
	let startDatejsArray = startDatejs.split("-");
	let endDatejsArray = endDatejs.split("-");
	
	let startDateSeconds = new Date(startDatejsArray[0], startDatejsArray[1]-1, startDatejsArray[2]);
	let endDateSeconds = new Date(endDatejsArray[0], endDatejsArray[1]-1, endDatejsArray[2]);
	
	let day = (endDateSeconds-startDateSeconds) /1000 / 60 / 60 / 24
	
	const diningPrice = ${diningPrice};
	const spaPrice = ${spaPrice};
	const poolPrice = ${poolPrice};
	const fitnessPrice = ${fitnessPrice};
	
	
	const roomPrice = ${selectDetail.price} * (day-1);
	const totalPriceTag = document.getElementById("totalPrice");
	
	const diningDivTag = document.getElementById('diningResult')
	const spaDivTag = document.getElementById('spaResult')
	const poolDivTag = document.getElementById('poolResult')
	const fitnessDivTag = document.getElementById('fitnessResult')
	
	const couponSelectTag =  document.getElementById('coupon--result')
	
	const pointSelectTag =  document.getElementById('point--result')
	const tagetDivArray = [diningDivTag, spaDivTag, poolDivTag, fitnessDivTag, couponSelectTag, pointSelectTag]
	
	let couponPrice = 0;
	let pointPrice = 0;
	
	// 예약 날짜
	const startDate = ${selectDetail.startDate};
	const endDate = ${selectDetail.endDate};
	let nights = endDate - startDate;
	console.log(startDate);
		
	// 총 계산
	function totalPrice(){
		while(totalPriceTag.firstChild)  {
			totalPriceTag.firstChild.remove()
		  }
		let diningPriceResult = parseInt(diningDivTag.value) * diningPrice;
		let spaPriceResult = parseInt(spaDivTag.value) * spaPrice;
		let poolPriceResult = parseInt(poolDivTag.value) * poolPrice;
		let fitnessPriceResult = parseInt(fitnessDivTag.value) * fitnessPrice;
		
		
		
		const roomPriceTag = document.createElement("div");
		roomPriceTag.textContent = "방 가격: " + roomPrice;
		
		const optionPriceTag = document.createElement("div");
		const optionPrice = diningPriceResult + spaPriceResult + poolPriceResult + fitnessPriceResult;
		optionPriceTag.textContent = "옵션 가격: " + optionPrice;
		
		const couponPriceTag = document.createElement("div");		
		couponPriceTag.textContent = "쿠폰 할인 가격: " + couponPrice;
		
		const pointPriceTag = document.createElement("div");
		pointPriceTag.textContent = "포인트 사용 가격: " + pointPrice;
		
		let totalPrice = roomPrice + optionPrice - couponPrice - pointPrice;			

		
		const totalDivTag = document.createElement("input");
		totalDivTag.setAttribute("type", "text");
		totalDivTag.setAttribute("name", "totalPrice");
		totalDivTag.value = totalPrice;
		
		totalPriceTag.append(roomPriceTag);
		totalPriceTag.append(optionPriceTag);
		totalPriceTag.append(couponPriceTag);
		totalPriceTag.append(pointPriceTag);
		totalPriceTag.append(totalDivTag);
		totalPriceTag.append(couponSelectTag);
		totalPriceTag.append(pointSelectTag);
	}
	
	couponSelectTag.addEventListener("change", ()=>{
		if(couponSelectTag.value === '1박 무료 숙박 쿠폰') {
			couponPrice = ${selectDetail.price}
			console.log("couponPrice: " + couponPrice)
		}
		else if(couponSelectTag.value === "0"){
			couponPrice = 0;
		}
		
	})
	
	pointSelectTag.addEventListener("change", ()=> {
		pointPrice = pointSelectTag.value
	});
	
	
	console.log(tagetDivArray)
	tagetDivArray.forEach((target)=>{
		target.addEventListener("change", totalPrice);
	})
	
	function diningCount(type) {
		const resultElement = document.getElementById('diningResult');
		// 현재 화면에 표시된 값
		let number = resultElement.innerText;
		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus') {
			number = parseInt(number) - 1;
		}
		resultElement.innerText = number;
	}
	
	function spaCount(type) {
		const resultElement = document.getElementById('spaResult');
		// 현재 화면에 표시된 값
		let number = resultElement.innerText;
		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus') {
			number = parseInt(number) - 1;
		}
		resultElement.innerText = number;
	}
	
	function poolCount(type) {
		const resultElement = document.getElementById('poolResult');
		// 현재 화면에 표시된 값
		let number = resultElement.innerText;
		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus') {
			number = parseInt(number) - 1;
		}
		resultElement.innerText = number;
	}
	
	function fitnessCount(type) {
		const resultElement = document.getElementById('fitnessResult');
		// 현재 화면에 표시된 값
		let number = resultElement.innerText;
		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus') {
			number = parseInt(number) - 1;
		}
		resultElement.innerText = number;
	}
	
	totalPrice();
</script>
</html>