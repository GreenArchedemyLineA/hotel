<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>

<div class="card">
	<div class="card-header">
		<h5 class="card-title mb-0">행사 일정</h5>
	</div>
	<div class="card-body h-100">
		<div class="d-flex align-items-start">
		 <div class="row g-3">
				<form action="/event/update" method="post" class="col-md-6">
				<div class="col-md-6">
					<label class="form-label">title</label> 
					<input type="email" class="form-control" name="title" value="${event.title}">
				</div>
				<div class="col-md-6">
					<label class="form-label">content</label> 
					<input type="text" class="form-control" name="content" value="${event.content}">
				</div>
			
				<div class="col-md-6">
					<label class="form-label">시작일</label>
					 <input type="text" class="form-control" name="startDate" value="${event.startDate}">
				</div>
				<div class="col-md-6">
					<label class="form-label">종료일</label>
					 <input type="text" class="form-control" name="endDate" value="${event.endDate}">
				</div>
				<button type="submit" class="btn btn-primary">행사 일정 수정</button>
				</form>

				</div>
		</div>
	</div>
</div>
<script>
	function userSecession(id){
		// 유저 정보 확인과 등급 수정 할수 있는 페이지로
		location.href = "/manager/userSecession/"+id; 
	}
</script>
</body>
</html>