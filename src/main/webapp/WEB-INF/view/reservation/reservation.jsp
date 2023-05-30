<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/navi.css" />
<link rel="stylesheet" href="/css/calender.css" />
<link rel="stylesheet" href="/css/myPage.css" />
<style type="text/css">
.form--box {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 700px;
	width: 1200px;
	border: 2px solid #64c5f3;
}
.facilities--container {
	display: flex;
	flex: 1;
	flex-direction: column;
	height: 100%;
	justify-content: center;
}
.info--container {
	display: flex;
	flex: 1;
	flex-direction: column;
	height: 100%;
	justify-content: center;
}
.facilities--detail {
	text-align: center;
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
}
.select--info {
	font-size: 20px;
	font-weight: bold;
	display: flex;
	flex-direction: column;
}
.input--box {
	border: none;
}
.symbol:hover {
	color: #FF9F8D;
	cursor: pointer;
}

.facilities--info--box {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid #ccc;
}

.count--box {
	width: 100px;
}

#totalPrice {
	display: flex;
	flex-direction: column;
}

</style>
</head>
<body>
	<div class="main--container">
	<form name="form" action="/reserveRoom" method="post" class="form--box">
		<div class="facilities--container">
			<div class="select--info">
				<div class="facilities--info--box">
					<div class="info--title">객실</div> 
					<div class="info--content">${selectDetail.name}</div>
				</div>
				
				<div class="facilities--info--box">
					<div class="info--title">체크인</div>
					<div class="info--content">${selectDetail.startDate} ~ ${selectDetail.endDate}</div>
				</div>
				
				<div class="facilities--info--box">
					<div class="info--title">투숙인원</div>
					<div class="info--content">성인 ${selectDetail.countPerson}, 어린이 ${selectDetail.countChild}, 유아 ${selectDetail.countBaby}</div>
				</div>
			</div>
		<div class="facilities--detail">
			<div class="facilities--detail--title">
				다이닝신청 (조식)
			</div>
			<!--  <input type="button" onclick='diningCount("minus")' value="-">-->
			<div class="facilities--detail--option">
				<span class="material-symbols-outlined symbol">do_not_disturb_on</span>
				<input type="number" id='diningResult' value="0" name="diningCount" min="0" class="count--box"> 
				<span class="material-symbols-outlined symbol">add_circle</span>
			</div>
		</div>

		<div class="facilities--detail">
			<div class="facilities--detail--title">
				스파신청
			</div>
			<div class="facilities--detail--option">
				<span class="material-symbols-outlined symbol">do_not_disturb_on</span>
				<input type="number" id='spaResult' value="0" name="spaCount" min="0" class="count--box">  
				<span class="material-symbols-outlined symbol">add_circle</span>
			</div>
		</div>

		<div class="facilities--detail">
			<div class="facilities--detail--title">
				수영장신청
			</div>
			<div class="facilities--detail--option">
				<span class="material-symbols-outlined symbol">do_not_disturb_on</span>
				<input type="number" id='poolResult' value="0" name="poolCount" min="0" class="count--box"> 
				<span class="material-symbols-outlined symbol">add_circle</span>
			</div>
		</div>

		<div class="facilities--detail">
			<div class="facilities--detail--title">
				피트니스신청
			</div>
			<div class="facilities--detail--option">
				<span class="material-symbols-outlined symbol">do_not_disturb_on</span>
				<input type="number" id='fitnessResult' value="0" name="fitnessCount" min="0" class="count--box"> 
				<span class="material-symbols-outlined symbol">add_circle</span>
			</div>
		</div>
		<input type="hidden" value="${selectDetail.startDate}" name="startDate"> 
		<input type="hidden" value="${selectDetail.endDate}" name="endDate"> 
		<input type="hidden" value="${selectDetail.numberOfP}" name="numberOfP"> 
		<input type="hidden" value="${selectDetail.roomId}" name="roomId"> 
		
		<div>
			<c:choose>
				<c:when test="${couponList != null}">
					<select id="coupon--result">
						<option value="0">쿠폰을 선택하세요</option>
						<c:forEach var="couponList" items="${couponList}">
							<option value="${couponList.couponInfo.name}">${couponList.couponInfo.name}</option>
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

			<input type="text" name="point" placeholder="사용 가능 포인트 : ${point.point}" id="point--result" autocomplete="off">
			<input type="hidden" name="day" id="day--result">
			</div>
		</div>
		
		<div class="info--container">			
			<div id="totalPrice"></div>
			<button type="submit" class="sub--button">결제하기</button>
		</div>
	</form>
	</div>
</body>


<!-- <script src="/js/price.js"></script> -->
<script type="text/javascript">
	const dayResultInput = document.getElementById("day--result");
	
	let searchParamsDate = (new URL(document.location)).searchParams;
	let startDatejs = searchParamsDate.get("startDate");
	let endDatejs = searchParamsDate.get("endDate");
	
	let startDatejsArray = startDatejs.split("-");
	let endDatejsArray = endDatejs.split("-");
	
	let startDateSeconds = new Date(startDatejsArray[0], startDatejsArray[1]-1, startDatejsArray[2]);
	let endDateSeconds = new Date(endDatejsArray[0], endDatejsArray[1]-1, endDatejsArray[2]);
	
	let day = (endDateSeconds-startDateSeconds) /1000 / 60 / 60 / 24
	
	dayResultInput.value = day;
	
	const diningPrice = ${diningPrice};
	const spaPrice = ${spaPrice};
	const poolPrice = ${poolPrice};
	const fitnessPrice = ${fitnessPrice};
	
	
	const roomPrice = ${selectDetail.price} * day;
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
		roomPriceTag.className = "room--price";
		roomPriceTag.textContent = "객실 금액: " + roomPrice;
		
		const optionPriceTag = document.createElement("div");
		optionPriceTag.className = "option--price";
		const optionPrice = diningPriceResult + spaPriceResult + poolPriceResult + fitnessPriceResult;
		optionPriceTag.textContent = "옵션 금액: " + optionPrice;
		
		const couponPriceTag = document.createElement("div");		
		couponPriceTag.className = "coupon--price";
		couponPriceTag.textContent = "쿠폰 할인 금액: " + couponPrice;
		
		const pointPriceTag = document.createElement("div");
		pointPriceTag.className = "point--price";
		pointPriceTag.textContent = "포인트 사용 금액: " + pointPrice;
		
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