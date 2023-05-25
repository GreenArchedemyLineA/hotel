<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zzkxekb89f"></script>
<style>
.container {
	color: black;
}
header{
	font-size: 30px;
	color: red;
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
td,th,button{
	color: black;
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
			<header>여짝에 리스트</header>
			<div class="main--content">
			<div>
				<form action="/manager/userNameList" method="get">
					<input type="text" name="name">
					<button type="submit">회원 이름 검색</button>
				</form>
			</div>
			<div>
				<form action="/manager/userGradeList" method="get">
					<select name="gradeId">
						<option value="1">브라운</option>
						<option value="2">골드</option>
						<option value="3">다이야</option>
					</select>
					<button type="submit">회원 등급으로 조회</button>
				</form>
			</div>
			<table class="table">
			<thead>
				<tr>
					<th scope="col">회원이름</th>
					<th scope="col">이메일</th>
					<th scope="col">전화번호</th>
					<th scope="col">생년월일</th>
					<th scope="col">정보</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr>
						<td>${user.name}</td>
						<td>${user.email}</td>
						<td>${user.tel}</td>
						<td>${user.birth}</td>
						<td><button onclick="userDetail(${user.id})">상세보기/수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			</div>
		</div>
	</div>


<script>
	function userDetail(id){
		// 유저 정보 확인과 등급 수정 할수 있는 페이지로
		location.href = "/manager/userDetail/"+id; 
	}
</script>
</body>
</html>
