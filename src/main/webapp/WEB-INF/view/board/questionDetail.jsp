<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<style>
.content {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
}
.sub-button {
	background-color: #000;
	color: #fff;
	width: 400px;
	height: 40px;
	margin: 20px 10px;
}
.button--box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	width: 100%;
}
.input--box {
	border: none;
	border-bottom: 2px solid #ebebeb;
	margin: 10px;
}
.content--box {
	height: 500px;
}
</style>

<div class="content">
		<h2>문의사항</h2>
		<div class="main--content">
			<div>
				<div>
					<label>작성자 : ${question.userId}</label>
				</div>
				<div>
					<label style="font-weight: bold">${question.title}</label>
				</div>
				<div>
					<label>${question.content}</label>
				</div>
			
				<form action="/question/reply/${question.id}/${principal.id}" method="post">
				<input type="text" name="content" class="input--box">
				<button type="submit" class="sub-button">댓글 달기</button>
				</form>
				</div>
		</div>
	</div>
<<<<<<< HEAD
</div>
<%@ include file="../layout/footer.jsp"%>
=======
</body>
</html>
>>>>>>> manager/css

