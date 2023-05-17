<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp" %>
	
	<div class="d-flex align-items-start">
	<div class="flex-grow-1">
		<form>
			<input type="text" name="name">
			<button type="submit">카테고리 검색</button>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">문의 제목</th>
					<th scope="col">문의자 아이디</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="questionList" items= "${questionList}">
					<tr>
						<td>${questionList.title}</td>
						<td>${questionList.userId}</td>
						<td>${questionList.status}</td>
						<td><button onclick="questionDetail(${questionList.id})">답변</button></td>
						<td><button onclick="questionDelete(${questionList.id})">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>
	function questionDetail(id){
		// 문의 정보 확인과 댓글 작성 할수 있는 페이지로
		location.href = "/question/questionDetail/"+id; 
	}
	function questionDelete(id){
		// 유저 정보 확인과 등급 수정 할수 있는 페이지로
		location.href = "/question/questionDelete/"+id; 
	}
</script>
</body>
</html>