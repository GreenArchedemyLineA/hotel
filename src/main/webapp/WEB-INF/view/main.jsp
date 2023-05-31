<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Caveat:wght@600&family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&family=WindSong:wght@500&display=swap');

* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

.navi--bar--1 {
	color: #fff;
	font-size: 20px;
	position: relative;
	padding-left: 30px;
}

.navi--bar--1 li a, .navi--bar--2 li a, .navi--bar--3 li a, .navi--bar--4 li a, .navi--bar--5 li a {
	color: #fff;
	text-decoration: none;
}
.navi--bar--1 li , .navi--bar--2 li , .navi--bar--3 li , .navi--bar--4 li , .navi--bar--5 li {
	list-style: none;
} 

.navi--bar--detail--room {
	margin-top: 20px;
	display: none;
	position: absolute;
	left: 20px;
}

#symbol {
	height: 30px;
}

.symbol--container {
	display: flex;
}

.reserve--container {
	display: flex;
	justify-content: center;
	font-size: 20px;
	background-color: rgba(255, 255, 255, 0.7);
	height: 120px;
	width: 100%;
}

.form--container {
	display: flex;
	padding: 30px;
	width: 1200px;
}

.form--container > table {
	width: 1200px;
	text-align: center;
	border-bottom: 1px solid #000;
}

.check--container {
	margin-right: 10px;
	display: flex;
	align-items: center;
	font-size: 27px;
}

#input--box {
	width: 100%;
	height: 50px;
	border: none;
	text-align: center;
}

.select--box {
	height: 30px;
	border: none;
	width: 100px;
	text-align: center;
}

.toggle--box--room:hover {
	cursor: pointer;
}

.greeting--container {
	color: #FF9F8D;
	font-size: 100px;
	font-weight: bolder;
	font-family: 'WindSong', cursive;
	display: flex;
	align-items: flex-end;
	height: 330px;
	justify-content: center;
}

.navi--bar--2 {
	color: #fff;
	font-size: 20px;
	position: relative;
	padding-left: 10px;
}

.navi--bar--detail--fac {
	margin-top: 20px;
	display: none;
	position: absolute;
	left: 2px;
}

.toggle--box--fac:hover {
	cursor: pointer;
}

.navi--bar--3 {
	color: #fff;
	font-size: 20px;
	position: relative;
}

.navi--bar--detail--reserve {
	margin-top: 20px;
	display: none;
	position: absolute;
}

.toggle--box--reserve:hover {
	cursor: pointer;
}

.navi--bar--4 {
	color: #fff;
	font-size: 20px;
	position: relative;
}

.navi--bar--detail--qna {
	margin-top: 20px;
	display: none;
	position: absolute;
	right: 55px;
}

.toggle--box--qna:hover {
	cursor: pointer;
}

.navi--bar--5 {
	color: #fff;
}

.symbol--box {
	display: flex;
}
.symbol--box li {
	padding-right: 30px;
}
.symbol--box a {
	color: #fff;
}

.image--1 {
	width: 100%;
	height: 600px;
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

.sub--button {
	margin: 0 20px;
	width: 120px;
	background-color: #FFF7D1;
	border: none;
	height: 50px;
}

main {
	background-image: url("http://localhost:8080/images/mainImage.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	height: 800px;
}

#header--wrap {
	display: flex;
	justify-content: space-between;
}

#nav--bar--wrap {
	display: flex;
	margin-top: 30px;
	margin-right: 10px;
}

#toggle--nav--bar {
	display: flex;
	width: 500px;
	text-align: center;
	margin-right: 20px;
}

#navi--1--wrap {
	flex: 1;
}
#navi--2--wrap {
	flex: 1;
}
#navi--3--wrap {
	flex: 1;
}
#navi--4--wrap {
	flex: 1;
}

#date--input--box {
	display: flex;
	align-items: center;
}

.count--container {
	display: flex;
	align-items: center;
	font-size: 27px;
}

#main--reserve--btn {
	display: flex;
	align-items: center;
}

#reserve--first--tr:nth-child(1) > td {
	width: 500px;
}

.down--icon {
	height: 28.89px;
	display: flex;
	align-items: center;
}

.toggle--wrap--room {
	display: flex;
	cursor: pointer;
}
.toggle--wrap--fac {
	display: flex;
	cursor: pointer;
}
.toggle--wrap--reserve {
	display: flex;
	cursor: pointer;
}
.toggle--wrap--qna {
	display: flex;
	cursor: pointer;
}

#reservation--toggle--wrap {
	padding-left: 22px;
}

#logo--image {
	cursor: pointer;
}

.membership--wrap {
	background-color: #f9f9f9;
	width: 1200px;
	height: 300px;
	display: flex;
	justify-content: space-evenly;
}

#gift--box {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	width: 300px;
}

#discount--box {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	width: 300px;
}

#point--box {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	width: 300px;
}

.membership--container {
	margin: 10px;
	padding: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: #f9f9f9;
	width: 100%;
	height: 300px;
}

.membership--icon{
	font-size: 50px;
}

.membership--desc {
	font-size: 18px;
}

#desc--btn {
	background-color: #000;
	color: #fff;
	border: none;
	width: 284px;
	height: 70px;
}

</style>


