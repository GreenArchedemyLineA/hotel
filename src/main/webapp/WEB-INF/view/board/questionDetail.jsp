
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
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	<div class="main">
		<header>여짝에 이제 리스트 들을 띄어줄 생각입니다</header>
		<div id="map" class="main--content">
		<h5>문의 내용</h5>
			<div>
				<div>
					<label class="form-label">제목</label> 
					<br>
					<label class="form-label">${question.title}</label>
				</div>
				<div>
					<label class="form-label">내용</label> 
					<br>
					<label class="form-label">${question.content}</label>
				</div>
			
				<div>
					<label class="form-label">작성자 아이디</label>
					<br>
					<label class="form-label">${question.userId}</label>
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

