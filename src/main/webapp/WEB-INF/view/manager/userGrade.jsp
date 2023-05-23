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
					<th scope="col">회원이메일</th>
					<th scope="col">전화번호</th>
					<th scope="col">생년월일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items= "${userList}">
					<tr>
						<td>${user.user.name}</td>
						<td>${user.user.email}</td>
						<td>${user.user.tel}</td>
						<td>${user.user.birth}</td>
						<td><button onclick="userDetail(${user.user.id})">상세보기/수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>
	function userDelete(id,email){
		location.href = "/manager/userWithdrawal/"+id+"/"+email; 
	}
</script>
</body>
</html>