<main>
	<div id="header--wrap">
		<div>
			<img alt="로고 이미지" src="/images/dodam_wlogo.png" id="logo--image" width="400px" onclick="location.href='/'">
		</div>
		<div id="header--nav--wrap">
			<div id="nav--bar--wrap">
				<div id="toggle--nav--bar">
					<div id="navi--1--wrap">
						<ul class="navi--bar--1">
							<li>
								<div class="toggle--wrap--room">
									<p class="toggle--box--room"> 객실</p>
									<p class="material-symbols-outlined down--icon">keyboard_arrow_down</p>
								</div>
								<ul class="navi--bar--detail--room">
									<li><a href="/room?type=디럭스">디럭스</a></li>
									<li><a href="/room?type=프리미엄">프리미어</a></li>
									<li><a href="/room?type=스위트">스위트</a></li>
									<li><a href="/room">전체객실</a></li>
								</ul></li>
						</ul>
					</div>
					<div id="navi--2--wrap">
						<ul class="navi--bar--2">
							<li>
							<div class="toggle--wrap--fac">
								<p class="toggle--box--fac"> 부대시설</p>
								<p class="material-symbols-outlined down--icon">keyboard_arrow_down</p>
							</div>
								<ul class="navi--bar--detail--fac">
									<li><a href="/dining?type=레스토랑">레스토랑</a></li>
									<li><a href="/dining?type=라운지">라운지 & 바</a></li>
									<li><a href="/fitness">피트니스</a></li>
									<li><a href="/pool">수영장</a></li>
									<li><a href="/spa">스파</a></li>
								</ul></li>
						</ul>
					</div>
					<div id="navi--3--wrap">
						<ul class="navi--bar--3">
							<li>
							<div class="toggle--wrap--reserve" id="reservation--toggle--wrap">
								<p class="toggle--box--reserve"> 예약</p>
								<p class="material-symbols-outlined down--icon">keyboard_arrow_down</p>
							</div>
								<ul class="navi--bar--detail--reserve">
									<li><a href="/selectDate">객실예약</a></li>
									<li><a href="/reserveDining">다이닝예약</a></li>
								</ul></li>
						</ul>
					</div>
					<div id="navi--4--wrap">
						<ul class="navi--bar--4">
							<li>
							<div class="toggle--wrap--qna">
								<p class="toggle--box--qna"> 문의</p>
								<p class="material-symbols-outlined down--icon">keyboard_arrow_down</p>
							</div>
								<ul class="navi--bar--detail--qna">
									<li><a href="/question/question">FAQ</a></li>
									<li style="width: 100px;"><a href="/question/qnaPage">1:1 문의</a></li>
									<li><a href="/event/eventBoard/onGoing">이벤트</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
				<div class="navi--bar--5">
					<ul class="symbol--box">
						<c:choose>
							<c:when test="${principal != null}">
								<li><a href="/logout"><span class="material-symbols-outlined">logout</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/login"><span class="material-symbols-outlined">login</span></a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${principal != null}">
								<li><a href="/myPage"><span class="material-symbols-outlined">person</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/login"><span class="material-symbols-outlined">person</span></a></li>
							</c:otherwise>							
						</c:choose>
						
						<li><a href="/membership"><span class="material-symbols-outlined">card_membership</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</main>
	<div class="reserve--container">
		<form action="/search" method="get" class="form--container">
			<table>
				<tr id="reserve--first--tr">
					<td>체크인 & 체크아웃</td>
					<td>성인</td>
					<td>어린이</td>
					<td>유아</td>
				</tr>
				<tr id="reserve--second--tr">
					<td>
						<input class="dateSelector" id="input--box" placeholder="날짜를 선택하세요" name="date">
					</td>
					<td>
						<select name="countPerson" class="select--box">
							<option value="1">1</option>
							<option value="2">2</option>
						</select>
					</td>
					<td>
						<select name="countChild" class="select--box">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
						</select>
					</td>
					<td>
						<select name="countBaby" class="select--box">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
						</select>
					</td>
				</tr>
			</table>
			<div id="main--reserve--btn">
				<button type="submit" class="sub--button">검색</button>
			</div>
		</form>
	</div>
	<p class="title--container">도담 추천 프로모션</p>
	<div class="recommend--container">

		<div class="room--box">
			<img alt="" src="https://picsum.photos/200/200" class=""> Sweet Moment
		</div>
		<div class="room--box">
			<img alt="" src="https://picsum.photos/200/200" class=""> Sweet Moment
		</div>
		<div class="room--box">
			<img alt="" src="https://picsum.photos/200/200" class=""> Sweet Moment
		</div>
	</div>

	<div class="membership--container">
		<p class="title--container">도담 멤버쉽</p>
		<div class="membership--wrap">
			<div id="gift--box">
				<span class="material-symbols-outlined membership--icon">redeem</span>
				<p class="membership--desc">회원 전용 이벤트를 누려보세요.</p>
			</div>
			<div id="discount--box">
				<span class="material-symbols-outlined membership--icon">calculate</span>
				<p class="membership--desc">멤버십 회원만을 위해 할인된 가격을 제공합니다.</p>
			</div>
			<div id="point--box">
				<span class="material-symbols-outlined membership--icon">monetization_on</span>
				<p class="membership--desc">포인트를 적립하고, 현금처럼 실용적으로 사용하세요.</p>
			</div>
		</div>
		<button type="button" onclick="location.href='/membership'" id="desc--btn">자세히 보기</button>
	</div>


	<!-- 예약 달력 -->
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script>
		var dateSelector = document.querySelector('.dateSelector')
		$(".dateSelector").flatpickr({
			enableTime : false,
			dateFormat : "Y-m-d",
			mode : "range",
			minDate : "today",
		});
	</script>
	<script src="js/mainToggle.js"></script>
	
	