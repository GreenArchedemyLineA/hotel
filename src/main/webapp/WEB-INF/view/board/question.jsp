<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>

<div class="d-flex align-items-start">
	<div class="flex-grow-1">
		<form action="/question/category" method="get">
			<select name="category">
				<option value="호텔건의">호텔건의</option>
				<option value="회원문의">회원문의</option>
				<option value="부대시설문의">부대시설문의</option>
				<option value="예약문의">예약문의</option>
			</select>
			<button type="submit">카테고리 검색</button>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">문의 제목</th>
					<th scope="col">문의자 아이디</th>
					<th scope="col">답변 상태값</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="questionList" items="${questionList}">
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
		// 문의 정보 삭제 기능
		location.href = "/question/questionDelete/"+id; 
	}
	$(document).ready(function(){
		let date 
	$.ajax({
		type: 'get',
		url: '/question/questionList',
	}).done({
		
	}).fail({
		
	});
	});
</script>
</body>
</html>