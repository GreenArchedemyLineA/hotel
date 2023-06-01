<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
	<div class="content">
		<div class="main">
			<header>여짝에 이제 리스트 들을 띄어줄 생각입니다</header>
			<div class="main--content">
				<div>
					<div>
						<h5>행사 일정</h5>
					</div>
					<div>
						<div>
							<div>
								<form action="/event/updateEvent/${event.id}" method="post" class="col-md-6">
									<div class="col-md-6">
										<label class="form-label">title</label> 
										<input type="text" class="form-control w-auto" name="title" value="${event.title}">
									</div>
									<div class="col-md-6">
										<label class="form-label">content</label> 
										<input type="text" class="form-control w-auto" name="content" value="${event.content}">
									</div>
								
									<div class="col-md-6">
										<label class="form-label">시작일</label>
										 <input type="text" class="form-control w-auto" name="startDate" value="${event.startDate}">
									</div>
									<div class="col-md-6">
										<label class="form-label">종료일</label>
										 <input type="text" class="form-control w-auto" name="endDate" value="${event.endDate}">
									</div>
									<button type="submit" class="btn btn-primary">행사 일정 수정</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@ include file="../layout/footer.jsp"%>

