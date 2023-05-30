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
		<h2>멤버쉽 고객리스트</h2>
			<div class="main--content">
				<table class="table">
					<thead>
						<tr class="table--tr">
							<th scope="col">회원이름</th>
							<th scope="col">이메일</th>
							<th scope="col">전화번호</th>
							<th scope="col">맴버쉽 가입일</th>
							<th scope="col">정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${userList}">
							<tr class="table-tr">
								<td>${user.user.name}</td>
								<td>${user.user.email}</td>
								<td>${user.user.tel}</td>
								<td>${user.updatedAt}</td>
								<td><button onclick="userDetail(${user.userId})" class="sub-button">상세</button></td>
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
</script>
</body>
</html>
