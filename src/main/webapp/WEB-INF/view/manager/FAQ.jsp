<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<style>
	button {
		width: 50px;
		height: 50px;
	}
</style>
<div class="content">
	<div class="main--content">
	<div>
	<button type="button" data-toggle="modal" data-target="#insertFaq">FAQ 등록</button>
	</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>상세보기</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="faq" items="${faqList}">
					<tr>
						<td>${faq.id}</td>
						<td>${faq.title}</td>
						<td>${faq.content}</td>
						<td><button onclick="detailFAQForm(${faq.id})">상세보기</button></td>
						<td><button onclick="deleteFaq(${faq.id})">삭제</button></td>						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</div>
	<div class="modal" id="insertFaq">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<div class="modal-header">
					<h4 class="modal-title">FAQ 등록하세요</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<div>
					<form action="/event/event-insert" method="post">
						<label>제목</label>
						<input type="text" name="title">
						<br> 
						<label>내용</label> 
						<input type="text" name="content"> 
						<br> 
						<button type="submit" class="btn btn-primary">등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
    function detailFAQForm(id){
        location.href = "/manager/faq/"+id;
    }
    function updateFaq(id){
    	location.href = "/manager/faq/"+id;
    }
    function deleteFaq(id){
    	location.href = "/manager/faq/"+id;
    }
</script>
</body>
</html>