<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
	<div class="content">
		<div class="main--headers">
			<button type="button" onclick="location.href='/manager/membershipUserList'">맴버쉽 회원 검색</button>
			<button type="button" onclick="location.href='/manager/blackList'">블랙리스트 회원 검색</button>
		</div>
		<div class="main--content">
			<div>
				<div>
					<h5>개인정보</h5>
				</div>
				<div>
					<div>
						<div>
							<div class="col-md-6">
								<label class="form-label">이메일</label> 
								<input type="email" class="form-control" name="email" value="${userDetail.user.email}">
							</div>
							<div class="col-md-6">
								<label class="form-label">이름</label> 
								<input type="text" class="form-control" name="name" value="${userDetail.user.name}">
							</div>
							<div class="col-md-6">
								<label class="form-label">등급</label>
								 <input type="text" class="form-control" name="grade" value="${userDetail.grade.name}">
							</div>
							<div class="col-md-6">
								<label class="form-label">전화번호</label>
								 <input type="text" class="form-control" name="tel" value="${userDetail.user.tel}">
							</div>
							<div class="col-md-6">
								<label class="form-label">성별</label>
								 <input type="text" class="form-control" name="gender" value="${userDetail.user.gender}">
							</div>
							<div class="col-md-6">
								<label class="form-label">생일</label> 
								<input type="text" class="form-control" name="birth" value="${userDetail.user.birth}">
							</div>
							<div class="col-md-6">
								<label class="form-label">블랙 리스트 여부</label> 
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
										다이아
									</option>
								</select>
								<button type="submit" class="btn btn-danger">등급 수정</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@ include file="../layout/footer.jsp"%>
