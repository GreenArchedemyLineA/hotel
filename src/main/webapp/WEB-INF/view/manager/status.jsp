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

td, th, button {
	color: black;
}
</style>
		<div class="content">
			<div class="main--content">
				<button type="button" onclick="location.href='/manager/userList'">돌아가기</button>
				<form>
					<h3>option</h3>
					<input type="checkbox" name="roomStatus">
					<input type="number" name="numberOfP" max="10" value="5"> 
					<input type="number" name="price"> 
					<input type="submit">
				</form>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">방 이름</th>
							<th scope="col">방 가격</th>
							<th scope="col">방 사용유무</th>
							<th scope="col">방 상태</th>
							<th scope="col">방 수용 인원</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="room" items="${roomList}">
							<tr onclick="statusDetail(${room.id})">
								<td>${room.roomType.name}</td>
								<td>${room.roomType.price}</td>
								<td>${room.availability == true ? "사용가능" : "사용불가"}</td>
								<td>${room.statusDesc}</td>
								<td>${room.roomType.numberOfP}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</main>
<script>
    function statusDetail(id){
        location.href = "/manager/roomStatusDetail?roomId="+id;
    }
</script>
</body>
</html>