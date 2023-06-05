<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
	<div class="content">
		<c:forEach var="room" items="${chatRoomList}">
		    <button onclick="chat('${room.roomName}')">${room.roomName}</button>
		</c:forEach>
	</div>
</main>
<script>
    function chat(roomName){
        location.href= "/manager/chatRoom/"+roomName
    }
</script>
