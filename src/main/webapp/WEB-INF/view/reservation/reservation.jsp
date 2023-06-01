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
	padding: 10px;
	border-right: 1px solid #ccc;
	justify-content: space-around;
}
.info--container {
	display: flex;
	flex: 1;
	flex-direction: column;
	height: 100%;
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
}

.count--box {
	width: 100px;
}

#totalPrice {
	display: flex;
	flex-direction: column;
	width: 100%;
	align-items: center;
}

.check--in--box {
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
	width: 250px;
	height: 150px;
	border-right: 2px solid #ccc;
}

.check--out--box {
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
	width: 250px;
	height: 150px;
}

#date--box {
	border: 2px solid #ccc;
	border-radius: 10px;
	justify-content: space-evenly;
	position: relative;
}

#day--count{
	position: absolute;
	top: 56px;
    right: 282px;
    background-color: #64c5f3;
    color: #fff;
    border-radius: 10px;
    width: 50px;
    text-align: center;
}

.icon--box {
	display: flex;
	height: 100%;
	align-items: center;
}

.facilities--detail--option {
	display: flex;
}

#total--price--input {
	border: none;
}

input[type=number]:focus {
	outline: none;
}

input[type=text]:focus {
	outline: none;
}

select:focus {
	outline: none;
}

.room--price {
	display: flex;
	justify-content: space-between;
	width: 300px;
	font-size: 20px;
	margin-bottom: 10px;
	margin-top: 150px;
}
.option--price {
	display: flex;
	justify-content: space-between;
	width: 300px;
	font-size: 20px;
	margin-bottom: 20px;
}
.coupon--price {
	display: flex;
	flex-direction: column;
	width: 100%;
	align-items: center;
	border-top: 1px solid #ccc;
	position: relative;
}

#coupon--text{
	position: absolute;
	left: 34px;
    top: -16px;
    background-color: #fff;
    font-size: 20px;
}

#coupon--price--info {
	display: flex;
	justify-content: space-between;
	width: 300px;
	font-size: 18px;
	margin-bottom: 10px;
}

#coupon--result {
	width: 300px;
	margin-top: 50px;
}

.point--price {
	display: flex;
	flex-direction: column;
	width: 100%;
	align-items: center;
}

#point--price--info {
	display: flex;
	justify-content: space-between;
	width: 300px;
	font-size: 18px;
	margin-bottom: 20px;
}

#point--result {
	width: 300px;
}

.total--price {
	display: flex;
	justify-content: space-between;
	width: 300px;
	font-size: 20px;
	margin-top: 100px;
}

#total--price--input {
	width: 100px;
	text-align: end;
}

#diningResult {
	border: none;
    text-align: center;
}

#poolResult {
	border: none;
    text-align: center;
}

#spaResult {
	border: none;
    text-align: center;
}

#fitnessResult {
	border: none;
    text-align: center;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
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
				
				<div class="facilities--info--box" id="date--box">
					<div class="check--in--box">
						<div class="info--title">체크인</div>
						<div class="info--content">${selectDetail.startDate} 15:00</div>
					</div>
					<div class="check--out--box">
						<div class="info--title">체크아웃</div>
						<div class="info--content">${selectDetail.endDate} 11:00</div>
					</div>
					<div id="day--count"></div>
				</div>
				
				<div class="facilities--info--box">
					<div class="info--title">투숙인원</div>
					<div class="info--content">성인 ${selectDetail.countPerson}, 어린이 ${selectDetail.countChild}, 유아 ${selectDetail.countBaby}</div>
				</div>
			</div>
			<input type="hidden" value="${selectDetail.startDate}" name="startDate"> 
			<input type="hidden" value="${selectDetail.endDate}" name="endDate"> 
			<input type="hidden" value="${selectDetail.numberOfP}" name="numberOfP"> 
			<input type="hidden" value="${selectDetail.roomId}" name="roomId"> 
			<input type="hidden" name="day" id="day--result">
		<div>
			<div class="facilities--detail">
				<div class="facilities--detail--title">
					다이닝신청 (조식)
				</div>
				<!--  <input type="button" onclick='diningCount("minus")' value="-">-->
				<div class="facilities--detail--option">
					<div class="icon--box">
						<span class="material-symbols-outlined symbol">do_not_disturb_on</span>
					</div>
					<input type="number" id='diningResult' value="0" name="diningCount" min="0" class="count--box">
					<div class="icon--box">
						<span class="material-symbols-outlined symbol">add_circle</span>
					</div> 
				</div>
			</div>
	
			<div class="facilities--detail">
				<div class="facilities--detail--title">
					스파신청
				</div>
				<div class="facilities--detail--option">
					<div class="icon--box">
						<span class="material-symbols-outlined symbol">do_not_disturb_on</span>
					</div>
					<input type="number" id='spaResult' value="0" name="spaCount" min="0" class="count--box">
					<div class="icon--box">
						<span class="material-symbols-outlined symbol">add_circle</span>
					</div>  
				</div>
			</div>
	
			<div class="facilities--detail">
				<div class="facilities--detail--title">
					수영장신청
				</div>
				<div class="facilities--detail--option">
					<div class="icon--box">
						<span class="material-symbols-outlined symbol">do_not_disturb_on</span>
					</div>
					<input type="number" id='poolResult' value="0" name="poolCount" min="0" class="count--box">
					<div class="icon--box">
						<span class="material-symbols-outlined symbol">add_circle</span>
					</div> 
				</div>
			</div>
	
			<div class="facilities--detail">
				<div class="facilities--detail--title">
					피트니스신청
				</div>
				<div class="facilities--detail--option">
					<div class="icon--box">
						<span class="material-symbols-outlined symbol">do_not_disturb_on</span>
					</div>
					<input type="number" id='fitnessResult' value="0" name="fitnessCount" min="0" class="count--box">
					<div class="icon--box">
						<span class="material-symbols-outlined symbol">add_circle</span>
					</div> 
				</div>
			</div>
		</div>
		 
		</div>
		
		<div class="info--container">			
			<div id="totalPrice">
				<div id="select--box--wrap">
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
				</div>
			</div>
			<button type="submit" class="sub--button">결제하기</button>
		</div>
	</form>
	</div>
