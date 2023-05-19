<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		객실 : ${selectDetail.name} 체크인 : ${selectDetail.startDate} 체크아웃 : ${selectDetail.endDate} 투숙인원 : 성인 ${selectDetail.countPerson}, 어린이 ${selectDetail.countChild}, 유아 ${selectDetail.countBaby}
		<br/>
		다이닝신청 (조식)
		<div class="facilities--container">
			<input type="button" onclick='diningCount("minus")' value="-">
			<input type="number" id='diningResult' value="0" name="diningCount">
			<input type="button" onclick='diningCount("plus")' value="+">
		</div>
		
		스파신청
		<div class="facilities--container">
			<input type="button" onclick='spaCount("minus")' value="-">
			<input type="number" id='spaResult' value="0" name="spaCount">
			<input type="button" onclick='spaCount("plus")' value="+">
		</div>
		
		수영장신청
		<div class="facilities--container">
			<input type="button" onclick='poolCount("minus")' value="-">
			<input type="number" id='poolResult' value="0" name="poolCount">
			<input type="button" onclick='poolCount("plus")' value="+">
		</div>
		
		피트니스신청
		<div class="facilities--container">
			<input type="button" onclick='fitnessCount("minus")' value="-">
			<input type="number" id='fitnessResult' value="0" name="fitnessCount">
			<input type="button" onclick='fitnessCount("plus")' value="+">
		</div>
		<input type="hidden" value="${selectDetail.startDate}" name="startDate">
		<input type="hidden" value="${selectDetail.endDate}" name="endDate">
		<input type="hidden" value="${selectDetail.countPerson}" name="countPerson">
		<input type="hidden" value="${selectDetail.countChild}" name="countChild">
		<input type="hidden" value="${selectDetail.countBaby}" name="countBaby">
		<div id="totalPrice" >
		
		</div>
		<!-- 
		 <input type="hidden" value="${selectDetail.price}" name="room_price">
		객실 가격 : ${selectDetail.price} 원 <br/>
		 총 가격 : <input type="text" name="total_price"> 원 <br/>
		 -->
		<button type="submit">결제하기</button>
	</form>
</body>

<script type="text/javascript">
	
	const totalPriceTag = document.getElementById("totalPrice");
	
	const diningDivTag = document.getElementById('diningResult')
	const spaDivTag = document.getElementById('spaResult')
	const poolDivTag = document.getElementById('poolResult')
	const fitnessDivTag = document.getElementById('fitnessResult')
	
	const tagetDivArray = [diningDivTag, spaDivTag, poolDivTag, fitnessDivTag]
	// 가격표
	const diningPrice = ${diningPrice};
	const spaPrice = ${spaPrice};
	const poolPrice = ${poolPrice};
	const fitnessPrice = ${fitnessPrice};
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
		roomPriceTag.textContent = "방 가격: " + ${selectDetail.price};
		
		const optionPriceTag = document.createElement("div");
		const optionPrice = diningPriceResult + spaPriceResult + poolPriceResult + fitnessPriceResult;
		optionPriceTag.textContent = "옵션 가격: " + optionPrice;
		
		let totalPrice = ${selectDetail.price} + optionPrice;
		const totalDivTag = document.createElement("input");
		totalDivTag.setAttribute("type", "text");
		totalDivTag.setAttribute("name", "totalPrice");
		totalDivTag.value = totalPrice;
		
		totalPriceTag.append(roomPriceTag);
		totalPriceTag.append(optionPriceTag);
		totalPriceTag.append(totalDivTag);
	}
	
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