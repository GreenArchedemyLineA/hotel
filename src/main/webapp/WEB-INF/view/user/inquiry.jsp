<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id/pw_inquiry Page</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&display=swap')
	;

* {
	margin: 0;
	font-family: 'Noto Sans KR', monospace;
}

.main--container {
	display: flex;
}
#logo--image {
		width: 150px;
}
.title--container {
	flex: 1;
	background-color: #64c5f3;
	height: 100vh;
	color: #fff;
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
}

.content--container {
	flex: 3;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.form--container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 500px;
	height: 500px;
}
.find--id:hover, .find--pwd:hover {
	cursor: pointer;
	background-color: #FFF7D1;
	color: black;
}


.find--id {
	background-color: black;
	width: 180px;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
}
.find--pwd {
	background-color: black;
	width: 180px;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
}


.title--container p {
	font-size: 60px;
	display: flex;
	flex-direction: column;
	align-items: flex-end;
}

.select--container {
	display: flex;
	justify-content: center;
	height: 40px;
}
.input--box {
	width: 350px;
	height: 40px;
	border: none;
	border-bottom: 2px solid black;
	margin: 10px;
}

.sub--button {
	background-color: #FF9F8D;
	border: none;
	color: #fff;
	width: 350px;
	height: 40px;
	margin: 20px;
	cursor: pointer;
}

.change--background {
	background-color: #FFF7D1;
	color: #000;
}

</style>
</head>
<main class="main--container">
	<div class="title--container">
		<div class="title--logo">
			<a onclick="history.back()"><span class="material-symbols-outlined">arrow_back</span></a>
			<img alt="" src="/images/logo_white.png" id="logo--image">
		</div>
		<div class="title--text">
			<p>아이디와</p>
			<p>비밀번호를</p>
			<p>찾아보세요</p>
		</div>
	</div>
	<div class="content--container">
		<div class="select--container">
			<p class="find--id">아이디 찾기</p>
			<p class="find--pwd">비밀번호 찾기</p>
		</div>
			<form action="/idInquiry" method="post" class="form--container" id="id--container">
				<input type="text" name="name" placeholder="이름을 입력해 주세요" class="input--box"> <input type="date" name="birth" placeholder="생년월일 입력해 주세요" class="input--box"> <input type="text"
					name="tel" placeholder="전화번호 입력해 주세요" class="input--box">
				<button type="submit" class="sub--button">아이디 찾기</button>
			</form>
			<form action="/pwInquiry" method="post" class="form--container" id="pwd--container">
				<input type="email" name="email" placeholder="이메일을 입력해 주세요" class="input--box"> <input type="text" name="name" placeholder="이름을 입력해 주세요" class="input--box"> <input type="date"
					name="birth" placeholder="생년월일 입력해 주세요" class="input--box"> <input type="text" name="tel" placeholder="전화번호 입력해 주세요" class="input--box">
				<button type="submit" class="sub--button">비밀번호 찾기</button>
			</form>

	</div>
	
<script>
$(document).ready(function() {
	$("#pwd--container").hide();
	$(".find--id").addClass("change--background");
});

$(".find--id").click(function(){
	  $("#id--container").show();
	  $("#pwd--container").hide();
	  $(".find--id").addClass("change--background");
	  $(".find--id").siblings().removeClass("change--background");
	});

$(".find--pwd").click(function(){
	  $("#id--container").hide();
	  $("#pwd--container").show();
	  $(".find--pwd").addClass("change--background");
	  $(".find--pwd").siblings().removeClass("change--background");
	});
</script>
</main>
</body>
</html>
