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
					<th scope="col">탈퇴 유무</th>
					<th scope="col">탈퇴시 생성되는 고유의 이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items= "${userList}">
					<tr>
						<td>${user.name}</td>
						<td>${user.email}</td>
						<td>${user.tel}</td>
						<td>${user.birth}</td>
						<td>${user.withdrawal}</td>
						<td>${user.originEmail}</td>
						<c:choose>
							<c:when test="${user.withdrawal == 0}">
						<td><button onclick="userDelete(${user.id},'${user.email}')">탈퇴 처리</button></td>
							</c:when>
							<c:otherwise>
						<td>탈퇴된 회원 입니다.</td>							
							</c:otherwise>						
						</c:choose>
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