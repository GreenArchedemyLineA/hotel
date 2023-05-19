<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>

<div class="card">
	<div class="card-header">
		<h5 class="card-title mb-0">개인정보</h5>
	</div>
	<div class="card-body h-100">
		<div class="d-flex align-items-start">
		 <div class="row g-3">
				<div class="col-md-6">
					<label class="form-label">Email</label> 
					<input type="email" class="form-control" name="email" value="${userDetail.muser.email}">
				</div>
				<div class="col-md-6">
					<label class="form-label">name</label> 
					<input type="text" class="form-control" name="name" value="${userDetail.muser.name}">
				</div>
			
				<div class="col-md-6">
					<label class="form-label">grade</label>
					 <input type="text" class="form-control" name="grade" value="${userDetail.grade.name}">
				</div>
				<div class="col-md-6">
					<label class="form-label">tel</label>
					 <input type="text" class="form-control" name="tel" value="${userDetail.muser.tel}">
				</div>
				<div class="col-md-6">
					<label class="form-label">gender</label>
					 <input type="text" class="form-control" name="gender" value="${userDetail.muser.gender}">
				</div>
				<div class="col-md-6">
					<label class="form-label">birth</label> 
					<input type="text" class="form-control" name="birth" value="${userDetail.muser.birth}">
				</div>
				<form action="/manager/updateGrade/${userDetail.muser.id}" method="post" class="col-md-6">
				<label>수정 하실 등급 번호</label>
				<input type="text" name="gradeId">
				<button type="submit" class="btn btn-danger">등급 수정</button>
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