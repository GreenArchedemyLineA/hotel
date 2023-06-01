<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<style>
.content {
	width: 100%; display : flex;
	justify-content: center;
	align-items: center;
}
.main--content {
	margin-top: 50px;
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
.sub-button {
	background-color: #000;
	color: #fff;
	width: 60px;
	height: 30px;
}

</style>
		<div class="content">
			<h2>블랙 고객리스트</h2>
			<div class="main--content">
				<table class="table">
					<thead>
						<tr class="table--tr">
							<th scope="col">회원이름</th>
							<th scope="col">이메일</th>
							<th scope="col">전화번호</th>
							<th scope="col">생년월일</th>
							<th scope="col">탈퇴여부</th>
							<th scope="col">고유의 이메일</th>
							<th scope="col">탈퇴</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items= "${userList}">
							<tr class="table-tr">
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
								<td>탈퇴된 회원 입니다</td>							
									</c:otherwise>						
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</main>
	
	<script>
		function userDelete(id,email){
			location.href = "/manager/userWithdrawal/"+id+"/"+email; 
		}
	</script>
<%@ include file="../layout/footer.jsp"%>
