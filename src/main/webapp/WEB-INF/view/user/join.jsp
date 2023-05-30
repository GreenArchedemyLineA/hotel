<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="/css/myPage.css" />
<style>
</style>
<main class="main--container">
	<div class="title--container">
		<div class="title--logo">
			<span class="material-symbols-outlined back--icon" onclick="history.back()">arrow_back</span>
			<img alt="" src="/images/dodam_wlogo.png" id="logo--image" height="65" onclick="location.href='/'">	
		</div>
		<div class="title--text">
			<p>회원가입을</p>
			<p>시작해볼까요?</p>
		</div>
	</div>
	<div class="content--container">
		<form action="/join" method="post" class="form--container">
		<input type="email" name="email" class="input--box" placeholder="이메일을 입력해 주세요" autocomplete="off"> 
		<input type="password" name="password" class="input--box" placeholder="비밀번호를 입력해 주세요" autocomplete="off"> 
		<input type="text" name="name" class="input--box" placeholder="이름을 입력해 주세요" autocomplete="off"> 
		<input type="date" name="birth" class="input--box" placeholder="출생년도" autocomplete="off">
		<div>
			<input type="text" class="input--box" id="address" placeholder="주소" name="address" readonly="readonly" style="width:300px;">
			<input type="button" class="sub--button" onclick="postCode()" value="검색" style="width:50px; margin: 0; background-color: #fff; border: 1px solid #000; color: #000;"><br>
			<input type="text" class="input--box" id="detailAddress" name="detailAddress" placeholder="상세주소"><br>
		</div>
		<div>
			<label><input type="radio" name="gender" value="남성">남성</label>
			<label><input type="radio" name="gender" value="여성">여성</label>
		</div>
		<input type="tel" name="tel" class="input--box" placeholder="전화번호를 입력해주세요" autocomplete="off">
		<button type="submit" class="sub--button">회원가입</button>
		</form>
	</div>
</main>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function postCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                let addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { 
                	// 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>
	