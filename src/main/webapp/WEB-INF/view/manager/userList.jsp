<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<style>
.content {
	width: 100%; display : flex;
	justify-content: center;
	align-items: center;
}
.table--tr {
	background-color: #ebebeb;
	height: 20px;
	text-align: center;
}

.table-tr {
	text-align: center;
	font-size: 20px;
}

#title--box {
	width: 600px;
}

.sub--button {
	background-color: #FF9F8D;
	border: none;
	color: #fff;
	cursor: pointer;
	width: 60px;
	height: 30px;
}
.button--box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	width: 100%;
}
.sub-button {
	background-color: #000;
	color: #fff;
	width: 60px;
	height: 30px;
}
.input--box {
	border: none;
	border-bottom: 2px solid #ebebeb;
	margin: 10px;
}
.search--container {
	display: flex;
	justify-content: flex-end;
}
</style>
		<div class="content">
			<h2>회원 리스트</h2>
			<div class="main--content">
				<div class="search--container">
					<div>
						<form action="/manager/userNameList" method="get">
							<input type="text" name="name" class="input--box" placeholder="이름을 입력해주세요">
							<button type="submit" class="sub--button">검색</button>
						</form>
					</div>
				<div>
					<form action="/manager/userGradeList" method="get">
						<select name="gradeId" class="input--box">
							<option value="1">브라운</option>
							<option value="2">골드</option>
							<option value="3">다이아</option>
						</select>
						<button type="submit" class="sub--button">조회</button>
					</form>
				</div>
				</div>
				
				<table class="table">
					<thead>
						<tr class="table--tr">
							<th scope="col">이름</th>
							<th scope="col">이메일</th>
							<th scope="col">전화번호</th>
							<th scope="col">생년월일</th>
							<th scope="col">정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${userList}">
							<tr class="table-tr">
								<td>${user.name}</td>
								<td>${user.email}</td>
								<td>${user.tel}</td>
								<td>${user.birth}</td>
								<td><button onclick="userDetail(${user.id})" class="sub-button">상세</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</main>
	
<script>
	function userDetail(id){
		// 유저 정보 확인과 등급 수정 할수 있는 페이지로
		location.href = "/manager/userDetail/"+id; 
	}
	
	let searchBtn = document.getElementById("search--btn");
	
	searchBtn.addEventListener("click", function() {
		let nameBoxValue = document.getElementById("name--search--box").value
		window.location.href="/manager/userNameList?name=" + nameBoxValue;
	});
	
</script>
</body>
</html>
