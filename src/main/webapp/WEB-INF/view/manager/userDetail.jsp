<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zzkxekb89f"></script>
<style>
.container {
	color: black;
}
header{
	font-size: 30px;
	color: black;
}
.content {
	display: flex;
}

.navi {
	display: flex;
	flex: 1;
}

.main {
	display: flex;
	flex-direction: column;
	flex: 3;
}
.navi{
	display: flex;
	height: 100vh;
	justify-content: center;
}
.content{
	display: flex;
	height: 100vh;
}
.main--content {
	border: 2px solid black;
	width: 1200px;
	height: 600px;
	margin-left: 30px;
	margin-top: 30px;
}

.navi--bar {
	border: 2px solid black;
	margin-top: 30px;
	width: 200px;
	height: 400px;
		
}
li{
	list-style: none;
}
</style>

	<div class="content">
		<div class="navi">
			<div class="navi--bar">
				<ul>
					<li>
					<form action="/manager/membershipUserList" method="get">
					<button type="submit">맴버쉽 회원 검색</button>
					</form>
					</li>
					<li>
					<form action="/manager/blackList" method="get">
					<button type="submit">블랙리스트 회원 검색</button>
					</form>
					</li>
					<li></li>
					<li></li>
				</ul>
			</div>
		</div>
		<div class="main">
			<header>여짝에 이제 리스트 들을 띄어줄 생각입니다</header>
			<div class="main--content">
			<div>
	<div>
		<h5>개인정보</h5>
	</div>
	<div>
		<div>
		 <div>
				<div class="col-md-6">
					<label class="form-label">이메일</label> 
					<input type="email" class="form-control" name="email" value="${userDetail.user.email}">
				</div>
				<div class="col-md-6">
					<label class="form-label">이름</label> 
					<input type="text" class="form-control" name="name" value="${userDetail.user.name}">
				</div>
			
				<div class="col-md-6">
					<label class="form-label">등급</label>
					 <input type="text" class="form-control" name="grade" value="${userDetail.grade.name}">
				</div>
				<div class="col-md-6">
					<label class="form-label">전화번호</label>
					 <input type="text" class="form-control" name="tel" value="${userDetail.user.tel}">
				</div>
				<div class="col-md-6">
					<label class="form-label">성별</label>
					 <input type="text" class="form-control" name="gender" value="${userDetail.user.gender}">
				</div>
				<div class="col-md-6">
					<label class="form-label">생일</label> 
					<input type="text" class="form-control" name="birth" value="${userDetail.user.birth}">
				</div>
				<div class="col-md-6">
					<label class="form-label">블랙 리스트 여부</label> 
					<input type="text" class="form-control" name="birth" value="${userDetail.user.blacklist}">
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
				</div>
				<form action="/manager/updateGrade/${userDetail.user.id}" method="post" class="col-md-6">
				<label>수정 하실 등급 번호</label>
				<select name="gradeId">
				<option value="1">
					브라운
				</option>
				<option value="2">
					골드
				</option>
				<option value="3">
					다이야
				</option>					
				</select>
				<button type="submit" class="btn btn-danger">등급 수정</button>
				</form>

				</div>
		</div>
	</div>
</div>
			</div>
		</div>
	</div>
</body>
</html>
