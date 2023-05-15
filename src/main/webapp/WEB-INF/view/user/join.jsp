<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<style>
	.join--container {
		background-color: #ccc;

	}
	.form--container {
		display: flex;
		flex-direction: column;
		width: 700px;
		justify-content: center;
	}
	.sub--button {
		width: 200px;
	}
	.input--box {
		width: 200px;	
	}
</style>	
	<div class="join--container"> 
		<span>회원가입</span> 
		<div> 도담 호텔에 오신 것을 환영합니다 </div>
		<form action="/join" method="post" class="form--container">
			이메일 <input type="email" name="email" class="input--box">
			비밀번호 <input type="password" name="password" class="input--box">
			이름 <input type="text" name="name" class="input--box">
			생년월일 <input type="date" name="birth" class="input--box">
			성별
			<div>
				<label><input type="radio" name="gender" value="남성">남성</label>
				<label><input type="radio" name="gender" value="여성">여성</label>
			</div> 
			전화번호 <input type="tel" name="tel" class="input--box">
			<button type="submit" class="sub--button">회원가입</button>
		</form>
	</div>
	</body>
	</html>