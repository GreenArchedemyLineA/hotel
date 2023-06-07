<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Membership Page</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&display=swap');
	* {
		margin: 0;
		font-family: 'Noto Sans KR', monospace;
	}
	#logo--image {
		cursor: pointer;
	}
	.main--container {
		display: flex;	
	}
	#membership--image {
		width: 150px;
	}
	.title--container {
		flex: 1;
		background-color: #64c5f3;
		color: #fff;
	}
	.title--container p {
		font-size: 60px;
		display: flex;
		flex-direction: column;
		align-items: flex-end;
	}
	.title--logo {
		display: flex;
		align-items: flex-end;
		justify-content: flex-end;
		margin: 10px 10px 0 0;
	}
	.title--logo a {
		cursor: pointer;
	}
	
	.title--text {
		margin: 150px 30px 0 0;
		min-width: 350px;
	}
	
	.content--container {
		flex: 3;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		padding: 20px;
	}
	.content--box {
		display: flex;
		width: 1100px;
		height: 400px;
		justify-content: center;
		margin-top: 100px;
	}
	
	.membership--image{
		width: 500px;
	}
	
	.content--1 {
		margin-left: 50px;
	}
	
	.content--2 {
		margin-right: 40px;
	}
	
	.content--description {
		display: flex;
		flex-direction: column;
		text-align: end;
		margin-left: 50px;
	}
	
	.content--description--1 {
		font-size: 40px;
		font-weight: bold;
		margin-bottom: 30px;
	}
	
	.content--description--2 {
		font-size: 25px;
		margin-bottom: 70px;
	}
	
	.button--container {
		width: 200px;
		height: 40px;
		border: none;
		background-color: #FF9F8D;
		color: #fff;
		
	}
	.sub--button {
		background-color: black;
		border: none;
		width: 300px;
		height: 50px;
		font-size: 20px;
		color: #ccc;
		margin: 40px 0;
	}
	.modal--wrap{
        display: none;
        width: 500px;
        height: 500px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
    }
    .black--bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal--close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal--close > a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    
	.back--icon {
		display: flex;
		height: 40px;
		align-items: center;
		cursor: pointer;
	}
	#grade {
		width: 800px;
		height: 400px;
	}
	.modal--box {
		display: flex;
		flex-direction: column;
		margin: 10px;
		justify-content: center;
		align-items: center;
	}
	#grade-desc {
		border-bottom: 1px solid #ebebeb;
		margin-bottom: 10px;
	}
	.pay{
		margin-top: 50px;
	}
	.modal--content {
		width: 1000px;
		height: 500px;
	}
</style>
</head>
<body>
<main class="main--container">
	<div class="title--container">
		<div class="title--logo">
			<a onclick="history.back()"><span class="material-symbols-outlined back--icon">arrow_back</span></a>
			<img alt="" src="/images/dodam_wlogo.png" id="logo--image" onclick="location.href='/'" width="200px;" height="40px;">	
		</div>
		<div class="title--text">
			<p>도담 멤버쉽이</p>
			<p>당신의 여정과</p>
			<p>함께합니다</p>
		</div>
	</div>
	<div class="content--container">
		<div class="content--box">
			<img alt="" src="/images/2023.jpg" class="membership--image">
			<div class="content--1">
				<div class="content--description--1">
					<p>경험은 풍성해지고</p>
					<p>혜택은 더해집니다</p>
				</div> 
				<div class="content--description--2">
					<p>ㅡ</p>
					<p style="margin-bottom: 10px;">포인트 적립</p>
					<p>멤버쉽 기간 동안 7% 적립</p>
				</div>
					<button type="button" class="button--container" data-toggle="modal" data-target="#grade" >도담 등급 보러가기</button>
			</div>	
		</div>
		
		<div class="content--box">
			<div class="content--2">
				<div class="content--description--1">
					<p>Welcome 쿠폰을</p>
					<p>지금 만나보세요</p>
				</div> 
				<div class="content--description--2">
					<p>ㅡ</p>
					<p style="margin-bottom: 10px;">1박 무료 숙박 쿠폰</p>
					<p>바로 사용 가능한 숙박 쿠폰 제공</p>
				</div>
					<button type="button" class="button--container" data-toggle="modal" data-target="#membership">멤버쉽 혜택 보러가기</button>
			</div>	
			<img alt="" src="/images/membership2.jpg" class="membership--image">
		</div>
		<div class="pay">
			<div class="payType">
				<input type="radio" name="pgType" value="nicepay" id="nicepay" class="pg-type pay" checked><label for="nicepay">신용카드결제</label>
				<input type="radio" name="pgType" value="kakaopay" id="kakaopay" class="pg-type pay"><label for="kakaopay">카카오페이결제</label>
				<input type="radio" name="pgType" value="tosspay" id="tosspay" class="pg-type pay"><label for="tosspay">토스간편결제</label>
			</div>
			<button onclick="membershipJoin()" class="sub--button">멤버쉽 가입하기</button>
		</div>
	</div>
		<div class="modal" id="grade">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">등급별 혜택 바로보기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal--box">	
					<c:forEach var="grade" items="${gradeList}">
						<span><b>${grade.name}</b></span>
						<span id="grade-desc">${grade.description}</span>
					</c:forEach>				
				</div>
		</div>
	</div>
	<div class="modal" id="membership">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">도담 멤버쉽</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal--box">					
					<span><b>${membership.price}</b></span>
					<span>${membership.content1}</span>
					<span>${membership.content2}</span>
					<span>${membership.content3}</span>
				</div>
			</div>
		</div>
	</div>
</main>
<script>
	const totalPriceValue = 500000;
	const orderName = "DODAM_MemberShip" +"_"+"-"+"_" + Date.now();
	const pgArray = [...document.getElementsByClassName("pg-type")];
	let payType;
	function membershipJoin(){


		fetch('/api/checkMemberShip')
				.then(async (response)=>{
					const data = await response.json();
					console.log(data)
					if(data.status_code !== 200){
						alert(data.msg)
						if(data.redirect_uri !== null){
							location.href = data.redirect_uri;
						}
					}else{
						joinMemberShip()
					}
				})
	}

	function joinMemberShip() {
		pgArray.some((pgInput) => {
			if(pgInput.checked){
				payType = pgInput.value
				return
			}
		})

		let popupOption = "width=800,height=800";
		let url;
		if(payType === "nicepay"){
			url = "http://localhost:8080/pay/payReady?paySelect=nicepay&total_amount="+totalPriceValue+"&orderName="+orderName;
			let returnPay = window.open(
					url,
					"popup",
					popupOption
			);
			returnPay.focus();
		}else if(payType === "kakaopay"){
			url = "http://localhost:8080/pay/kakaopay?item_name="+ orderName +"&total_amount=" +totalPriceValue
			let returnPay = window.open(
					url,
					"popup",
					popupOption
			);
			returnPay.focus();
		}else if(payType === "tosspay"){
			url = "http://localhost:8080/pay/payReady?paySelect=toss&total_amount="+totalPriceValue+"&orderName="+orderName;
			let returnPay = window.open(
					url,
					"popup",
					popupOption
			);
			returnPay.focus();
		}

	}
	function getReturnValue(returnValue){
		const returnJSON = JSON.parse(returnValue);
		if(returnJSON.status == "OK"){
			location.href='/joinMembership';
		}
	}
</script>

