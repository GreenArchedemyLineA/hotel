<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>

<div class="d-flex align-items-start">
	<div class="flex-grow-1">
		<form action="/manager/userNameList" method="get">
			<input type="text" name="name">
			<button type="submit">회원 이름 검색</button>
		</form>
		<form action="/manager/blackList" method="get">
			<input type="text" name="blackList">
			<button type="submit">블랙리스트 유저 검색</button>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">회원이름</th>
					<th scope="col">이메일</th>
					<th scope="col">전화번호</th>
					<th scope="col">생년월일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items= "${userList}">
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
<script>
	function userDetail(id){
		// 유저 정보 확인과 등급 수정 할수 있는 페이지로
		location.href = "/manager/userDetail/"+id; 
	}
</script>
</body>
</html>