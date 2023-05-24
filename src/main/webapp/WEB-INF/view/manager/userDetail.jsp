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
					<input type="email" class="form-control" name="email" value="${userDetail.user.email}">
				</div>
				<div class="col-md-6">
					<label class="form-label">name</label> 
					<input type="text" class="form-control" name="name" value="${userDetail.user.name}">
				</div>
			
				<div class="col-md-6">
					<label class="form-label">grade</label>
					 <input type="text" class="form-control" name="grade" value="${userDetail.grade.name}">
				</div>
				<div class="col-md-6">
					<label class="form-label">tel</label>
					 <input type="text" class="form-control" name="tel" value="${userDetail.user.tel}">
				</div>
				<div class="col-md-6">
					<label class="form-label">gender</label>
					 <input type="text" class="form-control" name="gender" value="${userDetail.user.gender}">
				</div>
				<div class="col-md-6">
					<label class="form-label">birth</label> 
					<input type="text" class="form-control" name="birth" value="${userDetail.user.birth}">
				</div>
				<div class="col-md-6">
					<label class="form-label">black</label> 
					<input type="text" class="form-control" name="birth" value="${userDetail.user.blacklist}">
					<c:choose>
					<c:when test="${userDetail.user.blacklist == 0}">
					<form action="/manager/updateBlack/${userDetail.user.id}" method="get">
					<button type="submit" class="btn btn-danger">블랙리스트 지정</button>
					</form>
					</c:when>
					<c:otherwise>
					<form action="/manager/updateWhite/${userDetail.user.id}" method="get">
					<button type="submit" class="btn btn-primary">블랙리스트 해제</button>
					</form>						
					</c:otherwise>
				</c:choose>
				</div>
				<form action="/manager/updateGrade/${userDetail.user.id}" method="post" class="col-md-6">
				<label>수정 하실 등급 번호</label>
				<select name="gradeId">
				<option value="1">
					브라운
				</option>
				<option value="2">
					골드
				</option>
				<option value="3">
					다이야
				</option>					
				</select>
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