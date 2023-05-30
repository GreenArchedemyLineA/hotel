<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
	<div class="content">
		<div class="main">
			<h2>문의사항</h2>
			<div class="main--content">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">문의 제목</th>
						<th scope="col">문의자 아이디</th>
						<th scope="col">답변 상태값</th>
						<th scope="col">답변하기/삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="questionList" items="${questionList}">
						<tr>
							<td>${questionList.title}</td>
							<td>${questionList.userId}</td>
							<td>${questionList.status}</td>
							<c:choose>
							<c:when test="${questionList.status != true}">
								<td><button onclick="questionDetail(${questionList.id})">답변</button></td>
							</c:when>
							<c:otherwise>
								<td><button onclick="questionDelete(${questionList.id})">삭제</button></td>
							</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<div style="display: block; text-align: center;">
					<c:if test="${paging.startPage != 1}">
						<a href="/question/questionList?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage}">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.nowPage}">
								<a href="/question/questionList?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="/question/questionList?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</main>
<script>
	function questionDetail(id){
		location.href = "/question/questionDetail/"+id; 
	}
	function questionDelete(id){
		location.href = "/question/questionDelete/"+id; 
	}
</script>
</body>
</html>
