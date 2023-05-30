<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>

<style>
.content {
	background-image: url("http://localhost:8080/images/mainImage.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	opacity: 0.4;
}
</style>
		<div class="content">
			<p>매니저님 반갑습니다</p>
			<p id="date"></p>	
		</div>
	</main>
</body>
<script>
	$(document).ready(function() {
		let todayDate = document.getElementById("#date");
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth()+1;
		let date = today.getDate();
		
		document.write('오늘은' + year + '년 ' + month + '월 ' + date + '일 입니다');
		
	});

</script>
</html>
