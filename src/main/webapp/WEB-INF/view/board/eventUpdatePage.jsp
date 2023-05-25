<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zzkxekb89f"></script>
<style>
.container {
	color: black;
}

header {
	font-size: 30px;
	color: black;
}

.content {
	display: flex;
}

.navi {
	display: flex;
	flex: 1;
}

.main {
	display: flex;
	flex-direction: column;
	flex: 3;
}

.navi {
	display: flex;
	height: 100vh;
	justify-content: center;
}

.content {
	display: flex;
	height: 100vh;
}

.main--content {
	border: 2px solid black;
	width: 1200px;
	height: 600px;
	margin-left: 30px;
	margin-top: 30px;
}

.navi--bar {
	border: 2px solid black;
	margin-top: 30px;
	width: 200px;
	height: 400px;
}

li {
	list-style: none;
}
</style>

<div class="content">
	<div class="navi">
		<div class="navi--bar">
			<ul>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
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
</body>
</html>
