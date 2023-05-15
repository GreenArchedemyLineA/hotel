<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>

<div class="d-flex align-items-start">
	<div class="flex-grow-1">
		<form>
			<input type="text" name="name">
			<button type="submit">검색</button>
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
						<td><button onclick="userInfoUpdate(${user.id})">수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>
	function userInfoUpdate(id){
		// 유저 정보 수정할수있는 페이지로
		location.href = "/"+id; 
	}
</script>
</body>
</html>