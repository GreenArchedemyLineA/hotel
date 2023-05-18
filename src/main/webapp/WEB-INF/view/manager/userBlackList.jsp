<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>

<div class="d-flex align-items-start">
	<div class="flex-grow-1">
		<form action="/manager/userList" method="get">
			<button type="submit">돌아가기</button>
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
						<td><button onclick="userDelete(${user.id})">탈퇴 처리</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>
	function userDelete(id){
		// 유저 정보 확인과 등급 수정 할수 있는 페이지로
		location.href = "/manager/deleteBlackList/"+id; 
	}
</script>
</body>
</html>