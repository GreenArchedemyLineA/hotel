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
header{
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 3em;
}
</style>
</head>
<body>
	<div class="main--container">
		<div class="facilities--container">
			<div class="select--info">
				<header>예약 내역</header>
				<div class="facilities--info--box">
					<div class="info--title">객실</div> 
					<div class="info--content">${successful.room.roomType.name}</div>
				</div>
				
				<div class="facilities--info--box" id="date--box">
					<div class="check--in--box">
						<div class="info--title">체크인</div>
						<div class="info--content">${successful.startDate} 15:00</div>
					</div>
					<div class="check--out--box">
						<div class="info--title">체크아웃</div>
						<div class="info--content">${successful.endDate} 11:00</div>
					</div>
					<div id="day--count"></div>
				</div>
				
				<div class="facilities--info--box">
					<div class="info--title">투숙인원</div>
					<div class="info--content">${successful.numberOfP} : 명</div>
				</div>
			</div>
		<div>
			<div class="facilities--detail">
				<div class="facilities--detail--title">
					다이닝
				</div>
				<div class="facilities--detail--option">
					<c:choose>
						<c:when test="${successful.diningId != null}">
							${successful.diningId} : 명
						</c:when>
						<c:otherwise>
						사용 안함
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="facilities--detail">
				<div class="facilities--detail--title">
				</div>
				</div>
			<div class="facilities--detail">
				<div class="facilities--detail--title">
					스파
				</div>
				<div class="facilities--detail--option">
					 <div class="facilities--detail--option">
					<c:choose>
						<c:when test="${successful.spaId != null}">
							${successful.spaId} : 명
						</c:when>
						<c:otherwise>
						사용 안함
						</c:otherwise>
					</c:choose>
				</div>
				</div>
			</div>
		<div class="facilities--detail">
				<div class="facilities--detail--title">
				</div>
				</div>
			<div class="facilities--detail">
				<div class="facilities--detail--title">
					수영장
				</div>
				<div class="facilities--detail--option">
					<c:choose>
						<c:when test="${successful.fitnessId != null}">
							${successful.fitnessId} : 명
						</c:when>
						<c:otherwise>
							사용 안함
						</c:otherwise>
					</c:choose>
				</div>
			</div>
				<div class="facilities--detail">
				<div class="facilities--detail--title">
					피트니스
				</div>
				<div class="facilities--detail--option">
					<c:choose>
						<c:when test="${successful.spaId != null}">
							${successful.spaId} : 명
						</c:when>
						<c:otherwise>
						사용 안함
						</c:otherwise>
					</c:choose>
				</div>
				</div>
			
		</div>
		</div>
		
		<div class="info--container">			
			<div>
				<fieldset>
					<legend>결제 방법 : ${payType.pgType}</legend>
				</fieldset>
				<fieldset>
					<legend>결제 금액 : ${payType.formatPrice()}</legend>
				</fieldset>
			</div>
			<button type="button" class="sub--button" onclick="main()">메인 으로</button>
		</div>
	</div>

<script type="text/javascript">
	function main(){
		location.href = "/"
	}
</script>
<!-- <script src="/js/price.js"></script> -->
<%@ include file="../layout/footer.jsp"%>

