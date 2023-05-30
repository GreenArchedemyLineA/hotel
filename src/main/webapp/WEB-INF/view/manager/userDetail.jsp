<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<style>
.content {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
}

.sub-button {
	background-color: #000;
	color: #fff;
	width: 400px;
	height: 40px;
	margin: 20px 10px;
}

.button--box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	width: 100%;
}

.form--container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.input--box {
	border: none;
	border-bottom: 2px solid #ebebeb;
	margin: 10px;
	text-align: center;
	font-size: 20px;
}
.grade--box {
	border: none;
	border-bottom: 2px solid #ebebeb;
	margin: 10px;
}
.content--box {
	height: 500px;
}
.change--container {
	display: flex;
	justify-content: center;
}
</style>
<div class="content">
	<h2>${userDetail.user.name}님 고객정보</h2>
	<div class="main--content">
		<div>
			<div>
				<div>
					<div class="form--container">
						<input type="email" class="input--box" name="email" value="${userDetail.user.email}" readonly="readonly"> 
						<input type="text" class="input--box" name="name" value="${userDetail.user.name}" readonly="readonly"> 
						<input type="text" class="input--box" name="grade" value="${userDetail.grade.name}" readonly="readonly"> 
						<input type="text" class="input--box" name="tel" value="${userDetail.user.tel}" readonly="readonly"> 
						<input type="text" class="input--box" name="gender" value="${userDetail.user.gender}" readonly="readonly"> 
						<input type="text" class="input--box" name="birth" value="${userDetail.user.birth}" readonly="readonly"> 
						<input type="text" class="input--box" name="blacklist" value="블랙리스트 : ${userDetail.user.blacklist}" readonly="readonly">
					</div>
						<div class="change--container">
							<c:choose>
								<c:when test="${userDetail.user.blacklist == 0}">
									<form action="/manager/updateBlack/${userDetail.user.id}" method="get">
										<button type="submit" class="btn btn-danger">블랙리스트 지정</button>
									</form>
								</c:when>
								<c:otherwise>
									<form action="/manager/updateWhite/${userDetail.user.id}" method="get">
										<button type="submit" class="btn btn-primary">블랙리스트 해제</button>
									</form>
								</c:otherwise>
							</c:choose>
						<form action="/manager/updateGrade/${userDetail.user.id}" method="post">
							<select name="gradeId" class="grade--box">
								<option value="1">브라운</option>
								<option value="2">골드</option>
								<option value="3">다이아</option>
							</select>
							<button type="submit" class="btn btn-danger">등급 수정</button>
						</form>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</main>
</body>
</html>
