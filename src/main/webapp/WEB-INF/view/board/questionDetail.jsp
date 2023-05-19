<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp" %>
	
<div class="card">
	<div class="card-header">
		<h5 class="card-title mb-0">문의 내용</h5>
	</div>
	<div class="card-body h-100">
		<div class="d-flex align-items-start">
		 <div class="row g-3">
				<div class="col-md-6">
					<label class="form-label">title</label> 
					<input type="email" class="form-control" name="title" value="${question.title}">
				</div>
				<div class="col-md-6">
					<label class="form-label">content</label> 
					<input type="text" class="form-control" name="content" value="${question.content}">
				</div>
			
				<div class="col-md-6">
					<label class="form-label">작성자 아이디</label>
					 <input type="text" class="form-control" name="userId" value="${question.userId}">
				</div>
				<form action="/question/reply/${question.id}/${principal.id}" method="post" class="col-md-6">
				<input type="text" name="content">
				<button type="submit" class="btn btn-danger">댓글 달기</button>
				</form>
				</div>
				
		</div>
	</div>
</div>
</body>
</html>