<!-- <script src="/js/price.js"></script> -->
<script type="text/javascript">
	const dayResultInput = document.getElementById("day--result");
	const dayCountDiv = document.getElementById("day--count");
	
	let searchParamsDate = (new URL(document.location)).searchParams;
	let startDatejs = searchParamsDate.get("startDate");
	let endDatejs = searchParamsDate.get("endDate");
	
	let startDatejsArray = startDatejs.split("-");
	let endDatejsArray = endDatejs.split("-");
	
	let startDateSeconds = new Date(startDatejsArray[0], startDatejsArray[1]-1, startDatejsArray[2]);
	let endDateSeconds = new Date(endDatejsArray[0], endDatejsArray[1]-1, endDatejsArray[2]);
	
	let day = (endDateSeconds-startDateSeconds) /1000 / 60 / 60 / 24
	
	dayResultInput.value = day;
	dayCountDiv.textContent = day + "박";
	
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
		const roomPriceNameTag = document.createElement("div");
		const roomPriceNumTag = document.createElement("div");
		roomPriceTag.className = "room--price";
		roomPriceNameTag.textContent = "객실 금액:";
		roomPriceNumTag.textContent = roomPrice;
		roomPriceTag.append(roomPriceNameTag);
		roomPriceTag.append(roomPriceNumTag);
		
		
		const optionPriceTag = document.createElement("div");
		const optionPriceNameTag = document.createElement("div");
		const optionPriceNumTag = document.createElement("div");
		optionPriceTag.className = "option--price";
		const optionPrice = diningPriceResult + spaPriceResult + poolPriceResult + fitnessPriceResult;
		optionPriceNameTag.textContent = "옵션 금액:";
		optionPriceNumTag.textContent = optionPrice;
		optionPriceTag.append(optionPriceNameTag);
		optionPriceTag.append(optionPriceNumTag);
		
		const couponPriceTag = document.createElement("div");		
		const couponPriceNameTag = document.createElement("div");
		const couponPriceNumTag = document.createElement("div");
		const couponPriceInfoTag = document.createElement("div");
		const couponTextTag = document.createElement("div");
		couponTextTag.textContent = "할인";
		couponTextTag.id = "coupon--text";
		couponPriceTag.className = "coupon--price";
		couponPriceInfoTag.id = "coupon--price--info";
		couponPriceNameTag.textContent = "쿠폰 할인 금액:";
		couponPriceNumTag.textContent = couponPrice;
		couponPriceTag.append(couponSelectTag);
		couponPriceInfoTag.append(couponPriceNameTag);
		couponPriceInfoTag.append(couponPriceNumTag);
		couponPriceTag.append(couponPriceInfoTag);
		couponPriceTag.append(couponTextTag);
		
		const pointPriceTag = document.createElement("div");
		const pointPriceNameTag = document.createElement("div");
		const pointPriceNumTag = document.createElement("div");
		const pointPriceInfoTag = document.createElement("div");
		pointPriceTag.className = "point--price";
		pointPriceInfoTag.id = "point--price--info";
		pointPriceNameTag.textContent = "포인트 사용 금액:";
		pointPriceNumTag.textContent = pointPrice;
		pointPriceInfoTag.append(pointPriceNameTag);
		pointPriceInfoTag.append(pointPriceNumTag);
		pointPriceTag.append(pointSelectTag);
		pointPriceTag.append(pointPriceInfoTag);
		
		let totalPrice = roomPrice + optionPrice - couponPrice - pointPrice;			

		const totalPriceDivTag = document.createElement("div");
		totalPriceDivTag.className = "total--price";
		const totalPriceNameTag = document.createElement("div");
		totalPriceNameTag.textContent = "총 결제 금액: ";
		const priceDivBox = document.createElement("div");
		const totalDivTag = document.createElement("input");
		const priceSpanTag = document.createElement("span");
		priceSpanTag.textContent = "원";
		totalDivTag.setAttribute("type", "text");
		totalDivTag.id = "total--price--input";
		totalDivTag.setAttribute("name", "totalPrice");
		totalDivTag.setAttribute("readonly", "readonly");
		totalDivTag.value = totalPrice;
		priceDivBox.append(totalDivTag);
		priceDivBox.append(priceSpanTag);
		totalPriceDivTag.append(totalPriceNameTag);
		totalPriceDivTag.append(priceDivBox);
		
		totalPriceTag.append(roomPriceTag);
		totalPriceTag.append(optionPriceTag);
		totalPriceTag.append(couponPriceTag);
		totalPriceTag.append(pointPriceTag);
		totalPriceTag.append(totalPriceDivTag);
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
<%@ include file="../layout/footer.jsp"%>
