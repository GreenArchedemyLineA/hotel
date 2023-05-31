<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
		<div class="content">
			<div class="main--headers">
				<button type="button" onclick="location.href='/manager/membershipUserList'">맴버쉽 회원 검색</button>
				<button type="button" onclick="location.href='/manager/blackList'">블랙리스트 회원 검색</button>
			</div>
			<div class="main--content">
				<button type="button" onclick="location.href='/manager/userList'">돌아가기</button>
				<table class="table">
					<thead>
						<tr>
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
						<c:forEach var="user" items= "${viewAll}">
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
				<div style="display: block; text-align: center;">
					<c:if test="${paging.startPage != 1}">
						<a href="/manager/blackList?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage}">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.nowPage}">
								<a href="/manager/blackList?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="/manager/blackList?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</main>
	
	<script>
		function userDelete(id,email){
			location.href = "/manager/userWithdrawal/"+id+"/"+email; 
		}
	</script>
</body>
</html>
