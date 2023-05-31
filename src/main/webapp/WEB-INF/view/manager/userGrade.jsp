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
							<th scope="col">회원이메일</th>
							<th scope="col">전화번호</th>
							<th scope="col">생년월일</th>
							<th scope="col">정보보기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${viewAll}">
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
				<div style="display: block; text-align: center;">
					<c:if test="${paging.startPage != 1}">
						<a href="/manager/userGradeList?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage}">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.nowPage}">
								<a href="/manager/userGradeList?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="/manager/userGradeList?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
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