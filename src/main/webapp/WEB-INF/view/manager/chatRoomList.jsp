<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<style>
.content {
	width: 100%; 
	display : flex;
	height: 100%;
	justify-content: center;
	align-items: center;
}
.room--total {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	width: 1300px;
	height: 700px;
}
.room--box {
	border-radius: 10px;
	width: 300px;
	height: 120px;
	margin: 10px 20px;
	display: flex;
	flex-direction: column;
	padding: 15px;
	border: 4px solid #9ACBF1;
	justify-content: center;
	align-items: center;
}
</style>
	<div class="content">
		<h2>1:1 실시간 문의</h2>
		<div class="room--total">
			<c:forEach var="room" items="${chatRoomList}">
			    <button class="room--box" onclick="chat('${room.roomName}')"><h4>${room.roomName}의 문의</h4></button>
			</c:forEach>
		</div>
	</div>
</main>
<script>
    function chat(roomName){
        location.href= "/manager/chatRoom/"+roomName
    }
</script>
</body>
</html>
